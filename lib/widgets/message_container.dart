import 'package:flutter/cupertino.dart';
import 'package:flutterweatherapp/utils/utils.dart';

class MessageContainer extends StatelessWidget {
  final errorMessage;

  MessageContainer(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Text(this.errorMessage, style: CustomTextTheme(context).warning),
    );
  }
}
