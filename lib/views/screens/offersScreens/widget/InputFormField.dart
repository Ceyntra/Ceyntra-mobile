import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    Key key, this.emptyMsg, this.setValue, this.maxline, this.minline,
  }) : super(key: key);

  final String emptyMsg;
  final Function setValue;
  final int maxline;
  final int minline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      maxLines: maxline,
      minLines: minline,
      validator: (name){
        if(name.isEmpty){
          return emptyMsg;
        }else{
          return null;
        }
      },
      onSaved: setValue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        fillColor: Colors.white,
        filled: true,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
