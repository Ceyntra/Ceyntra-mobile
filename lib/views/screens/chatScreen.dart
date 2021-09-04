import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: InkWell(
          onTap: null,
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Chat'),
        backgroundColor: Color(0xff031925),
      ),
      body: ListView(
        children: [
          ChatRoom(),
        ],
      ),
    );
  }
}

class ChatRoom extends StatefulWidget {
  ChatRoom({Key key,this.isOnline,this.senderName,this.unSeenMessages}) : super(key: key);
  bool isOnline;
  String senderName;
  int unSeenMessages;

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10.0),
              child: Stack(
                children: [
                    Container(
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset('assets/images/g1.jpeg',
                        ),
                      ),
                    ),
                  Positioned(  // draw a red marble
                    top: 0.0,
                    left: 0.0,
                    child: Icon(Icons.brightness_1, size: 20.0,
                        color: Colors.redAccent),
                  ),

                ],
              ),
          ),
          Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text("Elizabeth",
                          style: GoogleFonts.montserrat(
                                  color: Colors.white, fontWeight: FontWeight.w700),
                          ),

                        Text("12:30",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text("Elizabeth :",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),

                        Text("Finally Found a way !",
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

