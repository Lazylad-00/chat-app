import 'package:firebase_based_app/models/usersModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
/*   List<Users> users = [
    Users(id: 100, name: "Rahul", email: "rahul@gmail.com"),
    Users(id: 101, name: "Rajesh", email: "rajesh@gmail.com"),
  ]; */
  final CollectionReference<UserModel> userRef = FirebaseFirestore.instance
      .collection("Users")
      .withConverter<UserModel>(
        fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
        toFirestore: (userModel, _) => userModel.toJson(),
      );
}
