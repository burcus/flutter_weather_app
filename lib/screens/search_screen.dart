import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/screens/screens.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

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
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadSuccess) {
          //TODO CHECK HERE
          final weather = state.weather;
          final weathers = weather.result;
          context.bloc<ThemeBloc>().add(GetTheme(weathers[0])); //use single bloc listener instead of multi listener cause theme state will be checked already in present screen
          //Navigator.push(context, PresentScreen.route());
          //WidgetsBinding.instance.addPostFrameCallback((_) { Navigator.push(context, PresentScreen.route()); } //get rid of error which caused by trying to change widget before it is ready not yet
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                      decoration:
                      BoxDecoration(color: CustomColors().softYellow),
                    ),
                  ),
                ),
                WeatherSearchBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}


  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: CustomColors().scaffoldBg.withOpacity(0.7),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                              colors: [
                            CustomColors().softGray.withOpacity(0.9),
                            CustomColors().softGray.withOpacity(0.8),
                            //Colors.white.withOpacity(0.5),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(rect);
                    },
                    child: weatherThemeImage(
                        context, "assets/images/default.jpg")),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: Hero(
                    tag: "search_bar",
                    child: SearchBar(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

   */
