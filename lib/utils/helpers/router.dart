import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/core/di/di.dart';
import 'package:lexora/core/services/local_storage/local_storage_repository.dart';
import 'package:lexora/features/auth/presentation/pages/login_screen.dart';
import 'package:lexora/features/auth/presentation/pages/password_screen.dart';
import 'package:lexora/features/user/presentation/pages/chat_screen.dart';

abstract class PagePath {
  static const String home = '/';
  static const String login = '/login';
  static const String auth = '/auth';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static FutureOr<String?> _redirectLogic(
    BuildContext context,
    GoRouterState state,
  ) async {
    try {
      final secureLocalStorageRepository = di<LocalStorageRepository>();

      // Check if user is logged in
      final bool isLoggedIn =
          await secureLocalStorageRepository.checkIfUserIsLoggedIn();

      // Allowing navigation to login and register page regardless of login status
      final bool isLoggingInOrRegistering =
          state.uri.toString() == '/login' || state.uri.toString() == '/auth';

      if (!isLoggedIn && !isLoggingInOrRegistering) {
        // Redirect to login if not logged in and trying to access other pages
        log('🔒 Access denied to ${state.uri}: User not logged in, redirecting to login');
        return '/login';
      }

      if (isLoggedIn &&
          (state.uri.toString() == '/login' ||
              state.uri.toString() == '/auth')) {
        // Redirect to main navigation if logged in and trying to access login or register
        log('✅ User already logged in, redirecting from ${state.uri} to main navigation');
        return '/';
      }

      // No redirect needed
      return null;
    } catch (e) {
      // If there's an error checking login status, assume not logged in
      log('❌ Error in redirect logic: $e');
      final isLoggingInOrRegistering =
          state.uri.toString() == '/login' || state.uri.toString() == '/auth';

      if (!isLoggingInOrRegistering) {
        log('⚠️ Redirecting to login due to error');
        return '/login';
      }

      return null;
    }
  }

  AppRouter() {
    goRouter = GoRouter(
      initialLocation: PagePath.login,
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      routes: _routes,
      redirect: _redirectLogic,
    );
  }

  late GoRouter goRouter;

  final List<RouteBase> _routes = [
    GoRoute(
      path: PagePath.home,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ChatScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: PagePath.login,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: PagePath.auth,
      pageBuilder: (context, state) {
        final email = state.uri.queryParameters['email'] ?? '';
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: PasswordScreen(email: email),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
      },
    ),
  ];
}
