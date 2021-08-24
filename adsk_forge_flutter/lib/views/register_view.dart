import 'package:adsk_forge_flutter/Router/appRouter.gr.dart';
import 'package:adsk_forge_flutter/components/componentsLibrary.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Text controller for email input
  final emailTextController = TextEditingController();

  // Text controller for email input
  final nameTextController = TextEditingController();

  // Text controller for email input
  final passwordTextController = TextEditingController();

  // Text controller for email input
  final confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // * Name input
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: InputFormComponent(
                      textController: nameTextController,
                      horizontalPadding: 50,
                      width: 500,
                      labelText: "Name",
                      textColor: Colors.black,
                      enabledBorderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      backgroundColor: Colors.white,
                      isSuffixIconVisible: false,
                      prefixIcon: Icons.person,
                      prefixIconColor: Colors.black,
                      borderRadius: 10,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                  ),
                  // * Email input
                  Padding(
                    padding: EdgeInsets.only(),
                    child: InputFormComponent(
                      textController: emailTextController,
                      horizontalPadding: 50,
                      width: 500,
                      labelText: "Email",
                      textColor: Colors.black,
                      enabledBorderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      backgroundColor: Colors.white,
                      isSuffixIconVisible: false,
                      prefixIcon: Icons.email,
                      prefixIconColor: Colors.black,
                      suffixIconColor: Colors.black,
                      borderRadius: 10,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                  ),
                  // * Password input
                  Padding(
                    padding: EdgeInsets.only(),
                    child: InputFormComponent(
                      textController: passwordTextController,
                      horizontalPadding: 50,
                      width: 500,
                      labelText: "Password",
                      textColor: Colors.black,
                      enabledBorderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      backgroundColor: Colors.white,
                      isSuffixIconVisible: false,
                      prefixIcon: Icons.lock,
                      prefixIconColor: Colors.black,
                      suffixIconColor: Colors.black,
                      borderRadius: 10,
                      isObscureText: true,
                      inputAction: TextInputAction.next,
                    ),
                  ),
                  // * Confrim password input
                  Padding(
                    padding: EdgeInsets.only(),
                    child: InputFormComponent(
                      textController: confirmPasswordTextController,
                      horizontalPadding: 50,
                      width: 500,
                      labelText: "Confirm password",
                      textColor: Colors.black,
                      enabledBorderColor: Colors.grey,
                      focusedBorderColor: Colors.grey,
                      backgroundColor: Colors.white,
                      isSuffixIconVisible: false,
                      prefixIcon: Icons.lock,
                      prefixIconColor: Colors.black,
                      suffixIconColor: Colors.black,
                      borderRadius: 10,
                      isObscureText: true,
                      inputType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 30,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // * Submit button
                          ActionButtonComponent(
                            labelText: 'Submit',
                            borderRadius: 10,
                            height: 50,
                            onPressedCallback: () {
                              context.pushRoute(LoginViewRoute());
                            },
                            onLongPressedCallback: () {},
                          ),
                          // * Cancel button
                          ActionButtonComponent(
                            labelText: 'Cancel',
                            borderRadius: 10,
                            height: 50,
                            onPressedCallback: () {
                              context.pushRoute(LoginViewRoute());
                            },
                            onLongPressedCallback: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
