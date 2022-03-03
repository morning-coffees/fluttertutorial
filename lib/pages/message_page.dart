import 'package:fluttertutorial/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget chatInput() {
      return Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(75),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Message',
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
        body: const Text('Body'));
  }
}
