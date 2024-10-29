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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Sign in"),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) return "fill the blank";
                  return null;
                },
                onSaved: (newValue) {
                  email = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
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
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  Provider.of<AuthProvider>(context, listen: false)
                      .signup(email: email, password: password);
                  GoRouter.of(context).pop();
                },
                child: const Text("Sign in"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
