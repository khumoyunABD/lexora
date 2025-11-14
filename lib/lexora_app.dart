import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lexora/core/constants/app_colors.dart';
import 'package:lexora/core/di/di.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lexora/features/user/presentation/bloc/user_bloc.dart';
import 'package:lexora/utils/helpers/router.dart';

class LexoraApp extends StatelessWidget {
  const LexoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<AuthBloc>()),
        BlocProvider(create: (context) => di<UserBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Lexora',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.manropeTextTheme(),
          colorScheme: const ColorScheme.dark(
            surface: AppColors.surface,
            primary: AppColors.textPrimary,
          ),
          useMaterial3: true,
        ),
        routerConfig: appRouter.goRouter,
      ),
    );
  }
}
