import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final Function()? ontap;
  final String hintText;
  final bool obsecureText;
  final bool readOnly;
  const InputField(
      {super.key,
      required this.obsecureText,
      required this.controller,
      required this.hintText,
      this.ontap,
      required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: TextFormField(
        onTap: ontap,
        controller: controller,
        obscureText: obsecureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: hintText,
          fillColor: Colors.grey[100],
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          constraints: const BoxConstraints(maxHeight: 50),
        ),
      ),
    );
  }
}
