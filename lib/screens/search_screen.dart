import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';
import 'package:flutterweatherapp/widgets/searchbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen._();

  // you can add here blocs or providers you need for this screen only
  // that is why we keep this widget separated from the actual UI which is in _Search
  @override
  Widget build(BuildContext context) {
    return const _Search();
  }

  static Route route() => MaterialPageRoute(
        builder: (_) => const SearchScreen._(),
      );
}

class _Search extends StatelessWidget {
  const _Search({Key key}) : super(key: key);

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
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(text: 'Whather?'),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(color: CustomColors().softYellow),
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
