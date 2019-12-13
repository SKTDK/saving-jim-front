import 'package:flutter/material.dart';
import 'package:saving_jim/models/Statistic.dart';
import 'package:saving_jim/services/IApiService.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:meta/meta.dart';

class StatisticsViewModel extends Model {
  final IApiService apiSvc;
  StatisticsViewModel({@required this.apiSvc});

  Future<List<Statistic>> _statistics;
  get statistics => _statistics;
  set statistics(Future<List<Statistic>> value) {
    _statistics = value;
    notifyListeners();
  }

  Future<Map<String, double>> fetchStatistics(BuildContext context) async {
    Map<String, double> dataMap = new Map<String, double>();

    this.statistics = apiSvc.fetchStatistics();
    List<Statistic> tmp = await this.statistics;

    dataMap.putIfAbsent(
        "Administrateurs", () => double.parse(tmp[0].count.toString()));
    dataMap.putIfAbsent(
        "Accompagnateurs", () => double.parse(tmp[1].count.toString()));
    dataMap.putIfAbsent(
        "Personnes de contact", () => double.parse(tmp[2].count.toString()));
    dataMap.putIfAbsent("Enfants", () => double.parse(tmp[3].count.toString()));
    return dataMap;
  }
}
