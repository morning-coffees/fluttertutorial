import 'package:flutter/material.dart';
import 'package:fluttertutorial/widgets/chat_bubble.dart';
import 'package:fluttertutorial/widgets/chat_bubble_me.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  bool isTypeMessageFocused = false;

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
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Message',
                  ),
                ),
              ),
            ),
            const Icon(Icons.send)
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
                          'Moba Analog',
                        ),
                        Text(
                          '14,209 members',
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
            const ChatBubble(
                imageUrl: 'assets/images/1.png',
                text: 'How are you guys? ',
                time: '2:30'),
            const ChatBubble(
                imageUrl: 'assets/images/1.png',
                text: 'Find here :P',
                time: '3:11'),
            const ChatBubbleMe(
                imageUrl: 'assets/images/1.png',
                text: 'Thinking about how people .. hmmmmm',
                time: '3:15'),
            const ChatBubble(
                imageUrl: 'assets/images/1.png',
                text: 'Love them',
                time: '23:11'),
          ],
        ),
      ),
    );
  }
}
