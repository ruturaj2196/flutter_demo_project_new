import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? ontap;
  final String text;
  const Button({
    super.key,
    required this.ontap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
