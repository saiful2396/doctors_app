import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/message_provider.dart';
import '../widget/message_card.dart';

class DashBoardScreen extends StatelessWidget {
  static const routeName = "dashBoard";
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = Provider.of<MessageProvider>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://img.freepik.com/free-psd/doctor-with-his-arms-crossed-white-background_1368-22255.jpg?w=900"),
            backgroundColor: Colors.transparent,
            radius: 20,
          ),
        ),
        title: const Text("Messages"),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 70,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                  border: Border.all(color: Colors.black),
                  color: Colors.black12),
              width: 260,
              height: 35,
              child: TextButton(
                onPressed: () {
                  // showSearch(
                  //   context: context,
                  //   delegate: Search(products.allProducts),
                  // );
                },
                child: Row(
                  children: const [
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: msg.length,
            itemBuilder: (BuildContext context, int index)
            => ChangeNotifierProvider.value(
              value: msg[index],
              child: const MessageCard(),
            ),
          ),
        ],
      ),
    );
  }
}