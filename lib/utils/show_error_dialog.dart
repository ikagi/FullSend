import 'package:flutter/cupertino.dart';

void displayRegisterNoMatch(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text("Błąd rejestracji!", textAlign: TextAlign.center),
      content: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          "Upewnij się, że wpisane hasła są identyczne.",
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text("Zamknij"),
        ),
      ],
    ),
  );
}

void displayRegisterEmptyFields(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text("Błąd rejestracji!", textAlign: TextAlign.center),
      content: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          "Pola nie mogą być puste.",
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text("Zamknij"),
        ),
      ],
    ),
  );
}

void displayError(String message, BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text("Błąd!", textAlign: TextAlign.center),
      content: Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text("Zamknij"),
        ),
      ],
    ),
  );
}

