import 'package:dbu/componets/mybutton.dart';
import 'package:dbu/componets/mytextfield.dart';
import 'package:dbu/componets/square_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

//sign user in method
  void signUserin() async {
// show loading icon
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

// try again
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('no user found with that enail');
      } else if (e.code == 'wrong-password') {
        print('wrong password');
      }
    }

// pop the loading circle
    Navigator.pop(context);
  }

  //wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

// wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //logo
              Image.asset('lib/images/smalllogo.ico'),

              //welcome back, we missed you!
              Text('welcome back, we misssed you!',
                  style: TextStyle(color: Colors.teal[300], fontSize: 16)),

              const SizedBox(
                height: 25,
              ),

              //email
              MyTextField(
                controller: emailController,
                hintext: 'email',
                obscuretext: false,
              ),

              const SizedBox(height: 10),

              //password
              MyTextField(
                controller: passwordController,
                hintext: 'password',
                obscuretext: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //fogot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'forgot password?',
                    style: TextStyle(
                      color: Colors.teal[300],
                    ),
                  ),
                ]),
              ),

              const SizedBox(
                height: 25,
              ),

              //signin
              MyButton(text: 'Sign in', onTap: signUserin),

              const SizedBox(
                height: 25,
              ),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.teal[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.teal[300]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.teal[300],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              //google = apple signin
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareFile(imagepath: 'lib/images/google.png'),
                  SizedBox(width: 25),
                  SquareFile(imagepath: 'lib/images/apple.png')
                ],
              ),

              const SizedBox(height: 50),

              //not a mamber? reigster
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.teal),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register here',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
