import 'package:burgan_assistant/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  String email = "";

  String password = "";

  Color usernameBorderColor = const Color(0xFF005BAA);

  Color passwordBorderColor = const Color(0xFF005BAA);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFE5F1F9),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/burgan.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome to Burgan Bank',
                        style: TextStyle(
                          color: Color(0xFF005BAA),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        enabled: !isLoading,
                        validator: (value) {
                          //print("validating email");
                          if (value!.isEmpty) {
                            //print("empty");
                            return "fill in the blank";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          email = newValue!;
                        },
                        //style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: usernameBorderColor,
                            ),
                          ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: const BorderSide(
                          //     color: Color(0xFF005BAA),
                          //     width: 2,
                          //   ),
                          // ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        enabled: !isLoading,
                        obscureText: true,
                        validator: (value) {
                          //print("validating password");
                          if (value!.isEmpty) return "fill in the blank";
                          return null;
                        },
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: passwordBorderColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF005BAA),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: (!isLoading)
                            ? () async {
                                //print("Validating");
                                if (!_formKey.currentState!.validate()) return;
                                _formKey.currentState!.save();
                                //print(email);
                                setState(() {
                                  isLoading = true;
                                });
                                await provider.login(
                                    email: email, password: password);
                                if (provider.token[0].isEmpty) {
                                  GoRouter.of(context).go('/home');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: const Duration(seconds: 5),
                                          content: Text(provider.token[0])));
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            : null,
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push('/signup');
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                              color: Color(0xFF005BAA)), // Burgan Bank Blue
                        ),
                      ),
                      const SizedBox(height: 20),
                      // New button for Branch List Page
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: const Color(0xFF005BAA),
                      //     padding:
                      //         const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     // Navigate to the Branch List Page
                      //     GoRouter.of(context).push('/branch_list');
                      //   },
                      //   child: const Text(
                      //     "View Branches",
                      //     style: TextStyle(fontSize: 18, color: Colors.white),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            if (isLoading) Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}

void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(message),
    ),
  );
}
