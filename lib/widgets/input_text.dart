import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/utils.dart';

class InputText extends StatefulWidget {
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  String _hintText = Strings.searchBarHint;

  void initState() {
    super.initState();
    _textController.addListener(() {});
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) setState(() => _hintText = "");
      if (!_focusNode.hasFocus)
        setState(() => _hintText = Strings.searchBarHint);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      focusNode: _focusNode,
      controller: _textController,
      cursorColor: Colors.white70,
      style: CustomTextTheme(context).body1,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.search,
      onSubmitted: (param) {
        context.bloc<WeatherBloc>().add(GetWeatherInfo(param));
        context.bloc<NetworkBloc>().add(
            UpdateConnectivityState()); //avoid shows welcome back when network is reconnected but no place
        _textController.clear();
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: CustomTextTheme(context).body1,
          contentPadding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white38,
          )),
    );
  }
}