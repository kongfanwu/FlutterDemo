import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:sdmm/public/GlobalConfig.dart';

// 作者 https://www.jianshu.com/p/edb5bae85732

/* 使用示例
Map<String, dynamic> params = FormData.from({ 'key': 'value'});

DioManager.getInstance().get('/user/list/getInfo', params, (data) {
},(error){
});

DioManager.getInstance().post('url', params, (data) {
}, (error) {
});
* */

/*
 * 网络请求管理类
 */
class DioManager {
  //写一个单例
  //在 Dart 里，带下划线开头的变量是私有变量
  static DioManager _instance;

  static DioManager getInstance() {
    if (_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }

  Dio dio = new Dio();
  DioManager() {
    // Set default configs
    dio.options.headers = {
//      "version":'2.0.9',
//      "Authorization":'_token',
    };
    http://www.weather.com.cn/data/cityinfo/101010100.html
    dio.options.baseUrl = "http://www.weather.com.cn/";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.options.responseType = ResponseType.json;
//    dio.options.contentType = jsonContentType

    dio.options.contentType = Headers.jsonContentType;

//    dio.interceptors
//        .add(LogInterceptor(responseBody: GlobalConfig.isDebug)); //是否开启请求日志
//    dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  //get请求
  get(String url, { Map params, Function successCallBack,
      Function errorCallBack }) async {
    _requstHttp(url, 'get', params: params, successCallBack: successCallBack, errorCallBack: errorCallBack);
  }

  //post请求
  post(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, 'post', params: params, successCallBack: successCallBack, errorCallBack: errorCallBack);
  }

  _requstHttp(String url, String method, { Map params, Function successCallBack, Function errorCallBack }) async {
    Response response;
    try {
      if (method == 'get') {
        if (params != null) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      _error(errorCallBack, error.message);
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('👉 👉 👉 👉 👉');
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
      print('👈 👈 👈 👈');
    }
//    String dataStr = json.encode(response.data);
//    Map<String, dynamic> dataMap = json.decode(dataStr);
    var dataMap = json.decode(response.data);
    if (dataMap == null) {
      _error(
          errorCallBack,
          '错误码：' +
              dataMap['errorCode'].toString() +
              '，' +
              response.data.toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}

/*
 * dio网络请求失败的回调错误码
 */
class ResultCode {
  //正常返回是1
  static const SUCCESS = 1;

  //异常返回是0
  static const ERROR = 1;

  /// When opening  url timeout, it occurs.
  static const CONNECT_TIMEOUT = -1;

  ///It occurs when receiving timeout.
  static const RECEIVE_TIMEOUT = -2;

  /// When the server response, but with a incorrect status, such as 404, 503...
  static const RESPONSE = -3;

  /// When the request is cancelled, dio will throw a error with this type.
  static const CANCEL = -4;

  /// read the DioError.error if it is not null.
  static const DEFAULT = -5;
}
