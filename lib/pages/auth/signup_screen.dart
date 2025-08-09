import 'package:flutter/material.dart';
import 'package:budgeting_app/theme/app_theme.dart';
import 'package:budgeting_app/widgets/custom_button.dart';
import 'package:budgeting_app/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              Text(
                'Sign up',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 72,
                  letterSpacing: 0,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Just a few things to get started',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    WhiteInputTextField(
                      controller: _emailController,
                      hintText: 'Email',
                    ),

                    const SizedBox(height: 20), 

                    WhiteInputTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                    ),

                    const SizedBox(height: 20),
                    
                    WhiteInputTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      isHidden: _isPasswordHidden,
                      hiddenIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppTheme.background,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    WhiteInputTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      isHidden: _isConfirmPasswordHidden,
                      hiddenIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppTheme.background,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordHidden =
                                !_isConfirmPasswordHidden;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 48),

                    PurpleAuthButton(
                      text: 'Create Account',
                      onPressed: () {
                        // TODO: Connect to Firebase Authentication
                        print('Email: ${_emailController.text}');
                        print('Username: ${_usernameController.text}');
                      },
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Navigate to Login Screen
                            print('Login tapped!');
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}