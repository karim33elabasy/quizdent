import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';
import 'package:quizdent/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/login_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/signup_usecase.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register Firebase Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Register Repo Impl
  getIt.registerLazySingleton<AuthRepoImpl>(
        () => AuthRepoImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Register Use Cases
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepoImpl: getIt()));
  getIt.registerLazySingleton<SignupUsecase>(() => SignupUsecase(authRepoImpl: getIt()));
  getIt.registerLazySingleton<ForgetPasswordUsecase>(() => ForgetPasswordUsecase(authRepoImpl: getIt()));

}
