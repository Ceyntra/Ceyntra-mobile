
// {
// "chatRoom": {
// "chatRoomId": 9,
// "senderId": 3,
// "recipientId": 4,
// "chatMessageSet": [
// {
// "id": 19,
// "senderId": 3,
// "recipientId": 4,
// "content": "Hi shehan",
// "timestamp": "2021-09-04T09:14:22.000+00:00"
// }
// ]
// },
// "travellerId": 3,
// "travellerName": "Shehan Sandeepa",
// "imageUrl": "https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fppt.jpg?alt=media&token=5889a380-2227-4639-bcd0-638b2556cc7c",
// "lastMessage": {
// "id": 19,
// "senderId": 3,
// "recipientId": 4,
// "content": "Hi shehan",
// "timestamp": "2021-09-04T09:14:22.000+00:00"
// },
// "active": false
// },



import 'package:ceyntra_mobile/models/ChatMessage.dart';
import 'package:ceyntra_mobile/models/PrivateChatMessage.dart';

class ChatRoom{

  final int chatRoomId;
  final int userId;   //SenderId
  final int travellerId;
  final List<PrivateChatMessage> chatMessageSet;
  final String travellerName;
  final imageUrl;
  final PrivateChatMessage lastMessage;
  final bool active;


  ChatRoom({
      this.chatRoomId,
      this.userId,
      this.travellerId,
      this.chatMessageSet,
      this.travellerName,
      this.imageUrl,
      this.lastMessage,
      this.active});

// final String name, lastMessage, image, time;
  // final bool isActive;
  //
  // ChatRoom({
  //   this.name = '',
  //   this.lastMessage = '',
  //   this.image = '',
  //   this.time = '',
  //   this.isActive = false,
  // });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {

    //Extract ChatMessageSet
    List<PrivateChatMessage> chatMessages= [];

    chatMessages = (json['chatRoom']['chatMessageSet'] as List)
        .map((message) => PrivateChatMessage.fromJson(message))
        .toList();

    return ChatRoom(
        chatRoomId: json['chatRoom']['chatRoomId'],
        userId: json['chatRoom']['senderId'],
        travellerId: json['travellerId'],
        chatMessageSet: chatMessages,
        travellerName:json['travellerName'],
        imageUrl:json['imageUrl'],
        lastMessage:PrivateChatMessage.fromJson(json['lastMessage']),
        active:json['active']
    );

  }





}
//
// List chatsData = [
//   ChatRoom(
//     name: "Jenny Wilson",
//     lastMessage: "Hope you are doing well...",
//     image: "assets/images/user.png",
//     time: "3m ago",
//     isActive: false,
//   ),
//   ChatRoom(
//     name: "Esther Howard",
//     lastMessage: "Hello Abdullah! I am...",
//     image: "assets/images/user_2.png",
//     time: "8m ago",
//     isActive: true,
//   ),
//   ChatRoom(
//     name: "Ralph Edwards",
//     lastMessage: "Do you have update...",
//     image: "assets/images/user_3.png",
//     time: "5d ago",
//     isActive: false,
//   ),
//   ChatRoom(
//     name: "Jacob Jones",
//     lastMessage: "You’re welcome :)",
//     image: "assets/images/user_4.png",
//     time: "5d ago",
//     isActive: true,
//   ),
//   ChatRoom(
//     name: "Albert Flores",
//     lastMessage: "Thanks",
//     image: "assets/images/user_5.png",
//     time: "6d ago",
//     isActive: false,
//   ),
//   ChatRoom(
//     name: "Jenny Wilson",
//     lastMessage: "Hope you are doing well...",
//     image: "assets/images/user.png",
//     time: "3m ago",
//     isActive: false,
//   ),
//   ChatRoom(
//     name: "Esther Howard",
//     lastMessage: "Hello Abdullah! I am...",
//     image: "assets/images/user_2.png",
//     time: "8m ago",
//     isActive: true,
//   ),
//   ChatRoom(
//     name: "Ralph Edwards",
//     lastMessage: "Do you have update...",
//     image: "assets/images/user_3.png",
//     time: "5d ago",
//     isActive: false,
//   ),
// ];