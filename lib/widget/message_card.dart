import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../screens/detail_screen.dart';
import '../provider/messages.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<Messages>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: service.id);
      },
      child: Card(
        child: ListView(
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(service.date!),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    service.imgUrl!),
                backgroundColor: Colors.transparent,
                radius: 40,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.title!),
                  Text(service.time!),
                ],
              ),
              subtitle: Text(service.description!,
                maxLines: 2,),
            ),
          ],
        ),
      ),
    );
  }
}

