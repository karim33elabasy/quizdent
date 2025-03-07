import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/app_routes.dart';
import 'package:quizdent/core/utils/services_locator.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:quizdent/features/authentication/presentation/auth_screen.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:quizdent/features/home/presentation/event_screen.dart';
import 'package:quizdent/features/home/presentation/home_screen.dart';
import 'core/themes/my_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AuthBloc(loginUseCase: getIt(), signupUseCase: getIt(), forgotPasswordUseCase: getIt(),)
        ),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        routes: AppRoutes.appRoutes,
        // home: const AuthScreen(),
        home: const HomeScreen(),
        // home: const EventScreen(),
      ),
    );
  }
}