import 'dart:convert';
import 'package:ceyntra_mobile/models/ChatRoomModel.dart';
import 'package:ceyntra_mobile/models/PrivateChatMessage.dart';
import 'package:ceyntra_mobile/views/widgets/ChatInputField.dart';
import 'package:ceyntra_mobile/views/widgets/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ServiceChatScreen extends StatefulWidget {
  const ServiceChatScreen({Key key,@required this.chatRoomModel, @required this.userID }) : super(key: key);

  final ChatRoomModel chatRoomModel;
  final int userID;

  @override
  _ServiceChatScreenState createState() => _ServiceChatScreenState();
}

class _ServiceChatScreenState extends State<ServiceChatScreen> {

  List<PrivateChatMessage> messages=[];

  StompClient stompClient;

  SharedPreferences preferences;

  String message;

  final chatServerURL = 'http://10.0.2.2:8080/ws';

  void send(PrivateChatMessage chatMessage){
    print("Sending......");
    print(chatMessage.toString());

    setState(() {
      messages.add(chatMessage);
    });

    print(messages.length.toString());

    stompClient.send(destination: '/app/chat', body: json.encode(
        {'id': 0,'senderId': chatMessage.senderId,'recipientId': widget.chatRoomModel.travellerId,'content': chatMessage.content,'timestamp':''}),
        headers: {});
  }



  void onConnect( StompFrame frame) async{

    //userID
    print("User ID: "+ widget.userID.toString());

    print("Connecting to ws server ...");
    stompClient.subscribe(
        destination: '/user/" + ${widget.userID}+ "/queue/messages',

        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> result = json.decode(frame.body);
            print(result);
            setState(() => message = result['message']);
          }
        });
  }

  void onDisConnect(){
    stompClient.deactivate();
    print('Disconnected......');
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Load existing messages
    setState(() {
      messages=widget.chatRoomModel.chatMessageSet;
    });

    //Create Stomp connection
    if (stompClient == null) {
      stompClient = StompClient(
          config: StompConfig.SockJS(
            url: chatServerURL,
            onConnect:onConnect,
            onWebSocketError: (dynamic error) => print(error.toString()),
          ));
      stompClient.activate();
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        // elevation: 20,
        brightness: Brightness.dark,
        // leading: Icon(Icons.arrow_back),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
              //Disconnect stomp
              onDisConnect();
              Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(widget.chatRoomModel.travellerName),
        backgroundColor: Color(0xff031925),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),

        child: SafeArea(
          child: Column(
            children: [
              //Send to bottom
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child:  ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context,index)=>Message(message: messages[index],userID:widget.userID),
                  ),
                ),
              ),
              //Input field
              ChatInputField(userID: widget.userID,send: send,),
            ],
          ),
        ),

      ),
    );
  }
}
