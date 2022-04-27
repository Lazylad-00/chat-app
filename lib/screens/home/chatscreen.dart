import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String? toId;
  final String? toName;
  final String? fromId;
  final String? fromName;
  const ChatScreen(
      {Key? key,
      required this.toId,
      required this.toName,
      required this.fromId,
      required this.fromName})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.fromName!),
        Text(widget.fromId!),
        Text(widget.toName!),
        Text(widget.toId!),
      ],
    );
  }
}
