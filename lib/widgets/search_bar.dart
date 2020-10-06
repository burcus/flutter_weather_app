import 'package:flutter/material.dart';
import 'package:flutterweatherapp/widgets/input_text.dart';

class SearchBar extends StatelessWidget {
  Widget build(BuildContext context) => SearchBarContent();
}

class SearchBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.8,
      width: MediaQuery.of(context).size.width * 0.98,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.2),
        border: Border.all(width: 2, color: Colors.white.withOpacity(0.08)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InputText(),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (param) =>
              context.bloc<WeatherBloc>().add(GetWeatherInfo(param)),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Which city?",
              hintStyle: TextStyle(color: CustomColors().softGray),
              suffixIcon: Icon(
                Icons.search,
                color: CustomColors().softGray,
              )),
        ),
      ),
    );
  }
 */
