import 'dart:io';

class SocketUtils {
  static String serverIP =
      Platform.isAndroid ? 'http://localhost' : 'http://10.0.2.2';
  static const int serverPort = 6000;
  static final String _connectUrl = "$serverIP : $serverPort";

  static const String onMessageReceived = "message_received";
  static const String singleChat = "single_chat";
}
