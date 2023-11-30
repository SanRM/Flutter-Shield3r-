import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppCharts {
  LineChartData firstChart() {
    List<Color> gradientColors = [
      Color.fromARGB(255, 1, 204, 194),
      Color.fromARGB(255, 22, 244, 252),
      Color.fromARGB(255, 39, 248, 255),
      Color.fromARGB(255, 4, 176, 199),
    ];

    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'Poppins-Bold');
      Widget text;
      switch (value.toInt()) {
        case 2:
          text = const Text('MAR', style: style);
          break;
        case 5:
          text = const Text('JUN', style: style);
          break;
        case 8:
          text = const Text('SEP', style: style);
          break;
        default:
          text = const Text('', style: style);
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      );
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
          fontFamily: 'Poppins');
      String text;
      switch (value.toInt()) {
        case 1:
          text = '   1k';
          break;
        case 3:
          text = '1.5k';
          break;
        case 5:
          text = '2.5k';
          break;
        default:
          return Container();
      }

      return Text(text, style: style, textAlign: TextAlign.left);
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 2,
        verticalInterval: 3,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(52, 255, 255, 255),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(52, 255, 255, 255),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.transparent),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  _barsGradient() {
    LinearGradient(
      colors: [
        Color.fromARGB(255, 93, 243, 33),
        Color.fromARGB(255, 166, 255, 200),
      ],
    );
  }

  BarChartData secondaryChart() {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.white,
          fontFamily: 'Poppins-Bold');
      Widget text;
      switch (value.toInt()) {
        case 0:
          text = const Text('INFORMATIVE', style: style);
          break;
        case 1:
          text = const Text('LOW', style: style);
          break;
        case 2:
          text = const Text('MEDIUM', style: style);
          break;
        case 3:
          text = const Text('HIGH', style: style);
          break;
        // case 4:
        //   text = const Text('HIGH', style: style);
        //   break;
        // case 5:
        //   text = const Text('SEV', style: style);
        //   break;
        default:
          text = const Text('CRITICAL', style: style);
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      );
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
          fontFamily: 'Poppins');
      String text;
      switch (value.toInt()) {
        case 1:
          text = '10K';
          break;
        case 3:
          text = '30k';
          break;
        case 5:
          text = '60k';
          break;
        default:
          return Container();
      }

      return Text(text, style: style, textAlign: TextAlign.left);
    }

    _barsGradient() {
      return LinearGradient(
        colors: [
          Color.fromARGB(255, 1, 204, 194),
          Color.fromARGB(255, 22, 244, 252),
          Color.fromARGB(255, 39, 248, 255),
          Color.fromARGB(255, 4, 176, 199),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
    }

    return BarChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        horizontalInterval: 2,
        verticalInterval: 3,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(52, 255, 255, 255),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(52, 255, 255, 255),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.transparent),
      ),
      minY: 0,
      maxY: 6,
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                toY: 2.5,
                gradient: _barsGradient(),
                width: 20,
                borderRadius: BorderRadius.circular(4))
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 3,
              gradient: _barsGradient(),
              width: 20,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                toY: 5,
                gradient: _barsGradient(),
                width: 20,
                borderRadius: BorderRadius.circular(4))
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                toY: 4.5,
                gradient: _barsGradient(),
                width: 20,
                borderRadius: BorderRadius.circular(4))
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                toY: 5.5,
                gradient: _barsGradient(),
                width: 20,
                borderRadius: BorderRadius.circular(4))
          ],
        ),
        // BarChartGroupData(
        //   x: 5,
        //   barRods: [
        //     BarChartRodData(
        //         toY: 3.5,
        //         gradient: _barsGradient(),
        //         width: 20,
        //         borderRadius: BorderRadius.circular(4))
        //   ],
        // ),
        // BarChartGroupData(
        //   x: 6,
        //   barRods: [
        //     BarChartRodData(
        //         toY: 2.5,
        //         gradient: _barsGradient(),
        //         width: 20,
        //         borderRadius: BorderRadius.circular(4))
        //   ],
        // ),
      ],
    );
  }

  LineChartData tertiaryChart(num1, num2, num3, num4, num5, num6, num7, num8, num9, num10, num11, num12) {
    List<Color> gradientColors = [
      Color.fromRGBO(Random().nextInt(50), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(100), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(50), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(100), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(50), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(100), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(50), 255, 128, 1),
      Color.fromRGBO(Random().nextInt(100), 255, 128, 1),

      //Color.fromRGBO(0, 255, 128, 1),
    ];

    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'Poppins-Bold');
      Widget text;
      switch (value.toInt()) {
        case 2:
          text = const Text('MAR', style: style);
          break;
        case 5:
          text = const Text('JUN', style: style);
          break;
        case 8:
          text = const Text('SEP', style: style);
          break;
        default:
          text = const Text('', style: style);
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      );
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
          fontFamily: 'Poppins');
      String text;
      switch (value.toInt()) {
        case 1:
          text = '   1k';
          break;
        case 3:
          text = '1.5k';
          break;
        case 5:
          text = '2.5k';
          break;
        default:
          return Container();
      }

      return Text(text, style: style, textAlign: TextAlign.left);
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 5,
        verticalInterval: 3,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(52, 255, 255, 255),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(52, 255, 255, 255),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, num1),
            FlSpot(1, num2),
            FlSpot(2, num3),
            FlSpot(3, num4),
            FlSpot(4, num5),
            FlSpot(5, num6),
            FlSpot(6, num7),
            FlSpot(7, num8),
            FlSpot(8, num9),
            FlSpot(9, num10),
            FlSpot(10, num11),
            FlSpot(11, num12),
          ],
          isCurved: true,
          curveSmoothness: 0.1,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }


}
