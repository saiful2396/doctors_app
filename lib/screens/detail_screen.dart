import 'package:doctors_app/provider/message_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/constant.dart';
import 'icon.dart';
import 'icons_list.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = "detail";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  IconData? _newIcon;
  final messageTextController = TextEditingController();
  late FocusNode myFocusNode;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: icons
                  .map((iconData) => InkWell(
                        child: Opacity(
                          opacity: .7,
                          child: Icon(iconData, color: Colors.green),
                        ),
                        onTap: () {
                          Navigator.of(context).pop<IconData>(iconData);
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageId = ModalRoute.of(context)?.settings.arguments.toString();
    final loadedServices = Provider.of<MessageProvider>(context, listen: false)
        .findById(messageId!);
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
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(loadedServices.imgUrl!),
              ),
              title: const Text(""),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        MessageBubble(
                          sender: loadedServices.title!,
                          text: loadedServices.description!,
                          isMe: loadedServices.isMe!,
                        ),
                        Positioned(
                            right: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            child: Icon(_newIcon , color: Colors.green))
                      ],
                    ),
                  ),
                  //const SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          myFocusNode.requestFocus();
                        });
                      },
                      child: const Image(
                        image: AssetImage("assets/images/Vector.png"),
                        height: 30,
                        width: 30,
                      )),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      var IconData = await
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>IconsPage()));
                      setState(() {
                        _newIcon = IconData;
                      });
                    },
                    child: const Text(
                      "😀",
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SingleChildScrollView(
              child: Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        focusNode: myFocusNode,
                        controller: messageTextController,
                        onChanged: (value) {
                          loadedServices.description = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          messageTextController.clear();
                          loadedServices.addListener(() {
                            loadedServices.isMe = false;
                            loadedServices.description = messageTextController.text;
                          });
                          //
                          // _firestore.collection('messages').add({
                          //   'text': messageText,
                          //   'sender': loggedInUser
                          // }),
                        },
                        child: const Text(
                          'Send',
                          style: kSendButtonTextStyle,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  const MessageBubble(
      {Key? key, required this.sender, required this.text, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
