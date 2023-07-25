import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({super.key});

  @override
  State<BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                    debugPrint(
                        '+++++++++++++++++++++++++++++++++++$result........');
                  }
                });
              },
              child: const Icon(Icons.qr_code_2),
            ),
            Text('QR Results: $result'),
          ],
        ),
      ),
    );
  }
}
