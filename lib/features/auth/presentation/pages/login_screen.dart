import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/core/constants/app_colors.dart';
import 'package:lexora/core/constants/app_text_styles.dart';
import 'package:lexora/widgets/custom_text_field.dart';
import 'package:lexora/widgets/divider_with_text.dart';
import 'package:lexora/widgets/primary_button.dart';
import 'package:lexora/widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    // Basic email validation
    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    // Navigate to password screen using GoRouter
    context.go('/auth?email=${Uri.encodeComponent(email)}');
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
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const TextSpan(text: ', '),
                          TextSpan(
                            text: 'plan',
                            style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.w200,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ', and '),
                          TextSpan(
                            text: 'solve',
                            style: AppTextStyles.h2.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w200,
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
                      isLoading: false,
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
          ],
        ),
      ),
    );
  }
}
