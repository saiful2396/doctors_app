import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Reputation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DoctorScreen(),
    );
  }
}

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _controller;
  late Animation _animationText;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationText = Tween(
      begin: 0.0,
      end: 20.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.ease),
      ),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Text(
                'WELCOME TO BLESS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _animationText.value,
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Image(
                image: AssetImage("assets/images/doctor_logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 128.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DashBoardScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("See Messages"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailScreen(),
                ),
              );
            },
            child: Card(
              child: ListView(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Mar 15, 2020"),
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1651049944~exp=1651050544~hmac=3089755b40f2b404fd3876d3d852bac3d2f3f49a318208d02aa5972d3ed439d2&w=1380"),
                      backgroundColor: Colors.transparent,
                      radius: 40,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Mr. Jhon"),
                        Text("9:45 am"),
                      ],
                    ),
                    subtitle: const Text("Some Description"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
        children: [
          ListTile(
            leading:
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-psd/doctor-with-his-arms-crossed-white-background_1368-22255.jpg?w=900"),
              ),
              title: Text(""),
              subtitle:MessageBubble(sender: "senderText", text: "messgeText", isMe: false)

          )
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
