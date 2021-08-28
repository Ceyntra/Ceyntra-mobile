import 'package:intl/intl.dart';

enum ChatMessageType { content, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final int id;
  final String content;
  final int senderID;
  final String senderName;
  final DateTime timestamp;

  // final ChatMessageType messageType;
  // final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.id,
    this.content = '',
    this.senderID,
    this.senderName,
    this.timestamp,

    this.isSender=false,


  });

  @override
  String toString() {
    return '{id: $id, content: $content, senderID: $senderID, senderName: $senderName, timestamp: $timestamp}';
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id:json['id'],
      content:json['content'],
      senderID:json['senderId'],
      senderName:json['senderName'],
      // timestamp:DateFormat('yyyy-MM-dd – kk:mm').format(json['timestamp']),
      timestamp:DateTime.parse(json['timestamp'])
    );

  }

}

List demoChatMessages = [
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),


  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,

  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,

  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,

  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,

  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,

  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,

  ),
  ChatMessage(
    id:1,
    content: "Hi Sajol,",
    senderID: 2,
    senderName: "Amal Silva",
    timestamp: DateTime(2021,08,26,20,36,52),
    isSender: false,
  ),
];