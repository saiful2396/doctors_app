import 'package:doctors_app/provider/messages.dart';
import 'package:flutter/material.dart';

class MessageProvider with ChangeNotifier {
  final List<Messages> _items = [
    Messages(
      id: 'm1',
      title: 'Mr. Jhon',
      description:
          'Your recommended medication was ideal for my situation. I took th e prescribed medicine daily, and I feel completely recovered. Thank you very much. It felt like a great weight had been lifted off my shoulders.',
      imgUrl:
          'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1651049944~exp=1651050544~hmac=3089755b40f2b404fd3876d3d852bac3d2f3f49a318208d02aa5972d3ed439d2&w=1380',
      date: "May 10 2020",
      time: "9:45 am",
      isMe: true,
    ),
    Messages(
      id: 'm2',
      title: 'Fiana',
      description:
          ' Hey this is Fiana, Thanks for your time, I am fully recover now. thanks for your recommended medicine',
      imgUrl:
          'https://img.freepik.com/free-photo/smiling-confident-businesswoman-posing-with-arms-folded_1262-20950.jpg?t=st=1651088872~exp=1651089472~hmac=04db3b856739e3e0222ae11efb5e8a8520292558611aa2de13666fd92f01d222&w=740',
      date: "May 10 2020",
      time: "9:45 am",
      isMe: true,
    ),
    Messages(
      id: 'm3',
      title: 'Natasa',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      imgUrl:
          'https://www.freepik.com/free-photo/studio-portrait-successful-young-businesswoman_1305701.htm?query=women&page=1&query=w&from_query=undefined&position=1&from_view=detail',
      date: "May 22 2021",
      time: "11:45 am",
      isMe: true,
    ),
    Messages(
      id: 'm4',
      title: 'Alexander',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
      imgUrl:
          'https://www.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_10421502.htm',
      date: "Jan 10 2020",
      time: "2:45 pm",
      isMe: true,
    ),
  ];

  List<Messages> get items {
    return [..._items];
  }

  Messages findById(String id) {
    return _items.firstWhere((messages) => messages.id == id);
  }
}
