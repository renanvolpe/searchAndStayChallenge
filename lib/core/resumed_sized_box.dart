import 'package:flutter/cupertino.dart';

//this extension is for create SizedBox space more simplify


extension EmptyWidget on num {
  SizedBox get sizeH => SizedBox(
        height: toDouble(),
      );

  SizedBox get sizeW => SizedBox(
        width: toDouble(),
      );
}
