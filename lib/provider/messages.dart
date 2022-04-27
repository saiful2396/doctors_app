import 'package:flutter/foundation.dart';

class Messages with ChangeNotifier {
  String? id;
  String? title;
  String? description;
  String? imgUrl;
  String? date;
  String? time;
  bool? isMe;

  Messages({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.date,
    required this.time,
    required this.isMe,
  });
}