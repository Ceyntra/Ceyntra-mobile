import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateFormField extends StatelessWidget {
  const UpdateFormField({
    Key key, this.emptyMsg, this.setValue, this.maxline, this.minline, this.initialName,
  }) : super(key: key);

  final String emptyMsg;
  final Function setValue;
  final int maxline;
  final int minline;
  final String initialName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      maxLines: maxline,
      minLines: minline,
      initialValue: initialName,
      validator: (name){
        if(name.isEmpty){
          return emptyMsg;
        }else{
          return null;
        }
      },
      onSaved: setValue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        fillColor: Colors.white,
        filled: true,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
