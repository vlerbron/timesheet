import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timesheet/data/exception.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.failure(AppException exception) = Failure;
  const factory LoginState.success() = Success;
}
