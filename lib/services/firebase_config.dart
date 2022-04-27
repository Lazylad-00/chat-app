import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        apiKey: "AIzaSyDHaNsbjU1oZhieyZVkl0zy8IdexxG-Hsw",
        authDomain: "lad-ffp.firebaseapp.com",
        projectId: "lad-ffp",
        storageBucket: "lad-ffp.appspot.com",
        messagingSenderId: "710977819358",
        appId: "1:710977819358:web:f55277aba741e8e265a84f",
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:448618578101:ios:2bc5c1fe2ec336f8ac3efc',
        apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
        iosBundleId: 'io.flutter.plugins.firebase.firestore.example',
        iosClientId:
            '448618578101-ja1be10uicsa2dvss16gh4hkqks0vq61.apps.googleusercontent.com',
        androidClientId:
            '448618578101-2baveavh8bvs2famsa5r8t77fe1nrcn6.apps.googleusercontent.com',
        storageBucket: 'react-native-firebase-testing.appspot.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:710977819358:android:ed154277bcdfbfd465a84f',
        apiKey: 'AIzaSyAjR8O00TlbXOKQ29g6tkxrLwOYhATIgPU',
        projectId: 'lad-ffp',
        messagingSenderId: '710977819358',
      );
    }
  }
}
