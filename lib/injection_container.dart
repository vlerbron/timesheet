import 'package:get_it/get_it.dart';
import 'package:timesheet/repositories/services/i_authen_service_repository.dart';
import 'package:timesheet/services/authen/authen_service.dart';

final locator = GetIt.instance;

setupLocator() async {
  locator.registerFactory<IAuthenServiceRepository>(() => AuthenService());
}
