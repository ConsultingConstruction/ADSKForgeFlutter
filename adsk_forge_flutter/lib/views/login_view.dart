import 'package:adsk_forge_flutter/Router/appRouter.gr.dart';
import 'package:adsk_forge_flutter/components/componentsLibrary.dart';
import 'package:adsk_forge_flutter/controllers/login_controller.dart'
    as LoginController;
import 'package:adsk_forge_flutter/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // login model for user login
  LoginModel? login;

  // Login form controller
  final loginFormKey = GlobalKey<FormState>();

  // Text controller for email input
  final emailTextController = TextEditingController();

  // Text controller for email input
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Login form node
    final node = FocusScope.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          // * Login form
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(),
              child: Form(
                key: loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // * Email input
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
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
                        prefixIcon: Icons.mail,
                        prefixIconColor: Colors.black,
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
                        inputType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.done,
                        onFieldSubmittedCallback: (String input) async {
                          login = await LoginController.getLoginURL(
                              emailTextController.text,
                              passwordTextController.text);
                        },
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
                            // * Sign in button
                            ActionButtonComponent(
                              labelText: 'Sign in',
                              borderRadius: 10,
                              height: 50,
                              onPressedCallback: () {},
                              onLongPressedCallback: () {},
                            ),
                            // * Register button
                            ActionButtonComponent(
                              labelText: 'Register',
                              borderRadius: 10,
                              height: 50,
                              onPressedCallback: () {
                                context.pushRoute(RegisterViewRoute());
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
      ),
    );
  }
}
