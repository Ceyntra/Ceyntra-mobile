import 'package:ceyntra_mobile/models/ChatMessage.dart';
import 'package:ceyntra_mobile/models/PrivateChatMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Message extends StatelessWidget {
  const Message({Key key,@required this.message, @required this.userID}) : super(key: key);

  final PrivateChatMessage message;
  final int userID;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.senderId == userID ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color:  message.senderId == userID ? Colors.blueAccent.withOpacity(0.5) : Colors.blueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(message.content,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

