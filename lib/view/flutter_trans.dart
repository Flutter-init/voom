import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voom/utility/constants.dart';

class FlutterTrans extends StatefulWidget {
  static const String id = '/flutter_trans';
  const FlutterTrans({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FlutterTransState createState() => _FlutterTransState();
}

class _FlutterTransState extends State<FlutterTrans> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final String publicKeyController = kFlutterwavePublicKeyAPI;
  final String encryptionKeyController = kFlutterwaveEnkrypKeyAPI;
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isDebug = true;

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;

    return Scaffold(
      backgroundColor: kActiveCardColor,
      appBar: AppBar(
          backgroundColor: kInactiveCardColor,
          title: Text('Send Funds',
              style: GoogleFonts.poppins(color: kmonochromcolorwhite))),
      body: Container(
        decoration: kContainerDeco,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Amount"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Amount is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: currencyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  decoration: const InputDecoration(
                    hintText: "Currency",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Currency is required",
                ),
              ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              //   child: TextFormField(
              //     controller: publicKeyController,
              //     textInputAction: TextInputAction.next,
              //     style: TextStyle(color: Colors.black),
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       hintText: "Public Key",
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              //   child: TextFormField(
              //     controller: encryptionKeyController,
              //     textInputAction: TextInputAction.next,
              //     style: TextStyle(color: Colors.black),
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       hintText: "Encryption Key",
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Email is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Phone Number is required",
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kSendFABcolor)),
                  onPressed: _onPressed,
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    if (formKey.currentState!.validate()) {
      _handlePaymentInitialization();
    }
  }

  _handlePaymentInitialization() async {
    final flutterwave = Flutterwave.forUIPayment(
        amount: amountController.text.toString().trim(),
        currency: currencyController.text,
        context: context,
        publicKey: publicKeyController,
        encryptionKey: encryptionKeyController,
        email: emailController.text.trim(),
        fullName: "Bernco Norm",
        txRef: DateTime.now().toIso8601String(),
        narration: "Example Project",
        isDebugMode: false,
        phoneNumber: phoneNumberController.text.trim(),
        acceptAccountPayment: true,
        acceptBankTransfer: true,
        acceptCardPayment: true,
        acceptUSSDPayment: true);
    final response = await flutterwave.initializeForUiPayments();
    // ignore: unnecessary_null_comparison
    if (response != null) {
      showLoading(response.data!.status.toString());
    } else {
      showLoading("No Response!");
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

  Widget _getCurrency() {
    final currencies = [
      FlutterwaveCurrency.GBP,
      FlutterwaveCurrency.USD,
      FlutterwaveCurrency.NGN,
    ];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}
