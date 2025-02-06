import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quizdent/features/authentication/data/repo/auth_repo_implem.dart';

GetIt getIt = GetIt.instance;

setupDependencyInjection(){
  final firebaseAuth = getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  final firestore = getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(firebaseAuth: firebaseAuth,firestore: firestore));

}