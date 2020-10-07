import 'package:flutter/cupertino.dart';

class NetworkErrorScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) => _NetworkError();
}

class _NetworkError extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("net yok");
  }
}