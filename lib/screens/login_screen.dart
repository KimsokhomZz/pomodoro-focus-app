import 'package:flutter/material.dart';
import 'package:focus_app_project/screens/signup_screen.dart';
import 'package:focus_app_project/widgets/nav_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focus_app_project/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorMessage;

  // Login process
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      String storedUserEmail = prefs.getString('email') ?? '';
      String storedPassword = prefs.getString('password') ?? '';

      String userEmailInput = _userEmailController.text;
      String passwordInput = _passwordController.text;
      if (userEmailInput == storedUserEmail &&
          passwordInput == storedPassword) {
        print("Login successful!");
        // Navigate to home screen or dashboard
        Get.offAll(() => const NavigationMenu());
      } else {
        print("Invalid credentials");
        //show proper message
        _showInvalidCredentialsDialog();
      }
    }
  }

  void _showInvalidCredentialsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Invalid Credentials",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff353935),
            ),
          ),
          content: Text(
            "Please check your email and password.",
            style: TextStyle(
              fontSize: 16,
              color: const Color(0xff353935).withOpacity(0.7),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/focus_logo1.png',
                  width: 130,
                  height: 130,
                ),
                const SizedBox(
                  height: 64,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your email address',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: _userEmailController,
                        decoration: const InputDecoration(
                          hintText: 'example@gmail.com',
                        ),
                        validator: userEmailValidator,
                        onChanged: (value) {
                          if (value.contains(' ')) {
                            setState(() {
                              _emailErrorMessage =
                                  'Email should not contain spaces';
                            });
                          } else {
                            setState(() {
                              _emailErrorMessage = null;
                            });
                          }
                        },
                      ),
                      if (_emailErrorMessage != null)
                        Text(
                          _emailErrorMessage!,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Your password',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'enter your password'),
                        validator: passwordValidator,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: _login,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/icons/arrow-right-icon.png',
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(child: Image.asset('assets/icons/or-bar.png')),
                      const SizedBox(
                        height: 16,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          //login with google (future)
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/gg_logo.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Sign up with Google',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          //login with apple (future)
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/apple_logo.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Sign up with Apple',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account!",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(
                                  5.0), // Removes the default padding
                            ),
                            onPressed: () {
                              //navigato sign-up
                              Get.to(() => const SignUpPage());
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2E8B57),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xff2E8B57),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 63,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
