import 'package:dbu/componets/mybutton.dart';
import 'package:dbu/componets/mytextfield.dart';
import 'package:dbu/componets/square_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

//sign user up method
  void signUserUp() async {
// show loading icon
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

// try creating the user
    try {
      //check if user is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error message, passwords dont  match
        ShowErrorMessge('Passwords dont match');
      }
    } on FirebaseAuthException catch (e) {
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        //show error to user
        wrongEmailMessage();
      }

      //WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        //show error to user
        wrongPasswordMessage();
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

              //lets create an account!
              Text('Lets create an account for you!',
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

              // Confirm password
              MyTextField(
                controller: confirmPasswordController,
                hintext: 'confirm password',
                obscuretext: true,
              ),

              const SizedBox(
                height: 25,
              ),

              MyButton(text: 'Sign up', onTap: signUserUp),

              //signup
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
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
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
                height: 20,
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

              const SizedBox(height: 20),

              //not a mamber? reigster
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.teal),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
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
