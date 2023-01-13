import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final _emailController = TextEditingController();
  final _loginController = TextEditingController();
  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _loginController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.android,
                      color: Colors.black,
                      size: 100,
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
                //Title
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(color: Colors.black, fontSize: 52),
                  ),
                ),
                //Para
                Text(
                  "Welcome Back, You've Been Missed!",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                //Email Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        // border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                //password text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.purple),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: TextFormField(
                        controller: _loginController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                //sign in
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      SignIn();
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                //para
                SizedBox(
                  height: 25,
                ),

                // child: Center(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Registered? ',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '        Sign In',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )

                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
