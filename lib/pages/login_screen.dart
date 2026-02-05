import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_send/components/fs_login_button.dart';
import 'package:full_send/components/fs_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
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

                        LoginScreenButton(
                          text: "Zaloguj się",
                          onTap: null,
                        ),

                        const SizedBox(height: 32),

                        Text(
                          "Zapomniałeś hasła?",
                          style: TextStyle(
                            fontSize: 15,
                            color: CupertinoColors.systemGrey.withOpacity(0.7),
                          ),
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
}
