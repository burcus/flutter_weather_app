import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';
import 'package:flutterweatherapp/widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Whather?'),
                    ]
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors().softYellow
                    ),
                  ),
                ),
              ),
              SearchBar(),
            ],
          ),
        );
      },
    );
  }
}