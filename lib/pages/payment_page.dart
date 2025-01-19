import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food/components/my_button.dart'; // Ensure this is the correct import
import 'package:food/pages/delivery_progress_page.dart'; // Replace with the actual path to DeliveryProgressPage

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // User taps "Pay Now"
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // Show dialog only if the form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $cardNumber'),
                Text('Expiry Date: $expiryDate'),
                Text('Card Holder Name: $cardHolderName'),
                Text('CVV: $cvvCode'),
              ],
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            // Yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Credit card widget
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),

            // Credit card form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CreditCardForm(
                formKey: formKey,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (CreditCardModel data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                    isCvvFocused = data.isCvvFocused;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // Custom button for payment
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MyButton(
                onTap: userTappedPay,
                text: "Pay Now",
                buttonColor: Colors.orangeAccent, // Set the background color for the button
                textColor: Colors.white, // Set the text color for the button
                borderRadius: 12.0, // Set the border radius for rounded corners
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
