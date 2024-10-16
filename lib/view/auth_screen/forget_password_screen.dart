import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // backgroundColor: Colors.white,
        title: const Text("Forgot Password"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Enter your email address and we will \nsend you a reset instructions.",
            ),
            SizedBox(
              height: 40,
            ),

            // SizedBox(height: 16),
            ForgotPassForm(),
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  final String title, text;

  const WelcomeText({super.key, required this.title, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormFieldTemplate(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email address";
              }
              return null;
            },
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
            hintText: "Email Address",
          ),
          const SizedBox(height: 16),

          // Reset password Button
          AppButton(
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: const Color(0xFF22A45D),
              //   foregroundColor: Colors.white,
              //   minimumSize: const Size(double.infinity, 40),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(8),
              // ),
              // ),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // If all data are correct then save data to out variables
                  _formKey.currentState!.save();
                }
              },
              buttonText: "Reset password"),
        ],
      ),
    );
  }
}
