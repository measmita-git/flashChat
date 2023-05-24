import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_bubble.dart';

final _firestore = FirebaseFirestore.instance;

class MessageStreams extends StatelessWidget {
  const MessageStreams({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data?.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages!) {
          final messageText = message.data()['text'] ?? '';
          // Add the messageText to the messageWidgets list
          final messageSender = message.data()['sender'] ?? '';

          final messageBubble =
              MessageBubble(sender: messageSender, text: messageText);
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
