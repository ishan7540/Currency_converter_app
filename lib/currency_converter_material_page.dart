import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0; // Make this a state variable
  final TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    setState(() {
      result = double.tryParse(textEditingController.text) != null
          ? double.parse(textEditingController.text) * 83.3
          : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'USD to INR Converter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(189, 13, 222, 155),
      ),
      backgroundColor: const Color.fromARGB(61, 34, 75, 152),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 216, 221, 221),
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  focusedBorder: border,
                  enabledBorder: border,
                  hintText: 'Add money in USD',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(150, 246, 246, 246)),
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: Color.fromARGB(150, 246, 246, 246),
                  filled: true,
                  fillColor: Color.fromARGB(150, 46, 144, 209),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: const Color.fromARGB(249, 17, 80, 188),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(color: Color.fromARGB(210, 246, 246, 246)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
