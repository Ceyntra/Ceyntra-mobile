import 'dart:convert';
import 'package:ceyntra_mobile/models/PrivateChatMessage.dart';
import 'package:http/http.dart' as http;

//Private chat
class ChatService{

  final String chatServerURL = 'http://10.0.2.2:8080/ws';


  //Returns Message widgets
  Future<List<PrivateChatMessage>> loadMessages(int userID,int serviceProviderID) async {

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/messages/$userID/$serviceProviderID')
    );

    final messages = json.decode(response.body);

    List<PrivateChatMessage> chatMessages= [];

    chatMessages = (messages as List)
        .map((message) => PrivateChatMessage.fromJson(message))
        .toList();


    return chatMessages;
  }
















}