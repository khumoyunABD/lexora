import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/core/constants/app_colors.dart';
import 'package:lexora/core/constants/app_text_styles.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_event.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_state.dart';
import 'package:lexora/widgets/custom_text_field.dart';
import 'package:lexora/widgets/password_field.dart';
import 'package:lexora/widgets/primary_button.dart';

class PasswordPage extends StatefulWidget {
  final String email;

  const PasswordPage({
    super.key,
    required this.email,
  });

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your password'),
        ),
      );
      return;
    }

    // Trigger login event via BLoC
    context.read<AuthBloc>().add(
          AuthEvent.login(
            email: widget.email,
            password: _passwordController.text,
          ),
        );
  }

  void _handleEditEmail() {
    context.go('/login?email=${Uri.encodeComponent(widget.email)}');
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: () {
            // Navigate to home screen on successful login using GoRouter
            context.go('/');
          },
          error: (failure) {
            // Show error message
            _showErrorSnackBar(
              failure.errorMessage ?? 'Login failed. Please try again.',
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Scaffold(
          // appBar: AppBar(),
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                      icon: Platform.isAndroid
                          ? const Icon(Icons.arrow_back)
                          : const Icon(Icons.arrow_back_ios),
                      onPressed: () => context.go('/login'),
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),

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
                          enabled: true,
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
                          isLoading: isLoading,
                          onPressed: _handleContinue,
                        ),

                        const SizedBox(height: 16),

                        // Forgot Password Link
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       // Handle forgot password
                        //     },
                        //     child: const Text(
                        //       'Forgot password?',
                        //       style: AppTextStyles.link,
                        //     ),
                        //   ),
                        // ),

                        // const SizedBox(height: 24),

                        // Divider
                        // const DividerWithText(),

                        // const SizedBox(height: 24),

                        // Google Sign In
                        // SecondaryButton(
                        //   text: 'Continue with Google',
                        //   icon: Icons.g_mobiledata,
                        //   onPressed: () {
                        //     // Handle Google sign in
                        //   },
                        // ),

                        // const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),

                // Footer - NOW OUTSIDE ScrollView, stays at bottom
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 24),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       TextButton(
                //         onPressed: () {
                //           // Open Terms of Use
                //         },
                //         child: const Text('Terms of Use',
                //             style: AppTextStyles.link),
                //       ),
                //       const Text(' · ', style: AppTextStyles.caption),
                //       TextButton(
                //         onPressed: () {
                //           // Open Privacy Policy
                //         },
                //         child: const Text('Privacy Policy',
                //             style: AppTextStyles.link),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
