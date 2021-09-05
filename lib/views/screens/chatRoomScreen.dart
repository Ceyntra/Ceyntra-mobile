import 'package:ceyntra_mobile/models/ChatRoomModel.dart';
import 'package:ceyntra_mobile/service/ChatRoomService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ServiceChatScreen.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key key}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {

  int userID;

  List<ChatRoomModel> chatRooms=[];


  Future<void> loadData() async {

    ChatRoomService chatRoomService=new ChatRoomService();
    int id= await chatRoomService.getUserID();
    List<ChatRoomModel> cr= await chatRoomService.loadChatRooms(id);

    setState(() {
      chatRooms=cr;
      userID=id;
    });
    print(chatRooms[0].toString());
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //load data
    loadData();
  }

  void onPressChatRoom(ChatRoomModel chatRoomModel){
    print("You pressed");
    print(chatRoomModel.lastMessage.content);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServiceChatScreen(chatRoomModel: chatRoomModel,userID: userID)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Chat'),
        backgroundColor: Color(0xff031925),
      ),
      body: ListView.builder(
          itemCount: chatRooms.length,
          itemBuilder: (context,index) => ChatRoom(pressChatRoom: onPressChatRoom,chatRoomModel: chatRooms[index],),
      ),
    );
  }
}

class ChatRoom extends StatelessWidget {

  const ChatRoom({Key key, @required this.pressChatRoom, @required this.chatRoomModel}) : super(key: key);

  final ChatRoomModel chatRoomModel;

  final pressChatRoom;

  // final VoidCallback pressChatRoom(ChatRoomModel chatRoomModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pressChatRoom(chatRoomModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(chatRoomModel.imageUrl),
                  radius: 35,
                ),

                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: chatRoomModel.active ? Colors.green : Colors.amber,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),
            Expanded(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    Text(
                      chatRoomModel.travellerName,
                      style: TextStyle(fontSize:15 ,color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8,),
                    //last msg
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chatRoomModel.lastMessage.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                Text(chatRoomModel.lastMessage.timestamp.minute.toString() +':' +chatRoomModel.lastMessage.timestamp.second.toString(), style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                ),

                SizedBox(height: 8,),

                //Unseen # messages
                Container(

                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('2',
                      style:TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


