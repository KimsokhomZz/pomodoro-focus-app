import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focus_app_project/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorMessage;

  //first-name validator
  String? _firstNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your first name';
    } else if (value.trim().length < 2) {
      return 'First name must be 2+ characters';
    }
    return null;
  }

  //last-name validator
  String? _lastNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your last name';
    } else if (value.trim().length < 2) {
      return 'Last name must be 2+ characters';
    }
    return null;
  }

  //save credentials to SharedPreferences
  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('firstName', _firstNameController.text);
      await prefs.setString('lastName', _lastNameController.text);
      await prefs.setString('email', _userEmailController.text);
      await prefs.setString('password', _passwordController.text);
      print('User Sgined Up!');
      // Optionally, navigate to login page or home page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 110,
              ),
              Image.asset(
                'assets/images/signup_welcome_img.png',
                width: 308,
                height: 143,
              ),
              const SizedBox(
                height: 56,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'First Name',
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Jonh',
                                ),
                                validator: _firstNameValidator,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Last Name',
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Sok',
                                ),
                                validator: _lastNameValidator,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(fontSize: 18),
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
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Your password',
                      style: TextStyle(fontSize: 18),
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
                      onPressed: _signUp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          const Text(
                            'Register',
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
                        //future logic
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
                        //future logic
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
                          'Already have an account?',
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding:
                                EdgeInsets.zero, // Removes the default padding
                          ),
                          onPressed: () {
                            //navigato login
                          },
                          child: const Text(
                            'Sign In',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
