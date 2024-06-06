import 'package:flutter/material.dart';
import 'package:flutter_test_example/MyHomePage.dart';
import 'package:flutter_test_example/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey("emailId"),
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",

                    ),
                    validator: (value) => Validator().validateEmail(value),

                  ),
                  TextFormField(
                    key: ValueKey("password"),
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                    validator: (value) => Validator().validatePassword(value),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        // Do something
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyHomePage(title: "Books"),));
                      }
                      else {
                        // Show error
                      }
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
