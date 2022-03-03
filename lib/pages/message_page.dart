import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/message_model.dart';
import 'package:fluttertutorial/widgets/chat_bubble.dart';
import 'package:fluttertutorial/widgets/chat_bubble_me.dart';
import 'package:intl/intl.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<MessageModel> messages = [];
  bool isTypeMessageFocused = false;
  TextEditingController messageController = TextEditingController();
  int counterMessages = 0;

  @override
  Widget build(BuildContext context) {
    Widget chatInput() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isTypeMessageFocused
            ? MediaQuery.of(context).size.width - 30
            : MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(75),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Focus(
                onFocusChange: (focus) {
                  setState(() {
                    isTypeMessageFocused = focus;
                  });
                },
                child: TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Message',
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  MessageModel md = MessageModel(
                      'assets/images/1.png',
                      messageController.text,
                      DateFormat.jm().format(DateTime.now()),
                      messages.length % 2 == 0 ? 'me' : 'not me');
                  messages.add(md);
                  messageController.clear();
                  const snackBar = SnackBar(content: Text('Message sent!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {});
                },
                child: const Icon(Icons.send)),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 135, 135),
      floatingActionButton: chatInput(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 82, 152, 245),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(50, 200),
                  )),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/2.png',
                      height: 55,
                      width: 55,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Group chat',
                        ),
                        Text(
                          '10 members',
                        )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            ...<Widget>[
              for (MessageModel message in messages)
                (message.from == 'me')
                    ? ChatBubbleMe(
                        imageUrl: message.imageUrl,
                        text: message.text,
                        time: message.time)
                    : ChatBubble(
                        imageUrl: message.imageUrl,
                        text: message.text,
                        time: message.time),
            ],
          ],
        ),
      ),
    );
  }
}
