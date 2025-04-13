import 'package:get_it/get_it.dart';
import 'package:graduation_project/core/di/service_locator.config.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;
@InjectableInit()
Future<void> configureDependencies() async => serviceLocator.init();
