import 'package:opp/design/colors.dart';
import 'package:flutter/material.dart';

@immutable
class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;

  const InputWidget(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: inputbackColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
