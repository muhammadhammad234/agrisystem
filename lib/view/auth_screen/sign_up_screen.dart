import 'package:agrisystem/utils/app_images.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  requestNextFocus(FocusNode currentFocus, FocusNode nextFocus) {
    // currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  signUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.08),
                Image.asset(
                  AppImages.logo,
                  height: 100,
                ),
                SizedBox(height: constraints.maxHeight * 0.08),
                // Text(
                //   "Sign Up",
                //   style: Theme.of(context)
                //       .textTheme
                //       .headlineSmall!
                //       .copyWith(fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormFieldTemplate(
                        controller: usernameController,
                        focusNode: usernameFocusNode,
                        hintText: 'Username',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          } else if (value.length < 3) {
                            return 'Username must be at least 3 characters';
                          }
                          return null;
                        },
                        onSubmitted: (value) {
                          requestNextFocus(usernameFocusNode, emailFocusNode);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormFieldTemplate(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        hintText: 'Email',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onSubmitted: (value) {
                          requestNextFocus(emailFocusNode, passwordFocusNode);
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: TextFormFieldTemplate(
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          obscureText: obscureText,
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter your password';
                            } else if (val.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSubmitted: (val) {
                            signUp();
                          },
                        ),
                      ),

                      // DropdownButtonFormField(
                      //   items: countries,
                      //   icon: const Icon(Icons.expand_more),
                      //   onSaved: (country) {
                      //     // save it
                      //   },
                      //   onChanged: (value) {},
                      //   decoration: const InputDecoration(
                      //     hintText: 'Country',
                      //     filled: true,
                      //     fillColor: Color(0xFFF5FCF9),
                      //     contentPadding: EdgeInsets.symmetric(
                      //         horizontal: 16.0 * 1.5, vertical: 16.0),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.all(Radius.circular(50)),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: AppButton(
                          onTap: () {
                            signUp();
                          },
                          buttonText: "Sign Up",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signInScreen);
                        },
                        child: Text.rich(
                          const TextSpan(
                            text: "Already have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign in",
                                style: TextStyle(color: Color(0xFF00BF6D)),
                              ),
                            ],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// only for demo
// List<DropdownMenuItem<String>>? countries = [
//   "Bangladesh",
//   "Switzerland",
//   'Canada',
//   'Japan',
//   'Germany',
//   'Australia',
//   'Sweden',
// ].map<DropdownMenuItem<String>>((String value) {
//   return DropdownMenuItem<String>(value: value, child: Text(value));
// }).toList();
