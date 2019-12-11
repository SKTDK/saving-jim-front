import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:saving_jim/view_models/AdministratorDashboard/StatisticsViewModel.dart';
import 'package:saving_jim/utils/ThemedApp.dart';

class StatisticsPage extends StatefulWidget {
  final StatisticsViewModel viewModel;

  StatisticsPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    widget.viewModel.fetchStatistics(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Vue d\'ensemble'),
      ),
      body: _buildChart(),
    );
  }

  Widget _buildChart() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return projectSnap.data;
        }

        if (projectSnap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: ThemedApp.secondaryGradient,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, -10.0),
                      blurRadius: 10.0),
                ]),
            child: PieChart(
              dataMap: projectSnap.data,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              showLegends: true,
              legendPosition: LegendPosition.right,
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc,
            ),
          );
        }
      },
      future: widget.viewModel.fetchStatistics(context),
    );
  }
}
