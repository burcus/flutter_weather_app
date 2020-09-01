import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearableText extends StatefulWidget{
  @override
  _ClearableTextState createState() => _ClearableTextState();

}

class _ClearableTextState extends State<ClearableText> {
  final textController = TextEditingController();

  void initState() {
    super.initState();
    textController.addListener(() {
      _clearStatus;
    });
  }

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
    );
  }

  _clearStatus(){
    if(this.textController.text.length > 0){
    }
  }
}