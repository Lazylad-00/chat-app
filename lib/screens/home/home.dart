import 'package:firebase_based_app/models/current_user.dart';
import 'package:firebase_based_app/models/usersModel.dart';
import 'package:firebase_based_app/screens/home/chatlistscreen.dart';
import 'package:firebase_based_app/screens/home/chatscreen.dart';
import 'package:firebase_based_app/services/auth.dart';
import 'package:firebase_based_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseService database = DatabaseService();
  TextEditingController nameController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser?>(context);

    Future<void> addUser() {
      return database.userRef.add(
        UserModel(
          name: nameController.text,
          uid: user?.uid,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App"),
        actions: [
          TextButton.icon(
            onPressed: () {
              authService.signOut();
            },
            icon: const Icon(Icons.person_off),
            label: const Text("Logout"),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter user name',
            ),
          ),
          TextButton(
            onPressed: () {
              addUser();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChatListScreen(fromName: nameController.text)));
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
