import 'package:firebase_based_app/models/current_user.dart';
import 'package:firebase_based_app/screens/authenticate/authenticate.dart';
import 'package:firebase_based_app/screens/home/chatlistscreen.dart';
import 'package:firebase_based_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return ChatListScreen();
    }
  }
}
