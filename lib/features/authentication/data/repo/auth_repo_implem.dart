import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizdent/core/failure/failure.dart';
import 'package:quizdent/core/failure/firebase_authentication_failure.dart';
import 'package:quizdent/core/failure/firestore_failure.dart';
import 'package:quizdent/core/failure/repo_implementation_failure.dart';
import 'package:quizdent/features/authentication/data/mappers/login_mapper.dart';
import 'package:quizdent/features/authentication/data/mappers/signup_mapper.dart';
import 'package:quizdent/features/authentication/data/models/login_model.dart';
import 'package:quizdent/features/authentication/data/models/signup_model.dart';
import 'package:quizdent/features/authentication/domain/repo/auth_repo.dart';
import 'package:quizdent/features/authentication/domain/utilities/login_entity.dart';
import 'package:quizdent/features/authentication/domain/utilities/signup_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final String repoType = "Authentication Repo";
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  AuthRepoImpl({required this.firebaseAuth, required this.firestore});

  @override
  Future<Either<Failure, Unit>> login({required LoginEntity loginEntity}) async {
    try{
      final LoginModel loginModel = LoginMapper.toModel(loginEntity: loginEntity);
      await firebaseAuth.signInWithEmailAndPassword(email: loginModel.email, password: loginModel.password);
      return const Right(unit);
    }on FirebaseAuthException catch(firebaseAuthException){
      return Left(
        FirebaseAuthenticationFailure(rawErrorMessage: firebaseAuthException.code)
      );
    }catch(exception){
      return Left(
        RepoImplementationFailure(repoType: repoType,errorMsg: exception.toString())
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> signup({required SignupEntity signupEntity}) async{
    try{
      final SignupModel signUpModel = SignupMapper.toModel(signupEntity: signupEntity);
      await firebaseAuth.createUserWithEmailAndPassword(email: signupEntity.email, password: signupEntity.password);
      await _saveUserInfo(uid: firebaseAuth.currentUser!.uid, signupModel: signUpModel);
      return const Right(unit);
    }on FirestoreFailure catch (firestoreException){
      return Left(
        FirestoreFailure(rawErrorMessage: firestoreException.toString())
      );
    }on FirebaseAuthException catch(firebaseAuthException) {
      return Left(
          FirebaseAuthenticationFailure(
              rawErrorMessage: firebaseAuthException.code)
      );
    }catch(exception){
      return Left(
          RepoImplementationFailure(repoType: repoType,errorMsg: exception.toString())
      );
    }
  }

  _saveUserInfo({required String uid, required SignupModel signupModel}) async{
    try{
      await firestore.collection('users').doc(uid).set(signupModel.toJson(), SetOptions(merge: true));
    }catch(exception){
      throw FirestoreFailure(rawErrorMessage: exception.toString());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) async{
    try{
      await firebaseAuth.currentUser!.sendEmailVerification();
      return const Right(unit);
    }on FirebaseAuthException catch(firebaseAuthException){
      return Left(
          FirebaseAuthenticationFailure(rawErrorMessage: firebaseAuthException.code)
      );
    }catch(exception){
      return Left(
          RepoImplementationFailure(repoType: repoType,errorMsg: exception.toString())
      );
    }
  }
}