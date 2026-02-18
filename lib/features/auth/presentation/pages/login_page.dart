import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/core/constants/app_colors.dart';
import 'package:lexora/core/constants/app_text_styles.dart';
import 'package:lexora/widgets/custom_text_field.dart';
import 'package:lexora/widgets/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  final String? email;

  const LoginPage({super.key, this.email});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill email if provided
    if (widget.email != null && widget.email!.isNotEmpty) {
      _emailController.text = widget.email!;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _launchDemoUrl() async {
    final uri = Uri.parse('https://lexora.uz/en/demo');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _handleContinue() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
        ),
      );
      return;
    }

    // Basic email validation
    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email'),
        ),
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
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Text(
                          // 'Log in or sign up',
                          'Log in',
                          style: AppTextStyles.h2,
                          textAlign: TextAlign.start,
                        ),
                      ],
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

                    const SizedBox(height: 32),

                    // Demo section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: AppTextStyles.caption,
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _launchDemoUrl,
                          child: const Text(
                            'Request a Demo',
                            style: AppTextStyles.link,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

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

                    // const SizedBox(height: 16),

                    // Phone Sign In
                    // SecondaryButton(
                    //   text: 'Continue with phone',
                    //   icon: Icons.phone,
                    //   onPressed: () {
                    //     // Handle phone sign in
                    //   },
                    // ),

                    // const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Footer - NOW OUTSIDE ScrollView
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TextButton(
            //         onPressed: () {
            //           // Open Terms of Use
            //         },
            //         child:
            //             const Text('Terms of Use', style: AppTextStyles.link),
            //       ),
            //       const Text(' · ', style: AppTextStyles.caption),
            //       TextButton(
            //         onPressed: () {
            //           // Open Privacy Policy
            //         },
            //         child:
            //             const Text('Privacy Policy', style: AppTextStyles.link),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
