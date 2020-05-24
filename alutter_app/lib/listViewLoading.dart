import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewLoading extends StatefulWidget {
  @override
  _ListViewLoadingState createState() => _ListViewLoadingState();
}

class _ListViewLoadingState extends State<ListViewLoading> {

  static const loadingTag = '##loading##'; // 表末尾标记
  var _words = <String>[loadingTag]; // 加入标记

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        final newDataList = generateWordPairs().take(10).map((e) => e.asPascalCase).toList();
        _words.insertAll(_words.length - 1, newDataList);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(title: Text('商品列表'),),
      Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            if (_words[index] == loadingTag) {
              if (_words.length < 50) {
                _retrieveData();
                return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Text('没有更多了', style: TextStyle(color: Colors.grey),),
                );
              }
            }
            return ListTile(title: Text(_words[index]),);
          },
          separatorBuilder: (context, index) {
            return Divider(height: .0,);
          },
          itemCount: _words.length,
        ),

      ),
    ],);
  }
}
