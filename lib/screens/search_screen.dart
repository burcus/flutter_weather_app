import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';

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
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    color: CustomColors().lightLila,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FractionallySizedBox(
                  heightFactor: 0.4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(250))),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250),
                  child: FractionallySizedBox(
                    heightFactor: 0.08,
                    widthFactor: 0.85,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
  children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        CustomColors().darkLila,
                        CustomColors().lightLila
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                  ),
                ),
              )
            ],
 */
