import 'package:firebase_based_app/screens/home/home.dart';
import 'package:firebase_based_app/shared/constant.dart';
import 'package:firebase_based_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_based_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({required this.toggleView, Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  String name = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.green[100],
            appBar: AppBar(
              backgroundColor: Colors.green[600],
              elevation: 0.0,
              title: const Text("Sigh up to FFP"),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: const Icon(Icons.person),
                  label: const Text("Sign In"),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                )
              ],
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    /* const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "Name"),
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      validator: (val) => val!.length < 6
                          ? "Password must be 6+ char long"
                          : null,
                    ), */
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      validator: (val) =>
                          val!.isEmpty ? "Enter valid email" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      validator: (val) => val!.length < 6
                          ? "Password must be 6+ char long"
                          : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown[400],
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                          if (result == null) {
                            setState(() {
                              error = "Enter a valid email";
                              setState(() => loading = false);
                            });
                          }
                        }
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      error,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
