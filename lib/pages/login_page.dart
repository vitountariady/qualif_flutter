import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool tnc = false;
  var usernameError = false;
  bool passwordError = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.asset('assets/logo.png'),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  errorText:
                      usernameError ? "Username must not be empty" : null,
                ),
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  errorText: passwordError
                      ? "Password must be more than 6 characters"
                      : null,
                ),
              ),
              CheckboxListTile(
                title: const Text("Agree to terms and conditions"),
                value: tnc,
                onChanged: (value) => {
                  setState(() {
                    tnc = value!;
                  })
                },
              ),
              ElevatedButton(
                  onPressed: () => {
                        setState(() {
                          usernameError = false;
                          passwordError = false;
                        }),
                        if (usernameController.text.isEmpty)
                          {
                            setState(() {
                              usernameError = true;
                            })
                          },
                        if (passwordController.text.length < 6)
                          {
                            setState(() {
                              passwordError = true;
                            })
                          },
                        if (tnc == false)
                          {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        "You must agree to terms and condition to Sign In"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            return;
                                          },
                                          child: const Text("OK"))
                                    ],
                                  );
                                })
                          },
                        if (!usernameError && !passwordError && tnc == true)
                          {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return MainPage(
                                username: usernameController.text,
                              );
                            }), (route) => false)
                          }
                      },
                  child: const Text('Sign In'))
            ],
          ),
        ),
      ),
    );
  }
}
