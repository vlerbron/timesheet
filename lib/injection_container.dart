import 'package:dio/dio.dart';
import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:timesheet/data/datasources/local/login_local_datasource.dart';
import 'package:timesheet/data/datasources/remote/login_remote_datasource.dart';
import 'package:timesheet/data/helpers/dio_interceptor_config.dart';
import 'package:timesheet/data/repositories/login_repository_impl.dart';
import 'package:timesheet/domain/entities/timesheet/task_entity.dart';
import 'package:timesheet/domain/entities/timesheet/timesheet_entity.dart';
import 'package:timesheet/domain/repositories/login_repository.dart';
import 'package:timesheet/domain/use_case/login_use_case/login_use_case_adapter.dart';
import 'package:timesheet/domain/use_case/login_use_case/remote_use_case/login_use_case.dart';
import 'package:timesheet/presentation/provider/login_provider/login/login_provider.dart';
import 'package:timesheet/presentation/provider/login_provider/login/state/login_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/task_state.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/task_list_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_event_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/timesheet_provider.dart';
import 'package:timesheet/presentation/provider/timesheet_provider/state/timesheet_state.dart';
import 'package:timesheet/presentation/utils/const.dart';

final locator = GetIt.instance;

init() async {
  //** ================ Section : Provider ================ */
  //* Login
  locator.registerFactory(() => LoginProvider(locator()));

  //* Timesheet
  locator.registerFactory(() => TimesheetProvider(locator()));
  locator.registerFactory(() => TaskListProvider());
  locator.registerFactory(() => TimesheetEventProvider());
  locator.registerFactory(() => TaskProvider());

  // ================ Section : Notifier ================
  //* Login
  locator.registerLazySingleton(() =>
      StateNotifierProvider<LoginProvider, LoginState>((ref) => locator()));

  //* Timesheet
  locator.registerLazySingleton(() =>
      StateNotifierProvider<TimesheetProvider, TimesheetState>(
          (ref) => locator()));
  locator.registerLazySingleton(() =>
      StateNotifierProvider<TaskListProvider, List<TaskEntity>>(
          (ref) => locator()));
  locator.registerLazySingleton(() =>
      StateNotifierProvider<TimesheetEventProvider, EventEmitter>(
          (ref) => locator()));
  locator.registerLazySingleton(
      () => StateNotifierProvider<TaskProvider, TaskState>((ref) => locator()));

  // ================ Section : Use Case ================
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => LoginUseCaseAdapter(locator()));

  // ================ Section : Repository ================
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(locator(), locator()));

  // ================ Section : Remote Data Source ================
  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(locator()));

  // ================ Section : Local Storage ================
  locator.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(locator(), locator()));

  // ================ Section : Dio ================
  locator.registerLazySingleton(() {
    const int timeout = 10;
    final dio = Dio()
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ))
      ..interceptors.add(DioInterceptor())
      ..options.connectTimeout = const Duration(seconds: timeout)
      ..options.sendTimeout = const Duration(seconds: timeout)
      ..options.receiveTimeout = const Duration(seconds: timeout);
    return dio;
  });

  // ================ Section : Secure Storage ================
  locator.registerLazySingleton(() => const FlutterSecureStorage());

  // ================ Section : Config ================
  locator.registerLazySingleton(() => ConstantConfig());

  // ================ Section : Entity ================
  //* Timesheet
  locator.registerLazySingleton(() => TimesheetEntity(
        selectedDate: DateTime.now().copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
            isUtc: true),
        timeRemaining: const Duration(),
      ));
}
