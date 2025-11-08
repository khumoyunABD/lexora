import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/divider_with_text.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import 'password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_emailController.text.isEmpty) {
      return;
    }

    // Navigate to password screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreen(email: _emailController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80),

                    // Logo
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.textPrimary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset('assets/icons/lexora-logo.png'),
                    ),

                    const SizedBox(height: 40),

                    // Subtitle
                    Text.rich(
                      TextSpan(
                        style: AppTextStyles.bodyLarge,
                        children: [
                          const TextSpan(
                            text: 'Empower your legal team with tools that ',
                          ),
                          TextSpan(
                            text: 'think',
                            style: AppTextStyles.h2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ', '),
                          TextSpan(
                            text: 'plan',
                            style: AppTextStyles.h2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ', '),
                          TextSpan(
                            text: 'solve',
                            style: AppTextStyles.h2.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    // Title
                    const Text(
                      'Log in or sign up',
                      style: AppTextStyles.h2,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 24),

                    // Email Field
                    CustomTextField(
                      labelText: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    // Continue Button
                    PrimaryButton(
                      text: 'Continue',
                      isLoading: _isLoading,
                      onPressed: _handleContinue,
                    ),

                    const SizedBox(height: 24),

                    // Divider
                    const DividerWithText(),

                    const SizedBox(height: 24),

                    // Google Sign In
                    SecondaryButton(
                      text: 'Continue with Google',
                      icon: Icons.g_mobiledata,
                      onPressed: () {
                        // Handle Google sign in
                      },
                    ),

                    const SizedBox(height: 16),

                    // Phone Sign In
                    SecondaryButton(
                      text: 'Continue with phone',
                      icon: Icons.phone,
                      onPressed: () {
                        // Handle phone sign in
                      },
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Footer - NOW OUTSIDE ScrollView
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Open Terms of Use
                    },
                    child:
                        const Text('Terms of Use', style: AppTextStyles.link),
                  ),
                  const Text(' · ', style: AppTextStyles.caption),
                  TextButton(
                    onPressed: () {
                      // Open Privacy Policy
                    },
                    child:
                        const Text('Privacy Policy', style: AppTextStyles.link),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
