import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:budgeting_app/theme/app_theme.dart';
import 'package:budgeting_app/widgets/custom_button.dart';
import 'package:budgeting_app/widgets/custom_textfield.dart';
import 'package:budgeting_app/services/auth_service.dart';
import 'package:budgeting_app/pages/auth/login_screen.dart';

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

  bool _isLoading = false;
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() async{

    if (_emailController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the fields')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try{
      User user = await _authService.signUpWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      logger.i('Sign up successful! User ID: ${user.uid}');

      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if(e.code == 'weak-password'){
        errorMessage = 'The password provided is too weak.';
      }else if( e.code == 'email-already-in-use'){
        errorMessage = 'An account already exists for that email.';
      }else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = 'An unknown error occurred. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  var logger = Logger();

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
                  fontSize: 60,
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

                    const SizedBox(height: 32),

                    PurpleAuthButton(
                      onPressed: _isLoading ? null : _handleSignUp,
                      child: _isLoading 
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: AppTheme.text,
                              strokeWidth: 2,
                            ),
                          ) 
                        : Text(
                            'Create Account',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );

                            logger.i('Login tapped!');
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