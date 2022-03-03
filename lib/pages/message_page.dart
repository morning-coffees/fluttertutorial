import 'package:flutter/material.dart';

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
        body: const Text('Body'));
  }
}
