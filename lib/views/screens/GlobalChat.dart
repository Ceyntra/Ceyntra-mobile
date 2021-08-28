import 'dart:async';
import 'dart:convert';
import 'package:ceyntra_mobile/models/ChatMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';


final socketUrl = 'http://10.0.2.2:8080/chat';

class GlobalChatScreen extends StatefulWidget {
  const GlobalChatScreen({Key key}) : super(key: key);


  @override
  _GlobalChatScreenState createState() => _GlobalChatScreenState();
}

class _GlobalChatScreenState extends State<GlobalChatScreen> {

  StompClient stompClient;
  SharedPreferences preferences;
  String message = '';
  int userID;

  //All initial chat messages
  List<ChatMessage> chatMessages= [];

  final ScrollController _scrollController = ScrollController();



  void onConnect( StompFrame frame) async{

    //acess to shared prefenrences
    preferences = await SharedPreferences.getInstance();
    //Get userID of the logged in user
    userID=preferences.get("userID");
    //userID=3;

    print("Connecting to ws server ...");
    stompClient.subscribe(
        destination: '/topic/globalchat',
        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> result = json.decode(frame.body);
            print(result);
            setState(() => message = result['message']);
          }
        });
  }

  void send(ChatMessage chatMessage){
    print("Sending......");
    print(chatMessage.toString());

    setState(() {
      chatMessages.add(chatMessage);
    });

    stompClient.send(destination: '/app/message', body: json.encode({'id': 0,'senderId': chatMessage.senderID,'senderName':'','content': chatMessage.content,'timestamp':''}), headers: {});
  }


  Future<void> loadAllData() async {
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:8080/allmessages'));

    final messages = json.decode(response.body);
    print(messages);
    chatMessages = (messages as List)
        .map((message) => ChatMessage.fromJson(message))
        .toList();

    print(chatMessages[0]);
    //Display

   //jsonDecode(response.body)['candidates'][0]['geometry']['location'];
  }


  @override
   initState() {
    // TODO: implement initState
    super.initState();
    //Load all messages
    loadAllData();

    if (stompClient == null) {
      stompClient = StompClient(
          config: StompConfig.SockJS(
            url: socketUrl,
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
          onTap: null,
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Ceyntra Chat'),
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
                    child: ListView.builder(
                      itemCount: chatMessages.length,
                      itemBuilder: (context,index)=>Message(message: chatMessages[index],userID:userID),
                        // Text("Chat Text",
                        //   style: TextStyle(color: Colors.white),
                        // ),
                    ),
                  ),
              ),
              //Input field
              ChatInputField(userID:userID,send: send,),
            ],
          ),
        ),

      ),
    );;
  }
}

class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.message,
    @required this.userID,
  }) : super(key: key);

  final ChatMessage message;
  final int userID;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.senderID == userID ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if(message.senderID != userID) ...[
          CircleAvatar(
            radius: 12,
            child: Text(message.senderName[0]),
          ),
        ],
        TextMessage(message: message, userID:userID),
      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key key,
    @required this.message,
    @required this.userID,
  }) : super(key: key);

  final ChatMessage message;
  final int userID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color:  message.senderID == userID ? Colors.blueAccent.withOpacity(0.5) : Colors.blueAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message.senderID != userID ? Container(
            child: Text(message.senderName,
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ) : Container(),
          Text(message.content,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),

    );
  }
}


class ChatInputField extends StatefulWidget {

  const ChatInputField({
    Key key, this.userID, this.send
  }) : super(key: key);

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
                          widget.send(ChatMessage(id:0,content:content, senderID: widget.userID,senderName: '',));
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




