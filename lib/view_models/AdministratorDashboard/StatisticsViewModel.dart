import 'package:flutter/material.dart';
import 'package:saving_jim/models/Statistic.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';
import 'package:saving_jim/services/ApiService.dart';

class StatisticsViewModel extends Model {
  final ApiService apiSvc;
  StatisticsViewModel({@required this.apiSvc});

  Future<List<Statistic>> _statistics;
  get statistics => _statistics;
  set statistics(Future<List<Statistic>> value) {
    _statistics = value;
    notifyListeners();
  }

  Future<Map<String, double>> fetchStatistics(BuildContext context) async {
    Map<String, double> dataMap = new Map<String, double>();

    List<Statistic> statistics = await apiSvc.fetchStatistics();

    dataMap.putIfAbsent(
        "Administrateurs", () => double.parse(statistics[0].count.toString()));
    dataMap.putIfAbsent(
        "Accompagnateurs", () => double.parse(statistics[1].count.toString()));
    dataMap.putIfAbsent("Personnes de contact",
        () => double.parse(statistics[2].count.toString()));
    dataMap.putIfAbsent(
        "Enfants", () => double.parse(statistics[3].count.toString()));
    return dataMap;
  }
}
