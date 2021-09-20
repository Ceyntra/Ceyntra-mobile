import 'dart:convert';
import 'package:ceyntra_mobile/models/ChatRoomModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatRoomService{


  Future<int> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    //Get userID of the logged in user
    return preferences.get("userID");
  }


  Future<List<ChatRoomModel>> loadChatRooms(int userID) async {

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/chatroom/$userID')
    );

    final messages = json.decode(response.body);

    // print(messages);

    List<ChatRoomModel> chatRooms= [];

    chatRooms = (messages as List)
        .map((message) => ChatRoomModel.fromJson(message))
        .toList();

    return chatRooms;
  }

  //Delete Notification for chat room
  deleteNotification(int chatRoomID) async{

    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:9092/deleteNotification/$chatRoomID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

  }






}