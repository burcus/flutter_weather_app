import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double safeAreaHeight;
  static var _safeAreaPadding;
  static double safeAreaVertical;

  static double _blockWidth;
  static double _blockHeight;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static double cardContainerWidth;


  void init(BuildContext context, Orientation orientation) {
    _safeAreaPadding = MediaQuery.of(context).padding;
    safeAreaVertical = _safeAreaPadding.top + _safeAreaPadding.bottom;

    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    safeAreaHeight = _screenHeight - safeAreaVertical;
    if(orientation == Orientation.landscape) safeAreaHeight = _screenHeight;

    _blockWidth = _screenWidth / 100;
//    _blockHeight = _safeAreaHeight / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = orientation == Orientation.portrait ? _blockHeight : _blockHeight * 1.2;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    cardContainerWidth = orientation == Orientation.landscape ?  widthMultiplier * 40 : widthMultiplier * 100;
  }
}
