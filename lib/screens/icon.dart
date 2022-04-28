import 'package:flutter/material.dart';
import 'icons_list.dart';
class IconsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      body: SingleChildScrollView(
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
    );
  }
}