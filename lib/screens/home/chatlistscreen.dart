import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_based_app/screens/home/chatscreen.dart';
import 'package:firebase_based_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/current_user.dart';
import '../../models/usersModel.dart';
import '../../services/database.dart';

class ChatListScreen extends StatefulWidget {
  String? fromName;
  ChatListScreen({Key? key, this.fromName}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  DatabaseService database = DatabaseService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser?>(context);
    AuthService authService = AuthService();
    final Query<UserModel> userConditionRef = FirebaseFirestore.instance
        .collection("Users")
        .where('uid', isNotEqualTo: user?.uid)
        .withConverter<UserModel>(
          fromFirestore: (snapshots, _) =>
              UserModel.fromJson(snapshots.data()!),
          toFirestore: (userModel, _) => userModel.toJson(),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("User's List"),
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
      body: StreamBuilder<QuerySnapshot<UserModel>>(
        stream: userConditionRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: ((context, index) {
              final user = Provider.of<CurrentUser?>(context);
              return ListTile(
                title: Text(data.docs[index].data().name!),
                subtitle: Text(data.docs[index].data().uid!),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                              toId: data.docs[index].data().uid,
                              toName: data.docs[index].data().name,
                              fromId: user!.uid,
                              fromName: widget.fromName)));
                },
              );
            }),
          );
        },
      ),
    );
  }
}
