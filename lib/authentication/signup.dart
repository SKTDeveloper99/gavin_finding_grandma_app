import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var cardHaving = TextEditingController();
  String locationController = "";
  String descriptionController = "";
  String profilePicController = "";

  SignUpPage({Key? key}) : super(key: key);

  //build sign up page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Hello!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset('assets/guitar_pic.jpg'),
            Container(
              margin: const EdgeInsets.only(
                  left: 35, right: 35, top: 16, bottom: 10),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 35, right: 35, top: 10, bottom: 10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 35, right: 35, top: 16, bottom: 10),
              child: TextField(
                controller: usernameController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              width: 200,
              height: 40,
              child: ElevatedButton(
                  child: const Text('Sign Up!'),
                  onPressed: () {
                    // get the email and password typed
                    // print(emailController.text);
                    // print(passwordController.text);
                    // deliver the materials to Google Firebase
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((authResult) {
                      //print("Successfully signed up UID! UID: ${authResult.user!.uid}");

                      var userProfile = {
                        'uid': authResult.user!.uid,
                        'email': emailController.text,
                        'password': passwordController.text,
                        'username': usernameController.text,
                        'location': 'Hugs',
                        'description': 'Love to use this app',
                        'profilePic':
                            'https://firebasestorage.googleapis.com/v0/b/ai-integrated-app.appspot.com/o/15ai-nocode-mobileMasterAt3x.jpg?alt=media&token=d62ce1d7-c5ad-44f8-95c0-9fa24bf16e9f',
                        'latitude': 27.1144,
                        'longitude': 38.8887,
                      };
                      FirebaseDatabase.instance
                          .ref()
                          .child("friends/${authResult.user!.uid}")
                          .set({
                        authResult.user!.uid: "true",
                      });

                      FirebaseDatabase.instance
                          .ref()
                          .child("users/${authResult.user!.uid}")
                          .set(userProfile)
                          .then((value) {
                        // print("Successfully created a portfolio");
                      }).catchError((error) {
                        print("Failed to create a portfolio");
                      });
                      Navigator.pop(context);
                    }).catchError((error) {
                      // print("Failed to sign up!");
                      // print(error.toString());
                    });
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
