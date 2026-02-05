import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:full_send/components/fs_login_button.dart';
import 'package:full_send/components/fs_textfield.dart';
import 'package:full_send/utils/show_error_dialog.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CupertinoAlertDialog(
          content: Center(child: CupertinoActivityIndicator(radius: 16)),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) {
        Navigator.pop(context);
        context.go('/home');
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        displayError(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/login_bg.jpg',
            fit: BoxFit.cover,
            color: CupertinoColors.black.withOpacity(0.8),
            colorBlendMode: BlendMode.darken,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "FullSEND",
                          style: TextStyle(
                            fontSize: 60,
                            color: CupertinoColors.white,
                          ),
                        ),
                        Text(
                          "Drive together. Stay connected.",
                          style: TextStyle(
                            fontSize: 20,
                            color: CupertinoColors.systemGrey.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 32),
                        LoginScreenTextField(
                          hintText: "Email",
                          obscureText: false,
                          controller: emailController,
                        ),
                        const SizedBox(height: 16),
                        LoginScreenTextField(
                          hintText: "Hasło",
                          obscureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 32),
                        LoginScreenButton(text: "Zaloguj się", onTap: login),
                        const SizedBox(height: 32),
                        // TODO zaimplementowac reset hasła
                        Text(
                          "Zapomniałeś hasła?",
                          style: TextStyle(
                            fontSize: 15,
                            color: CupertinoColors.systemGrey.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nie masz konta? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: CupertinoColors.systemGrey.withOpacity(0.7),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.go('/register'),
                              child: Text(
                                "Zarejestruj się",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: CupertinoColors.systemGrey.withOpacity(0.7),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}