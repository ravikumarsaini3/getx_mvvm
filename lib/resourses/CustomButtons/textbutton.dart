import 'package:flutter/material.dart';

class customtextbutton extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;
  const customtextbutton(
      {super.key, required this.onpressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onpressed,
        child: Text(title),
      ),
    );
  }
}
