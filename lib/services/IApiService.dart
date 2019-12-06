import 'dart:async';
import 'package:saving_jim/models/User.dart';

abstract class IApiService {
  Future<User> login(String username, String password);
}