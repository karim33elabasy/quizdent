import 'package:dartz/dartz.dart';
import 'package:quizdent/core/failure/failure.dart';

abstract class MainUseCase<T, Param>{
  const MainUseCase();
  Future<Either<Failure,T>> call({required Param params});
}