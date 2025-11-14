# Lexora Flutter App - UI Development Instructions

## Overview

This document provides guidelines for generating UI screens for the Lexora Flutter application. Follow these specifications to maintain consistency across all screens.

## Design Philosophy

- **Minimal and Clean**: Focus on essential elements with plenty of whitespace
- **Dark Theme**: Premium dark interface with high contrast for readability
- **Modern Authentication**: Standard authentication patterns with multiple sign-in options
- **Accessibility**: Clear hierarchy, readable text, and intuitive interactions

## Color Palette

### Primary Colors

```dart
class AppColors {
  // Background
  static const Color background = Color(0xFF000000);  // Pure black
  static const Color surface = Color(0xFF1A1A1A);     // Slightly lighter for cards

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);    // White
  static const Color textSecondary = Color(0xFFB0B0B0);  // Gray
  static const Color textMuted = Color(0xFF808080);      // Muted gray

  // Buttons & Interactive
  static const Color buttonPrimary = Color(0xFF2D2D2D);   // Dark gray
  static const Color buttonDisabled = Color(0xFF1F1F1F);  // Even darker
  static const Color buttonText = Color(0xFF666666);      // Gray for disabled

  // Borders & Dividers
  static const Color border = Color(0xFF333333);          // Subtle border
  static const Color divider = Color(0xFF2A2A2A);         // Divider line

  // Accents (if needed)
  static const Color accent = Color(0xFFFFFFFF);          // White for highlights
  static const Color error = Color(0xFFFF4444);           // Error red
}
```

## Typography

### Text Styles

```dart
class AppTextStyles {
  // Headers
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Buttons
  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Input Fields
  static const TextStyle input = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle inputLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  // Small Text
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    decoration: TextDecoration.underline,
  );
}
```

## Component Specifications

### Logo

- **Position**: Centered, top third of screen
- **Size**: Approximately 80x80 pixels
- **Design**: Interlocked geometric pattern (rose/pinwheel style)
- **Color**: White on dark background
- **Spacing**: 60-80px margin from top

### Primary Button

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonPrimary,
    foregroundColor: AppColors.textPrimary,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
    elevation: 0,
  ),
  onPressed: onPressed,
  child: Text('Button Text', style: AppTextStyles.button),
)
```

### Secondary Button (OAuth/Social Login)

```dart
OutlinedButton.icon(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.textPrimary,
    minimumSize: const Size(double.infinity, 56),
    side: const BorderSide(color: AppColors.border, width: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(28),
    ),
  ),
  icon: Icon(Icons.g_mobiledata, size: 24),
  label: Text('Continue with Google', style: AppTextStyles.button),
  onPressed: onPressed,
)
```

### Text Input Field

```dart
TextField(
  style: AppTextStyles.input,
  decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: AppTextStyles.inputLabel,
    filled: true,
    fillColor: Colors.transparent,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.textPrimary, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
  ),
)
```

### Password Field (with visibility toggle)

```dart
TextField(
  obscureText: !_isPasswordVisible,
  style: AppTextStyles.input,
  decoration: InputDecoration(
    labelText: 'Password',
    labelStyle: AppTextStyles.inputLabel,
    filled: true,
    fillColor: Colors.transparent,
    suffixIcon: IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: AppColors.textMuted,
      ),
      onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    // ... same as text field above
  ),
)
```

## Layout Guidelines

### Screen Structure

1. **Safe Area**: Always wrap screen content in `SafeArea`
2. **Scaffold**: Use black background
3. **Padding**: Standard horizontal padding of 24px
4. **Vertical Spacing**:
   - Between major sections: 40-60px
   - Between related elements: 16-24px
   - Between input fields: 16px

### Authentication Screens Layout Pattern

```dart
Scaffold(
  backgroundColor: AppColors.background,
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // Back Button (if needed)
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          const SizedBox(height: 60),

          // Logo
          Container(
            width: 80,
            height: 80,
            child: LogoWidget(),
          ),

          const SizedBox(height: 60),

          // Title
          Text('Screen Title', style: AppTextStyles.h1, textAlign: TextAlign.center),

          const SizedBox(height: 16),

          // Subtitle (optional)
          Text(
            'Description text here',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Form Fields / Content
          // ... input fields, buttons, etc.

          const Spacer(),

          // Footer (Terms, Privacy Policy)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Terms of Use', style: AppTextStyles.link),
              ),
              Text(' · ', style: AppTextStyles.caption),
              TextButton(
                onPressed: () {},
                child: Text('Privacy Policy', style: AppTextStyles.link),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    ),
  ),
)
```

### Divider with Text

```dart
Row(
  children: [
    Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text('OR', style: AppTextStyles.caption),
    ),
    Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
  ],
)
```

## Common Screen Types

### 1. Initial Login/Signup Screen

**Elements:**

- Logo (centered, top)
- Heading: "Log in or sign up"
- Subtitle describing benefits
- Email input field
- Primary "Continue" button
- Divider with "OR"
- "Continue with Google" button
- "Continue with phone" button
- Footer with Terms and Privacy links

### 2. Password Entry Screen

**Elements:**

- Back button (top-left)
- Logo (centered)
- Heading: "Enter your password"
- Email field (filled, with "Edit" button)
- Password field (with visibility toggle)
- Primary "Continue" button
- "Forgot password?" link
- Divider with "OR"
- "Continue with Google" button
- Footer with Terms and Privacy links

### 3. Email Verification Screen

**Elements:**

- Logo
- Heading: "Verify your email"
- Subtitle explaining verification
- Code input field or OTP boxes
- Resend code link
- Continue button

### 4. Profile Setup Screens

**Elements:**

- Progress indicator (if multi-step)
- Logo or icon
- Heading describing step
- Input fields relevant to step
- Continue/Skip buttons
- Back button

## Best Practices

### 1. State Management

- Use `setState` for simple form states
- Consider Provider/Riverpod for complex flows
- Implement form validation with feedback

### 2. Navigation

- Use named routes for main flows
- Implement proper back button handling
- Consider MaterialPageRoute for custom transitions

### 3. Responsive Design

- Test on multiple screen sizes
- Use `MediaQuery` for responsive spacing
- Ensure text doesn't overflow on small screens

### 4. Accessibility

- Add semantic labels for screen readers
- Ensure sufficient color contrast
- Make tap targets at least 44x44 pixels
- Support text scaling

### 5. Error Handling

- Show inline validation errors
- Use snackbars for temporary messages
- Provide clear error messages with solutions

### 6. Loading States

```dart
// Button with loading state
ElevatedButton(
  onPressed: _isLoading ? null : _handleSubmit,
  child: _isLoading
    ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.textPrimary),
        ),
      )
    : const Text('Continue'),
)
```

## Animation Guidelines

- Use subtle animations for transitions
- Duration: 200-300ms for most interactions
- Curves: `Curves.easeInOut` for smooth motion
- Avoid excessive or distracting animations

## Example: Complete Login Screen

```dart
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),

              // Logo
              Container(
                width: 80,
                height: 80,
                child: const FlutterLogo(size: 80), // Replace with actual logo
              ),

              const SizedBox(height: 60),

              // Title
              const Text(
                'Log in or sign up',
                style: AppTextStyles.h1,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Subtitle
              const Text(
                'You\'ll get smarter responses and can\nupload files, images and more.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Email Field
              TextField(
                controller: _emailController,
                style: AppTextStyles.input,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: AppTextStyles.inputLabel,
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.textPrimary, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),

              const SizedBox(height: 16),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonPrimary,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _isLoading ? null : () {
                    // Handle continue
                  },
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Continue', style: AppTextStyles.button),
                ),
              ),

              const SizedBox(height: 24),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR', style: AppTextStyles.caption),
                  ),
                  const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
                ],
              ),

              const SizedBox(height: 24),

              // Google Sign In
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.border, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  icon: const Icon(Icons.g_mobiledata, size: 24),
                  label: const Text('Continue with Google', style: AppTextStyles.button),
                  onPressed: () {
                    // Handle Google sign in
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Phone Sign In
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.border, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  icon: const Icon(Icons.phone, size: 20),
                  label: const Text('Continue with phone', style: AppTextStyles.button),
                  onPressed: () {
                    // Handle phone sign in
                  },
                ),
              ),

              const Spacer(),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Open Terms of Use
                    },
                    child: const Text('Terms of Use', style: AppTextStyles.link),
                  ),
                  Text(' · ', style: AppTextStyles.caption),
                  TextButton(
                    onPressed: () {
                      // Open Privacy Policy
                    },
                    child: const Text('Privacy Policy', style: AppTextStyles.link),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Additional Notes

### Icons

- Use Material Icons for consistency
- Standard icon size: 24px
- Icon color: `AppColors.textMuted` or `AppColors.textPrimary`

### Transitions

- Use `MaterialPageRoute` for screen transitions
- Consider fade or slide transitions for modal screens
- Keep transitions under 300ms

### Testing Checklist

- [ ] Dark mode appearance correct
- [ ] All text is readable
- [ ] Buttons are responsive
- [ ] Form validation works
- [ ] Loading states display properly
- [ ] Navigation flows correctly
- [ ] Keyboard doesn't obscure input
- [ ] Works on different screen sizes

## When to Deviate

These guidelines provide a foundation, but you should adapt them when:

- Specific business requirements demand it
- User research suggests improvements
- Accessibility requires modifications
- Platform conventions differ significantly

Always prioritize user experience and accessibility over strict adherence to guidelines.
