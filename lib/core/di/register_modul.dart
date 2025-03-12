import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl, receiveDataWhenStatusError: true));
  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> getSharedPref() => SharedPreferences.getInstance();
}
