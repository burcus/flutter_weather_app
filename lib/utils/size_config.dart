import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _safeAreaHeight;
  static var _safeAreaPadding;
  static double _safeAreaVertical;

  static double _blockWidth;
  static double _blockHeight;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static double cardContainerWidth;


  void init(BuildContext context, Orientation orientation) {
    _safeAreaPadding = MediaQuery.of(context).padding;
    _safeAreaVertical = _safeAreaPadding.top + _safeAreaPadding.bottom;

    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    _safeAreaHeight = _screenHeight - _safeAreaVertical;
    if(orientation == Orientation.landscape) _safeAreaHeight = _screenHeight;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _safeAreaHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    cardContainerWidth = orientation == Orientation.landscape ?  widthMultiplier * 40 : widthMultiplier * 100;
  }
}
