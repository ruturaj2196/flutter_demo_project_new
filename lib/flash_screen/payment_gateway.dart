import 'package:flutter/material.dart';
import 'package:flutter_practice/login_page/button.dart';
import 'package:flutter_practice/login_page/text_field.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment gateway'),
      ),
      body: Column(
        children: [
          InputField(
            obsecureText: false,
            controller: _controller,
            hintText: 'amount',
            readOnly: false,
          ),
          Button(ontap: () {}, text: 'Procced to pay'),
        ],
      ),
    );
  }
}
