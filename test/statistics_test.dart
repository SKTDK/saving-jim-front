import 'package:flutter_test/flutter_test.dart';
import 'package:saving_jim/mocks/Mocks.dart';
import 'package:saving_jim/models/Statistic.dart';
import 'package:saving_jim/services/IApiService.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/StatisticsViewModel.dart';
import 'package:mockito/mockito.dart';

void main() {
  final IApiService mockApiSvc = new MockApiService();

  StatisticsViewModel viewModel = new StatisticsViewModel(apiSvc: mockApiSvc);

  Future<List<Statistic>> returnValue() async {
    List<Map<String, dynamic>> mockPayload = [
      {"account_type": 0, "count": "3"},
      {"account_type": 1, "count": "2"},
      {"account_type": 2, "count": "3"},
      {"account_type": 3, "count": "4"}
    ];

    List<Statistic> ret =
        (mockPayload).map((e) => new Statistic.fromJson(e)).toList();
    return ret;
  }

  test(
    'fetchStatistics',
    () async {
      when(mockApiSvc.fetchStatistics()).thenAnswer((_) async => returnValue());
      // calling the method
      await viewModel.fetchStatistics(null);
      expect(await viewModel.statistics, isInstanceOf<List<Statistic>>());
    },
  );
}
