import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool readOnly;
  final TextEditingController? controller;
  const MyTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      this.readOnly = false,
      this.controller})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        top: 18.0,
        right: 18.0,
        bottom: 0.0,
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        // style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Colors.grey[600],
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              fontSize: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6.0),
          ),
          filled: true,
          fillColor: const Color(0xFFf5f5f8),
          prefixIcon: Icon(
            widget.icon,
            size: 18,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
