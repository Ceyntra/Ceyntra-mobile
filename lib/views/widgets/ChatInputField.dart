import 'package:ceyntra_mobile/models/ChatMessage.dart';
import 'package:ceyntra_mobile/models/PrivateChatMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatInputField extends StatefulWidget {
  const ChatInputField({Key key, this.send, this.userID}) : super(key: key);

  final Function send;
  final int userID;


  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  String content='';
  final formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Row(
        children:[
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.amber
                .withOpacity(0.64),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Form(
                key: formKey,
                child: Row(
                  children: [
                    SizedBox(width: 15.0,),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),

                        onChanged: (val){
                          print(val);
                          setState(() {
                            content=val;
                          });
                        },
                      ),
                    ),

                    SizedBox(width: 10.0,),
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.amber
                            .withOpacity(0.64),
                      ),
                      onTap: (){
                        if(!content.isEmpty){

                          formKey.currentState.reset();
                          widget.send(new PrivateChatMessage(0,widget.userID,0,content,null));
                          print(content);

                          setState(() {
                            content='';
                          });
                        }
                      },
                    ),
                    SizedBox(width: 15.0,),
                  ],
                ),
              ),
            ),
          )
        ]
    );
  }
}
