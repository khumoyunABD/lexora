import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/divider_with_text.dart';
import '../widgets/password_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class PasswordScreen extends StatefulWidget {
  final String email;

  const PasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_passwordController.text.isEmpty) {
      return;
    }

    // Handle authentication
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        // Navigate to next screen or show error
      }
    });
  }

  void _handleEditEmail() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 8.0),
            //     child: IconButton(
            //       icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            //       onPressed: () => Navigator.pop(context),
            //     ),
            //   ),
            // ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Logo
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.textPrimary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset('assets/icons/lexora-logo.png'),
                      // const Center(
                      //   child: Text(
                      //     'L',
                      //     style: TextStyle(
                      //       fontSize: 48,
                      //       fontWeight: FontWeight.w700,
                      //       color: AppColors.background,
                      //     ),
                      //   ),
                      // ),
                    ),

                    const SizedBox(height: 60),

                    // Title
                    const Text(
                      'Enter your password',
                      style: AppTextStyles.h1,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    // Email Field (filled, with Edit button)
                    CustomTextField(
                      labelText: 'Email',
                      controller: TextEditingController(text: widget.email),
                      enabled: false,
                      onEditPressed: _handleEditEmail,
                    ),

                    const SizedBox(height: 16),

                    // Password Field
                    PasswordField(
                      controller: _passwordController,
                    ),

                    const SizedBox(height: 16),

                    // Continue Button
                    PrimaryButton(
                      text: 'Continue',
                      isLoading: _isLoading,
                      onPressed: _handleContinue,
                    ),

                    const SizedBox(height: 16),

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: const Text(
                          'Forgot password?',
                          style: AppTextStyles.link,
                        ),
                      ),
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

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Footer - NOW OUTSIDE ScrollView, stays at bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
