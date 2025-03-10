import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/widgets/no_data_widget.dart';
import 'package:quizdent/features/authentication/domain/utilities/user_entity.dart';
import 'package:quizdent/features/authentication/presentation/auth_screen.dart';
import 'package:quizdent/features/home/presentation/event_screen.dart';
import 'package:quizdent/features/home/presentation/home_screen.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/profile/presentation/profile_screen.dart';

abstract class AppRoutes {
  static const kAuthScreen = 'kAuthScreen';
  static const kHomeScreen = 'kHomeScreen';
  static const kEventScreen = 'kEventScreen';
  static const kProfileScreen = 'kProfileScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kAuthScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());

      case kHomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case kEventScreen:
        final eventEntity = settings.arguments as EventEntity?;
        if (eventEntity == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: NoDataWidget(text: StringsOfErrors.eventDataMissing,),
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => EventScreen(eventEntity: eventEntity));

      case kProfileScreen:
        final userEntity = settings.arguments as UserEntity?;
        if (userEntity == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: NoDataWidget(text: StringsOfErrors.eventDataMissing,),
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => ProfileScreen(userEntity: userEntity));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: NoDataWidget(text: StringsOfErrors.navigationRouteError,)),
        );
    }
  }
}
