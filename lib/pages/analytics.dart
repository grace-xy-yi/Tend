import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // For date formatting

// A unified data model for all daily analytics data
class DailyAnalyticsData {
  final DateTime date;
  final int aqi;
  final String status;
  final double withMask;
  final double noMask;

  DailyAnalyticsData({
    required this.date,
    required this.aqi,
    required this.status,
    required this.withMask,
    required this.noMask,
  });
}

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  // Calendar controller
  late final CalendarFormat _calendarFormat;
  late final DateTime _focusedDay;
  DateTime? _selectedDay;

  // A single source of truth for all dummy data
  final List<DailyAnalyticsData> _analyticsData = [];

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    _calendarFormat = CalendarFormat.month;
    _generateDummyData();
  }

  /// Generates a consistent set of dummy data for the whole page.
  void _generateDummyData() {
    final random = Random();
    final statuses = ['Good', 'Moderate', 'Unhealthy', 'Poor', 'Very Poor'];
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);

    for (int i = 0; i < 31; i++) {
      final date = firstDayOfMonth.add(Duration(days: i));
      final status = statuses[random.nextInt(statuses.length)];
      int aqi;
      switch (status) {
        case 'Good':
          aqi = random.nextInt(50);
          break;
        case 'Moderate':
          aqi = 51 + random.nextInt(49);
          break;
        case 'Unhealthy':
          aqi = 101 + random.nextInt(49);
          break;
        case 'Poor':
          aqi = 151 + random.nextInt(49);
          break;
        default:
          aqi = 201 + random.nextInt(99);
      }
      _analyticsData.add(DailyAnalyticsData(
        date: date,
        aqi: aqi,
        status: status,
        withMask: 5.0 + random.nextDouble() * 5, // Random value between 5-10
        noMask: 8.0 + random.nextDouble() * 7,  // Random value between 8-15
      ));
    }
  }

  Color _getColorForStatus(String? status) {
    switch (status) {
      case 'Good':
        return Colors.green.shade400;
      case 'Moderate':
        return Colors.yellow.shade700;
      case 'Unhealthy':
      case 'Poor':
        return Colors.orange.shade600;
      case 'Very Poor':
        return Colors.red.shade400;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Personalized Analytics',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildDailyReportCard(),
          const SizedBox(height: 24),
          _buildWeeklyTrendsCard(),
          const SizedBox(height: 24),
          _buildExposureComparisonCard(),
          const SizedBox(height: 24),
          _buildActivitySuggestionsCard(),
          const SizedBox(height: 24),
          _buildForecastsCard(),
        ],
      ),
    );
  }

  /// **MODIFIED**: Re-enabled touch interaction to show tooltips on tap.
  Widget _buildWeeklyTrendsCard() {
    const double width = 7;
    final withMaskColor = Colors.green.shade400;
    final noMaskColor = Colors.green.shade200;

    final weeklyData = _analyticsData.take(7).toList();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Trends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'A 7-day analysis of your cumulative pollutant exposure.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (group) => Colors.grey,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                  barGroups: List.generate(weeklyData.length, (index) {
                    final dayData = weeklyData[index];
                    return makeGroupData(
                      index,
                      dayData.withMask,
                      dayData.noMask,
                      width,
                      withMaskColor,
                      noMaskColor,
                    );
                  }),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) =>
                            getWeekDayTitles(value, meta, weeklyData),
                        reservedSize: 38,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(noMaskColor, 'No mask'),
                const SizedBox(width: 16),
                _buildLegendItem(withMaskColor, 'With mask'),
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Other card-building and widget methods (unchanged) ---

  Widget _buildForecastsCard() {
    final forecastData = _analyticsData.take(7).toList();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forecasts and Predictions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Track past air quality trends at a glance.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            const Text(
              '7 day forecast',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ListView.separated(
              itemCount: forecastData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final forecast = forecastData[index];
                return _buildForecastRow(forecast);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Air quality in the past month',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TableCalendar(
              firstDay: _analyticsData.first.date,
              lastDay: _analyticsData.last.date,
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final data = _analyticsData.firstWhere(
                          (d) => isSameDay(d.date, day),
                      orElse: () => DailyAnalyticsData(
                          date: day, aqi: 0, status: '', withMask: 0, noMask: 0));
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: _getColorForStatus(data.status),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                            color: data.status.isNotEmpty
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastRow(DailyAnalyticsData forecast) {
    final color = _getColorForStatus(forecast.status);
    final statusText = forecast.status == 'Unhealthy'
        ? 'Unhealthy for\nsensitive groups'
        : forecast.status;
    final progress = (forecast.aqi / 200).clamp(0.0, 1.0);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  isSameDay(forecast.date, DateTime.now())
                      ? 'Today'
                      : DateFormat('E').format(forecast.date),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(DateFormat('d MMM').format(forecast.date),
                  style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            forecast.aqi.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            statusText,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildExposureComparisonCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You're being exposed to less pollution today than you do on a typical day.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 80), FlSpot(4, 85), FlSpot(8, 75),
                        FlSpot(12, 95), FlSpot(16, 90), FlSpot(20, 85),
                        FlSpot(24, 90),
                      ],
                      isCurved: true,
                      color: Colors.blue.shade300,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 50), FlSpot(4, 55), FlSpot(8, 60),
                        FlSpot(12, 70), FlSpot(16, 65), FlSpot(20, 60),
                        FlSpot(24, 62),
                      ],
                      isCurved: true,
                      color: Colors.green.shade400,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyReportCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Exposure Report',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'A data-driven summary of your ambient pollutant exposure over the past 24 hours.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3), FlSpot(2.6, 2), FlSpot(4.9, 5),
                        FlSpot(6.8, 3.1), FlSpot(8, 4), FlSpot(9.5, 3),
                        FlSpot(11, 4), FlSpot(12, 3.5), FlSpot(14, 5),
                        FlSpot(16, 4), FlSpot(18, 6), FlSpot(20, 5),
                        FlSpot(22, 5.5), FlSpot(24, 6.5),
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.green.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivitySuggestionsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Activity Suggestions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Personalized Action Plan based on daily activities and your air quality goals.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5,
              children: const [
                ActivityChip(
                    icon: Icons.home_work_outlined,
                    label: 'Stay in air-purified area'),
                ActivityChip(
                    icon: Icons.fitness_center_outlined,
                    label: 'Exercise indoors'),
                ActivityChip(icon: Icons.masks_outlined, label: 'Wear a mask'),
                ActivityChip(
                    icon: Icons.monitor_heart_outlined,
                    label: 'Obtain an AQI monitor'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getWeekDayTitles(
      double value, TitleMeta meta, List<DailyAnalyticsData> data) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final day = data[value.toInt()].date;
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(DateFormat('E').format(day), style: style),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y1,
      double y2,
      double width,
      Color color1,
      Color color2,
      ) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: color1,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: y2,
          color: color2,
          width: width,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}

class ActivityChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const ActivityChip({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}