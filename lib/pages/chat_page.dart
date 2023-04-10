import 'package:flutter/material.dart';
import 'package:aval/models/chat_model.dart';
import 'package:aval/utils.dart';
import 'package:aval/widgets/message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _chatTextField(),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/female_police.jpg'),
                  radius: 24.0,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Aval Help Center",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    MessageBubble(message: messages[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: messages.length),
          ))
        ],
      ),
    );
  }

  Widget _chatTextField() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: greyColor),
        child: Row(
          children: [
            const Expanded(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Your Message",
                  hintStyle: TextStyle(fontSize: 16)),
            )),
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
