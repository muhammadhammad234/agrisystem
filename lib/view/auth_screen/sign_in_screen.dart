import 'dart:convert';

import 'package:agrisystem/helper/shared_preferences_helper.dart';
import 'package:agrisystem/network/api_client.dart';
import 'package:agrisystem/network/app_url.dart';
import 'package:agrisystem/utils/app_images.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:agrisystem/utils/toast_utils.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obsecureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  requestFocus(FocusNode focus) {
    FocusScope.of(context).requestFocus(focus);
  }

  signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        http.Response response = await ApiClient().postWithoutBearer(
            url: AppUrl.login,
            body: {
              'email': emailController.text.toString(),
              'password': passwordController.text.toString()
            });
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);
          if (body['status'] == "success") {
            await SharedPreferencesHelper().setLoginStatus(true);
            await SharedPreferencesHelper().setUserId(body['user_id']);
            await SharedPreferencesHelper().setUsername(body['username']);

            ToastUtils.showErrorToast(message: body['message']);

            Future.delayed(Duration.zero, () {
              Navigator.pushNamed(context, AppRoutes.syncDataScreen);
            });
          } else {
            ToastUtils.showErrorToast(message: body['message']);
          }
        } else {
          ToastUtils.showErrorToast(message: "Invalid Email or Password");
        }

        // _formKey.currentState!.save();
      } catch (e) {
        ToastUtils.showErrorToast(message: e.toString());
      }
      // Navigate to the main screen
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(
                    AppImages.logo,
                    // "https://i.postimg.cc/nz0YBQcH/Logo-light.png",
                    height: 100,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  // Text(
                  //   "Sign In",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headlineSmall!
                  //       .copyWith(fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormFieldTemplate(
                          focusNode: usernameFocusNode,
                          controller: emailController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter your email';
                            } else if (val.length < 3) {
                              return 'Username must be at least 3 characters';
                            } else {
                              return null;
                            }
                          },

                          hintText: 'Email',

                          // keyboardType: TextInputType.phone,
                          onSubmitted: (phone) {
                            requestFocus(passwordFocusNode);
                            // Save it
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFormFieldTemplate(
                            focusNode: passwordFocusNode,
                            controller: passwordController,
                            obscureText: obsecureText,
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecureText = !obsecureText;
                                });
                              },
                              icon: Icon(
                                obsecureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(.5),
                              ),
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter your password';
                              } else if (val.length < 6) {
                                return 'Password must be at least 6 characters';
                              } else {
                                return null;
                              }
                            },
                            onSubmitted: (passaword)async {
                              await signIn();
                              // Save it
                            },
                          ),
                        ),
                        AppButton(
                          onTap: ()async {
                           await signIn();
                          },
                          buttonText: "Sign in",
                        ),
                        const SizedBox(height: 16.0),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(
                        //         context, AppRoutes.forgotPasswordScreen);
                        //   },
                        //   child: Text(
                        //     'Forgot Password?',
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyMedium!
                        //         .copyWith(
                        //           color: Theme.of(context)
                        //               .textTheme
                        //               .displayMedium!
                        //               .color!
                        //               .withOpacity(0.64),
                        //         ),
                        //   ),
                        // ),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(
                        //       context,
                        //       AppRoutes.signUpScreen,
                        //     );
                        //   },
                        //   child: Text.rich(
                        //     const TextSpan(
                        //       text: "Don't have an account? ",
                        //       children: [
                        //         TextSpan(
                        //           text: "Sign Up",
                        //           style: TextStyle(color: Color(0xFF00BF6D)),
                        //         ),
                        //       ],
                        //     ),
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyMedium!
                        //         .copyWith(
                        //           color: Theme.of(context)
                        //               .textTheme
                        //               .displayMedium!
                        //               .color!
                        //               .withOpacity(0.64),
                        //         ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
