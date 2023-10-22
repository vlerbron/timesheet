import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:timesheet/data/exception.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppException, Type>> execute(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
