
class PrivateChatMessage {

  int id;
  int senderId;
  int recipientId;
  String content;
  DateTime timestamp;


  PrivateChatMessage(
      this.id, this.senderId, this.recipientId, this.content, this.timestamp);

  factory PrivateChatMessage.fromJson(Map<String, dynamic> json) {

    PrivateChatMessage msg= new PrivateChatMessage(
        json['id'],
        json['senderId'],
         json['recipientId'],
        json['content'],
        // timestamp:DateFormat('yyyy-MM-dd – kk:mm').format(json['timestamp']),
       DateTime.parse(json['timestamp'])
    );

    return msg;
  }

  @override
  String toString() {
    return 'PrivateChatMessage{id: $id, senderId: $senderId, recipientId: $recipientId, content: $content, timestamp: $timestamp}';
  }
}