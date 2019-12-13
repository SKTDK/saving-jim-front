import 'dart:async';
import 'package:saving_jim/models/Statistic.dart';

abstract class IApiService {
  // For Mock/Testing purposes
  Future<List<Statistic>> fetchStatistics();
}
