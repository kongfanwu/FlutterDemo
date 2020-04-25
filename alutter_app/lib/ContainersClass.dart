
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Flutter中尺寸限制类容器组件包括ConstrainedBox、UnconstrainedBox、SizedBox、AspectRatio、FractionallySizedBox、LimitedBox、Container。这些组件可以约束子组件的尺寸，下面一一介绍。
/*
这么多约束类的容器组件，到底要使用哪一个组件呢？总结如下：

ConstrainedBox：适用于需要设置最大/小宽高，组件大小以来子组件大小，但不能超过设置的界限。
UnconstrainedBox：用到情况不多，当作ConstrainedBox的子组件可以“突破”ConstrainedBox的限制，超出界限的部分会被截取。
SizedBox：适用于固定宽高的情况，常用于当作2个组件之间间隙组件。
AspectRatio：适用于固定宽高比的情况。
FractionallySizedBox：适用于占父组件百分比的情况。
LimitedBox：适用于没有父组件约束的情况。
Container：适用于不仅有尺寸的约束，还有装饰（颜色、边框、等）、内外边距等需求的情况。
* */
class ContainersClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // ConstrainedBox: 约束子组件不可超过限制
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 60, maxWidth: 200),
          child: Container(height: 300, width: 300, color: Colors.red),
        ),
        // 约束的子组件允许超过自身限制，但是自身受父组件限制，debug 会给提示，release 超出部分会被截取。
//        Container(
//          height: 200,
//          width: 200,
//          child: UnconstrainedBox(
//            child: Container(height: 300, width: 300, color: Colors.red),
//          ),
//        ),

       //  让子组件大小等于限制的大小
        SizedBox(
          height: 60,
          width: 300,
          child: RaisedButton(
            child: Text('this is SizedBox'),
          ),
        ),
        Column(
          children: <Widget>[
            Container(height: 30, color: Colors.red,),
            SizedBox(height: 10,), //  SizedBox可以没有子组件，但仍然会占用空间，所以SizedBox非常适合控制2个组件之间的空隙
            Container(height: 30, color: Colors.blue,),
          ],
        ),
        // AspectRatio组件是固定宽高比的组件，如果组件的宽度固定，希望高是宽的1/4，可以用AspectRatio实现此效果，用法如下：
        AspectRatio(
          aspectRatio: 4 / 1,
          child: Container(color: Colors.deepPurpleAccent),
        ),
        // 当我们需要一个控件的尺寸是相对尺寸时，比如当前按钮的宽度占父组件的70%，可以使用FractionallySizedBox来实现此效果。
        FractionallySizedBox(
          widthFactor: .7,
//          alignment: Alignment.center,
          child: RaisedButton(
            child: Text('button'),
          ),
        ),
        // LimitedBox组件是当不受父组件约束时限制它的尺寸，什么叫不受父组件约束？就像这篇文章介绍的其他组件，它们都会对子组件约束，没有约束的父组件有ListView、Row、Column等，如果LimitedBox的父组件受到约束，此时LimitedBox将会不做任何操作，我们可以认为没有这个组件
        Container(
          color: Colors.red,
          height: 100,
          width: 100,
          child: LimitedBox(
            maxHeight: 50, //  maxHeight maxWidth 如果父组件设置了约束，LimitedBox 对应的约束会失效，内容还是会显示。
            maxWidth: 100,
            child: Container(color: Colors.orange,),
          ),
        ),
        //  LimitedBox 例子， 如果 不加 LimitedBox 什么也看不到，因为没有高度，加了 LimitedBox maxHeight 生效，他的子组件 Container 有高度
//        ListView(
//          children: <Widget>[
//            LimitedBox(
//              maxHeight: 30,
//              child: Container(
//                color: Colors.green,
//              ),
//            ),
//            LimitedBox(
//              maxHeight: 30,
//              child: Container(
//                color: Colors.red,
//              ),
//            ),
//          ],
//        ),
      ],
    );
  }
}
