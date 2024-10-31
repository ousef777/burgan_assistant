import 'package:burgan_assistant/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  dec(String hintText) => InputDecoration(
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
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xFF005BAA),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFE5F1F9),
      appBar: AppBar(
        // title: const Text("Sign up"),
        backgroundColor: const Color(0xFFE5F1F9),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'AppIcons/playstore.png',
                  width: 100,
                  height: 100,
                ),
                const Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF005BAA),
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: dec('Civil ID'),
                  validator: (value) {
                    if (value!.isEmpty) return "fill the blank";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: dec('Username'),
                  validator: (value) {
                    if (value!.isEmpty) return "fill the blank";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: dec('Email'),
                  validator: (value) {
                    if (value!.isEmpty) return "fill the blank";
                    return null;
                  },
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                ),
                TextFormField(
                  decoration: dec('Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return "fill the blank";
                    return null;
                  },
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                ),
                TextFormField(
                  decoration: dec('Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return "fill the blank";
                    return null;
                  },
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF005BAA),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState!.save();
                    await provider.signup(email: email, password: password);
                    if (provider.token[0].isEmpty) {
                      GoRouter.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(provider.token[0])));
                    }
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
