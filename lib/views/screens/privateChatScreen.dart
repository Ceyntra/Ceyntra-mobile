import 'dart:convert';
import 'package:ceyntra_mobile/models/PrivateChatMessage.dart';
import 'package:ceyntra_mobile/service/ChatService.dart';
import 'package:ceyntra_mobile/views/widgets/ChatInputField.dart';
import 'package:ceyntra_mobile/views/widgets/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class PrivateChatScreen extends StatefulWidget {
  const PrivateChatScreen({Key key,@required this.serviceProviderID}) : super(key: key);

  final int serviceProviderID;

  @override
  _PrivateChatScreenState createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {

  int _userID=600;

  List<PrivateChatMessage> messages=[];

  ChatService chatService=ChatService();

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
        {'id': 0,'senderId': chatMessage.senderId,'recipientId': widget.serviceProviderID,'content': chatMessage.content,'timestamp':''}),
        headers: {});
  }



  void onConnect( StompFrame frame) async{

    //userID
    print("User ID: "+ _userID.toString());

    print("Connecting to ws server ...");
    stompClient.subscribe(
        destination: '/user/" + $_userID+ "/queue/messages',

        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> result = json.decode(frame.body);
            print(result);
            setState(() => message = result['message']);
          }
        });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();

    //Load existing messages

    //Create Stomp connection
    if (stompClient == null) {
      stompClient = StompClient(
          config: StompConfig.SockJS(
            url: chatService.chatServerURL,
            onConnect:onConnect,
            onWebSocketError: (dynamic error) => print(error.toString()),
          ));
      stompClient.activate();
    }

  }

  Future<void> loadData() async {

    //acess to shared prefenrences
    preferences = await SharedPreferences.getInstance();

    //Get userID of the logged in user
    setState(() {
      _userID=preferences.get("userID");
      //_userID=600;
    });

    print("Loading data........");

    List<PrivateChatMessage> chtMsg=await chatService.loadMessages(_userID, widget.serviceProviderID); //widget.serviceProviderID

    setState(() {
      messages=chtMsg;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),

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
                      itemBuilder: (context,index)=>Message(message: messages[index],userID:_userID),
                    ),
                  ),
                ),
              //Input field
              ChatInputField(userID: _userID,send: send,),
            ],
          ),
        ),

      ),
    );
  }
}
