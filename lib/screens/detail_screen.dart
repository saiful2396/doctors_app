import 'package:flutter/material.dart';

import 'icons_list.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = "detail";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //IconData? _newIcon;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: icons.map((iconData)=>InkWell(
                child: Opacity(
                  opacity: .7,
                  child: Icon(iconData,size: 60.0,color: Colors.green),
                ),
                onTap: (){
                  Navigator.of(context).pop<IconData>(iconData);
                },
              )).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-psd/doctor-with-his-arms-crossed-white-background_1368-22255.jpg?w=900"),
              backgroundColor: Colors.transparent,
              radius: 20,
            ),
            SizedBox(width: 10),
            Text("Mr. Jhon"),
          ],
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-psd/doctor-with-his-arms-crossed-white-background_1368-22255.jpg?w=900"),
            ),
            title: Text(""),
            subtitle: MessageBubble(
                sender: "senderText", text: "messgeText", isMe: false),
            trailing: GestureDetector(
              onTap: () {
                _showMyDialog();
              },
              child: const Text("😀"),
            ),
            /*trailing: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => debugPrint("hello"),
                    child: const Image(
                      image: AssetImage("assets/images/Vector.png"),
                      width: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     _showMyDialog();
                    },
                    child: const Text("😀"),
                  ),
                ),
              ],
            ),*/
          ),
          //Positioned(bottom:10,child: Icon(Icons.sentiment_satisfied))
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageBubble({required this.sender, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15, color: isMe ? Colors.white : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
