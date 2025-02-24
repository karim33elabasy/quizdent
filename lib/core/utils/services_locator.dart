import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quizdent/features/authentication/data/datasources/firebase_auth_repo_implem.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';
import 'package:quizdent/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/login_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/signup_usecase.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register Firebase Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Register Data Sources
  getIt.registerLazySingleton<FirebaseAuthRepoImpl>(()=> FirebaseAuthRepoImpl(firebaseAuth: getIt(), firestore: getIt()));

  // Register Repo Impl
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(loginRepo: getIt<FirebaseAuthRepoImpl>(),),);

  // Register Use Cases
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepo: getIt<AuthRepoImpl>()));
  getIt.registerLazySingleton<SignupUsecase>(() => SignupUsecase(authRepo: getIt<AuthRepoImpl>()));
  getIt.registerLazySingleton<ForgetPasswordUsecase>(() => ForgetPasswordUsecase(authRepo: getIt<AuthRepoImpl>()));

}
