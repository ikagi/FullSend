import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_send/components/fs_login_button.dart';
import 'package:full_send/components/fs_textfield.dart';
import 'package:full_send/utils/show_error_dialog.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  bool hasEmptyFields() {
    final controllers = [
      usernameController,
      emailController,
      passwordController,
      confirmPwController,
    ];

    return controllers.any((c) => c.text.trim().isEmpty);
  }

  void registerUser() async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CupertinoAlertDialog(
          content: Center(child: CupertinoActivityIndicator(radius: 16)),
        );
      },
    );
    if (hasEmptyFields()) {
      Navigator.pop(context);
      displayRegisterEmptyFields(context);
      return;
    }
    if (passwordController.text != confirmPwController.text) {
      //Closing dialog
      Navigator.pop(context);
      displayRegisterNoMatch(context);
      return;
    }

    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      displayError(e.code, context);
      Navigator.pop(context);
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
                          hintText: "Nazwa użytkownika",
                          obscureText: false,
                          controller: usernameController,
                        ),

                        const SizedBox(height: 16),

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

                        const SizedBox(height: 16),

                        LoginScreenTextField(
                          hintText: "Potwierdź hasło",
                          obscureText: true,
                          controller: confirmPwController,
                        ),
                        const SizedBox(height: 32),

                        LoginScreenButton(
                          text: "Zarejestruj się",
                          onTap: registerUser,
                        ),

                        const SizedBox(height: 32),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Masz już konto? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: CupertinoColors.systemGrey.withOpacity(
                                  0.7,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Text(
                                "Zaloguj się",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: CupertinoColors.systemGrey.withOpacity(
                                    0.7,
                                  ),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom,
                        ),
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
}
