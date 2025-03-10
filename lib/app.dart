import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/utils/services_locator.dart';
import 'package:quizdent/features/authentication/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:quizdent/features/home/presentation/managers/events_categories_cubit/events_categories_cubit.dart';
import 'package:quizdent/features/home/presentation/managers/speakers_cubit/speakers_cubit.dart';
import 'core/themes/my_theme.dart';
import 'features/home/presentation/managers/events_cubit/events_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AuthBloc(loginUseCase: getIt(), signupUseCase: getIt(), forgotPasswordUseCase: getIt(),),),
        BlocProvider(create: (context)=> EventsCubit(getEventsUseCase: getIt(), searchEventsUseCase: getIt())..getEvents(),),
        BlocProvider(create: (context)=> EventsCategoriesCubit(getEventsCategoriesUseCase: getIt())..getEventsCategories(),),
        BlocProvider(create: (context)=> SpeakersCubit(getSpeakersUseCase: getIt())..getSpeakers(),),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        initialRoute: AppRoutes.kAuthScreen,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}