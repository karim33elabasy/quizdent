import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quizdent/features/authentication/data/datasources/firebase_auth_repo.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';
import 'package:quizdent/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/login_usecase.dart';
import 'package:quizdent/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:quizdent/features/home/data/datasources/firestore_data_source.dart';
import 'package:quizdent/features/home/data/repo/events_repo_implem.dart';
import 'package:quizdent/features/home/domain/usecases/get_events_categories_use_case.dart';
import 'package:quizdent/features/home/domain/usecases/get_events_use_case.dart';
import 'package:quizdent/features/home/domain/usecases/get_speakers_use_case.dart';
import 'package:quizdent/features/home/domain/usecases/search_events_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register Firebase Services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Register Data Sources
  getIt.registerLazySingleton<FirebaseAuthRepo>(()=> FirebaseAuthRepo(firebaseAuth: getIt(), firestore: getIt()));
  getIt.registerLazySingleton<FireStoreDataSource>(()=> FireStoreDataSource(firestore: getIt()));

  // Register Repo Impl
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(authRepo: getIt<FirebaseAuthRepo>(),),);
  getIt.registerLazySingleton<EventsRepoImplem>(() => EventsRepoImplem(dataSource: getIt<FireStoreDataSource>()));

  // Register Use Cases
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepo: getIt<AuthRepoImpl>()));
  getIt.registerLazySingleton<SignupUsecase>(() => SignupUsecase(authRepo: getIt<AuthRepoImpl>()));
  getIt.registerLazySingleton<ForgetPasswordUsecase>(() => ForgetPasswordUsecase(authRepo: getIt<AuthRepoImpl>()));
  getIt.registerLazySingleton<GetEventsUseCase>(()=>GetEventsUseCase(eventsRepo: getIt<EventsRepoImplem>()));
  getIt.registerLazySingleton<GetEventsCategoriesUseCase>(()=>GetEventsCategoriesUseCase(eventsRepo: getIt<EventsRepoImplem>()));
  getIt.registerLazySingleton<SearchEventsUseCase>(()=>SearchEventsUseCase(eventsRepo: getIt<EventsRepoImplem>()));
  getIt.registerLazySingleton<GetSpeakersUseCase>(()=>GetSpeakersUseCase(eventsRepo: getIt<EventsRepoImplem>()));
}
