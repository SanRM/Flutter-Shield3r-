import 'dart:html' as html;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shield3r/cubits/cubits.dart';
import 'package:shield3r/cubits/page_change_manager/page_change_manager_cubit.dart';
import 'package:shield3r/widgets/charts.dart';
import 'package:shield3r/widgets/responsive.dart';
import 'package:shield3r/widgets/static_app_bar.dart';

final controll1Container = ExpansionTileController();
final controll2Container = ExpansionTileController();
final controll3Container = ExpansionTileController();

class MissionControl extends StatefulWidget {
  const MissionControl({super.key});

  @override
  State<MissionControl> createState() => _MissionControlState();
}

class _MissionControlState extends State<MissionControl> {
  double _height = 0;
  double _width = 0;

  @override
  Widget build(BuildContext context) {
    _height = Responsive(context: context).getDeviceHeight();
    _width = Responsive(context: context).getDeviceWidth();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 26, 26, 26),
            height: _height,
            width: _width,
          ),
          PrincipalBoard(height: _height, width: _width),
          StaticAppBar(width: _width, height: _height, showOtherOptions: true),
        ],
      ),
    );
  }
}

class PrincipalBoard extends StatelessWidget {
  const PrincipalBoard({
    super.key,
    required double height,
    required double width,
  })  : _height = height,
        _width = width;

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: Container(
        height: _height / 1.1,
        width: _width,
        alignment: Alignment.center,
        //color: Colors.red,
        padding: EdgeInsets.symmetric(
            vertical: _height / 30, horizontal: _width / 50),
        child: AccountSection(width: _width, height: _height),
      ),
    );
  }
}

class MissionControlPanel extends StatefulWidget {
  const MissionControlPanel({
    super.key,
    required double width,
    required double height,
    //required bool incidentsIsSelected
  })  : _width = width,
        _height = height;
  //_incidentsIsSelected = incidentsIsSelected;

  final double _width;
  final double _height;
  //final bool _incidentsIsSelected;

  @override
  State<MissionControlPanel> createState() => _MissionControlPanelState();
}

class _MissionControlPanelState extends State<MissionControlPanel> {
  final AppCharts charts = AppCharts();

  bool incidentDetails = false;
  //final incidentDetails = context.watch<PageChangeManagerCubit>().state;

  MissionControlTitle() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      height: widget._height / 10,
      width: widget._width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: context.watch<PageChangeManagerCubit>().state
            ? Colors.pink
            : const Color.fromRGBO(0, 255, 149, 1),
      ),
      child: Text(
        context.watch<PageChangeManagerCubit>().state == true
            ? 'INCIDENTS'
            : 'MISSION CONTROL',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: context.watch<PageChangeManagerCubit>().state
                ? const Color.fromARGB(255, 88, 0, 29)
                : const Color.fromRGBO(0, 75, 44, 1),
            fontFamily: 'Poppins-Bold',
            fontSize: widget._height / 18),
      ),
    );
  }

  panel1() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 75, 75, 75),
      ),
      width: widget._width / 8,
      padding: EdgeInsets.symmetric(
        horizontal: widget._width / 100,
        vertical: widget._height / 50,
      ),
      child: Column(
        children: [
          Container(
            width: widget._width,
            //color: const Color.fromARGB(255, 92, 0, 212),
            alignment: Alignment.center,
            child: Text(
              'Security Posture',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Poppins-Bold',
                fontSize: widget._width / 90,
              ),
            ),
          ),
          Container(
            width: widget._width,
            height: widget._height / 15,
            //color: const Color.fromARGB(255, 0, 212, 0),
            alignment: Alignment.center,
            child: Text(
              'Key Indicators',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Poppins-Bold',
                fontSize: widget._width / 125,
              ),
            ),
          ),

          //color: Colors.red,
          Theme(
            data: ThemeData(
              scrollbarTheme: const ScrollbarThemeData(
                thumbColor:
                    MaterialStatePropertyAll(Color.fromARGB(33, 0, 0, 0)),
                thickness: MaterialStatePropertyAll(5),
                thumbVisibility: MaterialStatePropertyAll(false),
              ),
            ),
            child: Container(
              width: widget._width,
              height: widget._height / 1.95,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    KeyIndicator(
                        width: widget._width,
                        height: widget._height,
                        title: 'THREAT ACTIONS',
                        principalNumber: 1,
                        secondaryNumber: -15.0,
                        state: false),
                    const Divider(),
                    SizedBox(
                      height: widget._height / 30,
                    ),
                    KeyIndicator(
                        width: widget._width,
                        height: widget._height,
                        title: 'ENDPOINT ACTIONS',
                        principalNumber: 2,
                        secondaryNumber: -103.0,
                        state: false),
                    const Divider(),
                    SizedBox(
                      height: widget._height / 30,
                    ),
                    KeyIndicator(
                        width: widget._width,
                        height: widget._height,
                        title: 'NETWORK ACTIONS',
                        principalNumber: 15,
                        secondaryNumber: -13.0,
                        state: false),
                    const Divider(),
                    SizedBox(
                      height: widget._height / 30,
                    ),
                    KeyIndicator(
                        width: widget._width,
                        height: widget._height,
                        title: 'ACCESS ACTIONS',
                        principalNumber: 0,
                        secondaryNumber: 4,
                        state: true),
                    const Divider(),
                    SizedBox(
                      height: widget._height / 30,
                    ),
                    KeyIndicator(
                        width: widget._width,
                        height: widget._height,
                        title: 'THREAT ACTIONS',
                        principalNumber: 1,
                        secondaryNumber: -15.0,
                        state: false),
                    const Divider(),
                    SizedBox(
                      height: widget._height / 30,
                    ),
                    KeyIndicator(
                        width: widget._width,
                        height: widget._height,
                        title: 'ENDPOINT ACTIONS',
                        principalNumber: 2,
                        secondaryNumber: -103.0,
                        state: false),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  panel2() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 75, 75, 75),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: widget._width / 100,
          vertical: widget._height / 50,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Container(
              width: widget._width,
              //color: const Color.fromARGB(255, 92, 0, 212),
              alignment: Alignment.centerLeft,
              child: Text(
                'Notable events by urgency',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Poppins-Bold',
                  fontSize: widget._width / 90,
                ),
              ),
            ),
            SizedBox(
              height: widget._height / 100,
            ),
            Expanded(
              child: Container(
                width: widget._width,
                //color: const Color.fromARGB(255, 92, 0, 212),
                child: BarChart(charts.secondaryChart()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  panel3() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 75, 75, 75),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: widget._width / 100,
          vertical: widget._height / 50,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Container(
              width: widget._height,
              //color: const Color.fromARGB(255, 92, 0, 212),
              alignment: Alignment.centerLeft,
              child: Text(
                'Notable events over time',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Poppins-Bold',
                  fontSize: widget._width / 90,
                ),
              ),
            ),
            SizedBox(
              height: widget._height / 100,
            ),
            Expanded(
              child: Container(
                width: widget._width,
                //color: const Color.fromARGB(255, 92, 0, 212),
                child: LineChart(
                  charts.firstChart(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tableItem(date, ruleName, Sparkline, incidentNumber, State, ManageRedirect,
      num1, num2, num3, num4, num5, num6, num7, num8, num9, num10, num11, num12,
      [buttonActive = false]) {
    return TableRow(
      children: [
        TableText(height: widget._height, text: '$date'),
        TableText(height: widget._height, text: ruleName),
        Container(
          //color: Colors.red,
          width: widget._width,
          height: widget._height / 15,
          margin: const EdgeInsets.all(20),
          child: LineChart(
            charts.tertiaryChart(num1, num2, num3, num4, num5, num6, num7, num8,
                num9, num10, num11, num12),
          ),
        ),
        TableText(height: widget._height, text: incidentNumber),
        // Container(
        //   padding: const EdgeInsets.all(10),
        //   alignment: Alignment.center,
        //   //color: Colors.red,
        //   child: Text(
        //     State,
        //     style: TextStyle(
        //         fontSize: widget._height / 50,
        //         color: State == 'Neutralized'
        //             ? const Color.fromARGB(255, 2, 241, 109)
        //             : const Color.fromARGB(255, 255, 15, 67),
        //         fontWeight: FontWeight.bold),
        //   ),
        // ),
        Container(
          width: 10,
          //color: Colors.red,
          margin: const EdgeInsets.all(11),
          child: buttonActive
              ? ElevatedButton(
                  onPressed: buttonActive
                      ? () {
                          setState(() {
                            incidentDetails = true;
                            context
                                .read<PageChangeManagerCubit>()
                                .setPage(true);
                            context
                                .read<ButtonStateCubit>()
                                .setIncidentsControlState(false);
                            context
                                .read<ButtonStateCubit>()
                                .setMissionControlState(true);
                          });

                          //print(ManageRedirect);
                        }
                      : () {},
                  style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                          Color.fromARGB(19, 255, 0, 34)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  child: Text(
                    buttonActive ? 'Pending' : 'Neutralized',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: widget._height / 50,
                        color: State == 'Neutralized'
                            ? const Color.fromARGB(255, 2, 241, 109)
                            : Color.fromARGB(255, 255, 12, 65),
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Text(
                  buttonActive ? 'Pending' : 'Neutralized',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget._height / 50,
                      color: const Color.fromARGB(255, 2, 241, 109),
                      fontWeight: FontWeight.bold),
                ),
        ),
      ],
    );
  }

  panel4() {
    return Container(
      width: widget._width,
      height: widget._height / 3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 75, 75, 75),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widget._width / 100,
        vertical: widget._height / 50,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            width: widget._width,
            //color: const Color.fromARGB(255, 92, 0, 212),
            alignment: Alignment.centerLeft,
            child: Text(
              'Top Notable Events',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Poppins-Bold',
                fontSize: widget._width / 90,
              ),
            ),
          ),
          SizedBox(
            height: widget._height / 100,
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                scrollbarTheme: const ScrollbarThemeData(
                  thumbColor:
                      MaterialStatePropertyAll(Color.fromARGB(61, 0, 0, 0)),
                  thickness: MaterialStatePropertyAll(5),
                  thumbVisibility: MaterialStatePropertyAll(true),
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  width: widget._width,
                  //color: const Color.fromARGB(255, 92, 0, 212),
                  child: Table(
                    border: TableBorder.all(
                      color: Colors.white,
                      width: 2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: const FlexColumnWidth(1.5),
                      1: const FlexColumnWidth(2),
                      2: const FlexColumnWidth(5),
                      3: const FlexColumnWidth(2.5),
                      4: const FlexColumnWidth(1.7),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableText(
                              height: widget._height,
                              text: 'Date & Time',
                              textBold: true),
                          TableText(
                              height: widget._height,
                              text: 'Rule name',
                              textBold: true),
                          TableText(
                              height: widget._height,
                              text: 'Sparkline',
                              textBold: true),
                          TableText(
                              height: widget._height,
                              text: 'Incidet number',
                              textBold: true),
                          // TableText(
                          //     height: widget._height,
                          //     text: 'State',
                          //     textBold: true),
                          TableText(
                              height: widget._height,
                              text: 'State',
                              textBold: true),
                        ],
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(DateTime.now()),
                        'Threat activity detected',
                        'a',
                        '54SD-65DE54R-001',
                        'Pending',
                        'a',
                        1, 2, 2, 9, 3, 7, 4, 6, 2, 6, 11, 4,
                        true, // Hora y fecha ficticia
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(minutes: 5))),
                        'Intrusion Detection Warning',
                        'a',
                        '78DF-23GH89Y-002',
                        'Neutralized',
                        'a',
                        3,
                        9,
                        5,
                        4,
                        5,
                        7,
                        4,
                        8,
                        3,
                        10,
                        5,
                        2,
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(minutes: 8))),
                        'Unauthorized Access Attempt',
                        'a',
                        '45JK-78BN32M-003',
                        'Neutralized',
                        'a',
                        4,
                        8,
                        3,
                        9,
                        4,
                        6,
                        0,
                        5,
                        9,
                        10,
                        3,
                        6,
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(minutes: 10))),
                        'Data Exfiltration Detected',
                        'a',
                        '90PL-12CV67B-004',
                        'Neutralized',
                        'a',
                        5,
                        7,
                        2,
                        4,
                        9,
                        6,
                        9,
                        8,
                        9,
                        9,
                        11,
                        7,
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(minutes: 15))),
                        'Network Anomaly Detected',
                        'a',
                        '23RT-56FG12H-005',
                        'Neutralized',
                        'a',
                        6,
                        3,
                        3,
                        4,
                        4,
                        4,
                        7,
                        7,
                        9,
                        9,
                        8,
                        9,
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(minutes: 30))),
                        'Ransomware Activity Detected',
                        'a',
                        '67XZ-89LK43Q-006',
                        'Neutralized',
                        'a',
                        7,
                        4,
                        4,
                        4,
                        4,
                        6,
                        7,
                        8,
                        4,
                        10,
                        11,
                        9,
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(minutes: 35))),
                        'Botnet Activity Detected',
                        'a',
                        '34VY-01NM76P-007',
                        'Neutralized',
                        'a',
                        8,
                        5,
                        5,
                        4,
                        8,
                        6,
                        7,
                        4,
                        9,
                        4,
                        5,
                        9,
                      ),
                      tableItem(
                        DateFormat('M/d/y \n h:mm a').format(
                            DateTime.now().subtract(Duration(hours: 2))),
                        'Brute Force Attack Alert',
                        'a',
                        '89RF-45UI23O-008',
                        'Neutralized',
                        'a',
                        9,
                        6,
                        8,
                        9,
                        4,
                        0,
                        4,
                        8,
                        9,
                        10,
                        11,
                        3,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  panel5() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 243, 18, 18),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: widget._width / 100,
          vertical: widget._height / 50,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Container(
              width: widget._width,
              //color: const Color.fromARGB(255, 92, 0, 212),
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Notable Events',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Poppins-Bold',
                  fontSize: widget._width / 90,
                ),
              ),
            ),
            SizedBox(
              height: widget._height / 100,
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }

  bool container1Hover = false;
  bool container1Pressed = false;
  bool container2Hover = false;
  bool container2Pressed = false;
  bool container3Hover = false;
  bool container3Pressed = false;

  //List contenedores = [];
  double progress = 0;

  updateProgressIndicator(containerPressed) {
    if (containerPressed) {
      progress = progress + 1 / 3;
    } else {
      progress = progress - 1 / 3;
    }
  }

  static openNewTab(String setUrl) {
    return html.window.open(setUrl, 'Download');
  }

  panel6() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        //color: Colors.pink
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        //color: Colors.red,
        width: widget._width,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(widget._height / 80),
                alignment: Alignment.topCenter,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      incidentDetails = !incidentDetails;
                    });
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: widget._width / 100,
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: widget._width,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    right: widget._width / 100,
                    left: widget._width / 50,
                    top: widget._height / 50,
                    bottom: widget._height / 50),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Theme(
                  data: ThemeData(
                      scrollbarTheme: ScrollbarThemeData(
                          thumbVisibility: MaterialStatePropertyAll(true),
                          thumbColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 58, 58, 58)))),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Incident information',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins-Bold',
                            fontSize: widget._width / 60,
                          ),
                        ),
                        SizedBox(height: widget._height / 40),
                        Text(
                          'Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins-Bold',
                            fontSize: widget._width / 70,
                          ),
                        ),
                        SizedBox(
                          height: widget._height / 200,
                        ),
                        Text(
                          'Threat Activity Detected',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins',
                            fontSize: widget._width / 90,
                          ),
                        ),
                        SizedBox(height: widget._height / 40),
                        Text(
                          'Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins-Bold',
                            fontSize: widget._width / 70,
                          ),
                        ),
                        SizedBox(
                          height: widget._height / 200,
                        ),
                        Text(
                          'Suspicious or potentially harmful activity has been detected, indicating a security threat',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins',
                            fontSize: widget._width / 90,
                          ),
                        ),
                        SizedBox(height: widget._height / 40),
                        Text(
                          'Number Id',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins-Bold',
                            fontSize: widget._width / 70,
                          ),
                        ),
                        SizedBox(
                          height: widget._height / 200,
                        ),
                        Text(
                          '54SD-65DE54R-001',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins',
                            fontSize: widget._width / 90,
                          ),
                        ),
                        SizedBox(height: widget._height / 40),
                        Text(
                          'Category',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins-Bold',
                            fontSize: widget._width / 70,
                          ),
                        ),
                        SizedBox(
                          height: widget._height / 200,
                        ),
                        Text(
                          'Endpoint',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins',
                            fontSize: widget._width / 90,
                          ),
                        ),
                        SizedBox(
                          height: widget._height / 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget._width / 100,
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: widget._width,
                //color: const Color.fromARGB(255, 92, 0, 212),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    right: widget._width / 100,
                    top: widget._height / 50,
                    bottom: widget._height / 50),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: widget._height / 25,
                          right: widget._height / 40,
                          //top: widget._height / 100,
                          bottom: widget._height / 100),
                      child: Text(
                        'Implement countermeasures to mitigate risk',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Poppins-Bold',
                          fontSize: widget._width / 60,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: widget._height / 25,
                          right: widget._height / 40,
                          top: widget._height / 50,
                          bottom: widget._height / 25),
                      child: AnimatedProgressIndicator(
                        progress: progress,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.cyan,
                        child: SingleChildScrollView(
                          primary: false,
                          
                          child: Column(
                            
                            children: [
                              
                              IncidentItem(
                                controller: controll1Container,
                                title: 'CONTAINMENT',
                                icon: Icons.security,
                                checkVariableState: context.watch<IncidentButtonsCubit>().state.cointainer1Finished,
                                widget: widget,
                                containerPressed: context
                                    .read<IncidentButtonsCubit>()
                                    .state
                                    .container1Pressed,
                                checkboxColumn: [
                                  CheckBoxAction(
                                    title: 'Network Segmentation',
                                    description:
                                        'Implement network segmentation to isolate critical systems and contain the spread of security threats.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsCubit>()
                                        .state
                                        .container1Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsCubit>(),
                                    id: 1,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title:
                                        'Isolation of Compromised Devices',
                                    description:
                                        'Isolate compromised devices from the network to prevent further spread of security threats.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsCubit>()
                                        .state
                                        .container2Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsCubit>(),
                                    id: 2,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Suspension of User Accounts',
                                    description:
                                        'Temporarily suspend user accounts associated with security incidents to contain potential risks.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsCubit>()
                                        .state
                                        .container3Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsCubit>(),
                                    id: 3,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Application Quarantine Measures',
                                    description:
                                        'Implement quarantine measures for affected applications to prevent them from causing further harm.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsCubit>()
                                        .state
                                        .container4Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsCubit>(),
                                    id: 4,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Traffic Filtering and Monitoring',
                                    description:
                                        'Enhance traffic filtering and monitoring mechanisms to quickly identify and contain suspicious network activities.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsCubit>()
                                        .state
                                        .container5Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsCubit>(),
                                    id: 5,
                                  ),
                                  context.watch<IncidentButtonsCubit>().state.container1Checkbox == true ||
                                  context.watch<IncidentButtonsCubit>().state.container2Checkbox == true ||
                                  context.watch<IncidentButtonsCubit>().state.container3Checkbox == true ||
                                  context.watch<IncidentButtonsCubit>().state.container4Checkbox == true ||
                                  context.watch<IncidentButtonsCubit>().state.container5Checkbox == true
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: widget._height / 25,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: FilledButton.tonal(
                                                onPressed: () {
                                                  setState(() {
                                                    context.read<IncidentButtonsCubit>().toggleContainerFinished();
                                                    updateProgressIndicator(context.read<IncidentButtonsCubit>().state.cointainer1Finished);

                                                    context.read<IncidentButtonsCubit>().state.cointainer1Finished ?
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                const Color.fromARGB(255, 49, 49, 49),
                                                            title: const Text(
                                                              'The following actions were executed',
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w900,
                                                                fontSize: 35,
                                                              ),
                                                            ),
                                                            content: Container(
                                                              height: 200,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Network Segmentation',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  
                                                                  
                                                                  
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Isolation of Compromised Devices',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Suspension of User Accounts',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Application Quarantine Measures',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Traffic Filtering and Monitoring',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              // FilledButton.tonal(
                                                              //   style: const ButtonStyle(
                                                              //     overlayColor: MaterialStatePropertyAll(
                                                              //         Color.fromARGB(255, 255, 255, 255)),
                                                              //     backgroundColor: MaterialStatePropertyAll(
                                                              //         Color.fromARGB(255, 224, 224, 224)),
                                                              //   ),
                                                              //   onPressed: () {
                                                              //     // openNewTab(
                                                              //     //     'https://drive.google.com/uc?export=download&id=1tV8NRA5xUqK2-qmLHkggG-mgiHqXf0ia');
                                                              //   },
                                                              //   child: const Text(
                                                              //     'Download incident report',
                                                              //     textAlign: TextAlign.center,
                                                              //     style: TextStyle(
                                                              //       color: Colors.black,
                                                              //       fontFamily: 'Poppins',
                                                              //       fontWeight: FontWeight.w900,
                                                              //       fontSize: 20,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              FilledButton.tonal(
                                                                style: const ButtonStyle(
                                                                  overlayColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 108, 122)),
                                                                  backgroundColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 87, 99)),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                  controll1Container.collapse();
                                                                },
                                                                child: const Text(
                                                                  'Accept',
                                                                  style: TextStyle(
                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )
                                                      : null;
                                                    }

                                              
                                                  );
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.white)),
                                                child: Text(
                                                  'Contain',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 56, 56, 56),
                                                    fontFamily: 'Poppins-Bold',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: widget._height / 25,
                                  ),
                                ],
                              ),
                              
                              SizedBox(
                                height: 10,
                              ),

                              IncidentItem(
                                controller: controll2Container,
                                title: 'ERADICATION',
                                icon: Icons.delete,
                                checkVariableState: context.watch<IncidentButtonsContainer2Cubit>().state.cointainer1Finished,
                                widget: widget,
                                containerPressed: context
                                    .read<IncidentButtonsContainer2Cubit>()
                                    .state
                                    .container1Pressed,
                                checkboxColumn: [
                                  CheckBoxAction(
                                    title: 'Enhanced Firewall Protection',
                                    description:
                                        'Upgrade and configure firewalls to provide enhanced protection against cyber threats.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer2Cubit>()
                                        .state
                                        .container1Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer2Cubit>(),
                                    id: 1,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title:
                                        'Implementation of Intrusion Detection Systems',
                                    description:
                                        'Deploy Intrusion Detection Systems to identify and respond to potential security breaches.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer2Cubit>()
                                        .state
                                        .container2Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer2Cubit>(),
                                    id: 2,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Isolation of Compromised Devices',
                                    description:
                                        'Isolate compromised devices from the network to prevent further threats and attacks.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer2Cubit>()
                                        .state
                                        .container3Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer2Cubit>(),
                                    id: 3,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Data Encryption Protocols',
                                    description:
                                        'Implement strong data encryption protocols to safeguard sensitive information.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer2Cubit>()
                                        .state
                                        .container4Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer2Cubit>(),
                                    id: 4,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Regular Security Audits',
                                    description:
                                        'Conduct regular security audits to identify and address potential vulnerabilities.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer2Cubit>()
                                        .state
                                        .container5Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer2Cubit>(),
                                    id: 5,
                                  ),
                                  context.watch<IncidentButtonsContainer2Cubit>().state.container1Checkbox == true ||
                                  context.watch<IncidentButtonsContainer2Cubit>().state.container2Checkbox == true ||
                                  context.watch<IncidentButtonsContainer2Cubit>().state.container3Checkbox == true ||
                                  context.watch<IncidentButtonsContainer2Cubit>().state.container4Checkbox == true ||
                                  context.watch<IncidentButtonsContainer2Cubit>().state.container5Checkbox == true
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: widget._height / 25,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: FilledButton.tonal(
                                                onPressed: () {
                                                  setState(() {
                                                    context.read<IncidentButtonsContainer2Cubit>().toggleContainerFinished();
                                                    updateProgressIndicator(context.read<IncidentButtonsContainer2Cubit>().state.cointainer1Finished);

                                                    context.read<IncidentButtonsContainer2Cubit>().state.cointainer1Finished ?
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            backgroundColor: const Color.fromARGB(255, 49, 49, 49),
                                                            title: const Text(
                                                              'The following actions were executed',
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w900,
                                                                fontSize: 35,
                                                              ),
                                                            ),
                                                            content: Container(
                                                              height: 200,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Enhanced Firewall Protection',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  
                                                                  
                                                                  
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Implementation of Intrusion Detection Systems',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Isolation of Compromised Devices',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Data Encryption Protocols',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Regular Security Audits',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              // FilledButton.tonal(
                                                              //   style: const ButtonStyle(
                                                              //     overlayColor: MaterialStatePropertyAll(
                                                              //         Color.fromARGB(255, 255, 255, 255)),
                                                              //     backgroundColor: MaterialStatePropertyAll(
                                                              //         Color.fromARGB(255, 224, 224, 224)),
                                                              //   ),
                                                              //   onPressed: () {
                                                              //     // openNewTab(
                                                              //     //     'https://drive.google.com/uc?export=download&id=1tV8NRA5xUqK2-qmLHkggG-mgiHqXf0ia');
                                                              //   },
                                                              //   child: const Text(
                                                              //     'Download incident report',
                                                              //     textAlign: TextAlign.center,
                                                              //     style: TextStyle(
                                                              //       color: Colors.black,
                                                              //       fontFamily: 'Poppins',
                                                              //       fontWeight: FontWeight.w900,
                                                              //       fontSize: 20,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              FilledButton.tonal(
                                                                style: const ButtonStyle(
                                                                  overlayColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 108, 122)),
                                                                  backgroundColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 87, 99)),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                  controll2Container.collapse();
                                                                },
                                                                child: const Text(
                                                                  'Accept',
                                                                  style: TextStyle(
                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )
                                                      : null;
                                                    }

                                              
                                                  );
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.white)),
                                                child: Text(
                                                  'Contain',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 56, 56, 56),
                                                    fontFamily: 'Poppins-Bold',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: widget._height / 25,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 10,
                              ),                              

                              IncidentItem(
                                controller: controll3Container,
                                title: 'RECOVERY',
                                icon: Icons.verified,
                                checkVariableState: context.watch<IncidentButtonsContainer3Cubit>().state.cointainer1Finished,
                                widget: widget,
                                containerPressed: context
                                    .read<IncidentButtonsContainer3Cubit>()
                                    .state
                                    .container1Pressed,
                                checkboxColumn: [
                                  CheckBoxAction(
                                    title: 'Data Backup and Recovery Plan',
                                    description:
                                        'Establish a comprehensive data backup and recovery plan to minimize data loss in case of a security incident.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer3Cubit>()
                                        .state
                                        .container1Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer3Cubit>(),
                                    id: 1,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title:
                                        'Incident Response Team Activation',
                                    description:
                                        'Activate an incident response team to quickly respond to and mitigate the impact of security incidents.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer3Cubit>()
                                        .state
                                        .container2Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer3Cubit>(),
                                    id: 2,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'System Restoration Protocols',
                                    description:
                                        'Implement protocols for the systematic restoration of systems and services affected by security incidents.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer3Cubit>()
                                        .state
                                        .container3Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer3Cubit>(),
                                    id: 3,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Communication and Notification Procedures',
                                    description:
                                        'Establish communication and notification procedures to keep stakeholders informed during the recovery process.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer3Cubit>()
                                        .state
                                        .container4Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer3Cubit>(),
                                    id: 4,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Post-Incident Analysis',
                                    description:
                                        'Conduct a thorough analysis of security incidents to identify lessons learned and improve future incident response.',
                                    checkVariableState: context
                                        .watch<IncidentButtonsContainer3Cubit>()
                                        .state
                                        .container5Checkbox,
                                    checkVariableMethods: context.watch<IncidentButtonsContainer3Cubit>(),
                                    id: 5,
                                  ),
                                  context.watch<IncidentButtonsContainer3Cubit>().state.container1Checkbox == true ||
                                  context.watch<IncidentButtonsContainer3Cubit>().state.container2Checkbox == true ||
                                  context.watch<IncidentButtonsContainer3Cubit>().state.container3Checkbox == true ||
                                  context.watch<IncidentButtonsContainer3Cubit>().state.container4Checkbox == true ||
                                  context.watch<IncidentButtonsContainer3Cubit>().state.container5Checkbox == true
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: widget._height / 25,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: FilledButton.tonal(
                                                onPressed: () {
                                                  setState(() {
                                                    context.read<IncidentButtonsContainer3Cubit>().toggleContainerFinished();
                                                    updateProgressIndicator(context.read<IncidentButtonsContainer3Cubit>().state.cointainer1Finished);

                                                    context.read<IncidentButtonsContainer3Cubit>().state.cointainer1Finished ?
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                const Color.fromARGB(255, 49, 49, 49),
                                                            title: const Text(
                                                              'Security incident 54SD-65DE54R-001 \n was successfully handled',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 0, 199, 116),
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w900,
                                                                fontSize: 35,
                                                              ),
                                                            ),
                                                            
                                                            actions: [
                                                              FilledButton.tonal(
                                                                style: const ButtonStyle(
                                                                  overlayColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 255, 255, 255)),
                                                                  backgroundColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 224, 224, 224)),
                                                                ),
                                                                onPressed: () {
                                                                  openNewTab(
                                                                      'https://drive.google.com/uc?export=download&id=1tV8NRA5xUqK2-qmLHkggG-mgiHqXf0ia');
                                                                },
                                                                child: const Text(
                                                                  'Download incident report',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontFamily: 'Poppins',
                                                                    fontWeight: FontWeight.w900,
                                                                    fontSize: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              FilledButton.tonal(
                                                                style: const ButtonStyle(
                                                                  overlayColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 108, 122)),
                                                                  backgroundColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 87, 99)),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                  controll3Container.collapse();
                                                                },
                                                                child: const Text(
                                                                  'Accept',
                                                                  style: TextStyle(
                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      )
                                                      : null;

                                                                                                          showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                const Color.fromARGB(255, 49, 49, 49),
                                                            title: const Text(
                                                              'The following actions were executed',
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w900,
                                                                fontSize: 35,
                                                              ),
                                                            ),
                                                            content: Container(
                                                              height: 200,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Data Backup and Recovery Plan',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  
                                                                  
                                                                  
                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Incident Response Team Activation',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'System Restoration Protocols',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Communication and Notification Procedures',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    //color: Colors.red,
                                                                    alignment: Alignment.center,
                                                                    child:  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Post-Incident Analysis',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 25,
                                                                              color:
                                                                                  Color.fromARGB(255, 0, 199, 116)),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                      Expanded(
                                                                          child: Container(
                                                                            height: 2,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 40,
                                                                        ),
                                                                        Text(
                                                                          'Success',
                                                                          style: TextStyle(
                                                                            fontSize: 25,
                                                                            color: Color.fromARGB(255, 0, 199, 116),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              // FilledButton.tonal(
                                                              //   style: const ButtonStyle(
                                                              //     overlayColor: MaterialStatePropertyAll(
                                                              //         Color.fromARGB(255, 255, 255, 255)),
                                                              //     backgroundColor: MaterialStatePropertyAll(
                                                              //         Color.fromARGB(255, 224, 224, 224)),
                                                              //   ),
                                                              //   onPressed: () {
                                                              //     // openNewTab(
                                                              //     //     'https://drive.google.com/uc?export=download&id=1tV8NRA5xUqK2-qmLHkggG-mgiHqXf0ia');
                                                              //   },
                                                              //   child: const Text(
                                                              //     'Download incident report',
                                                              //     textAlign: TextAlign.center,
                                                              //     style: TextStyle(
                                                              //       color: Colors.black,
                                                              //       fontFamily: 'Poppins',
                                                              //       fontWeight: FontWeight.w900,
                                                              //       fontSize: 20,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              FilledButton.tonal(
                                                                style: const ButtonStyle(
                                                                  overlayColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 108, 122)),
                                                                  backgroundColor: MaterialStatePropertyAll(
                                                                      Color.fromARGB(255, 0, 87, 99)),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                  controll3Container.collapse();
                                                                },
                                                                child: const Text(
                                                                  'Accept',
                                                                  style: TextStyle(
                                                                    color: Color.fromARGB(255, 255, 255, 255),
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                                                    }

                                                    
                                              
                                                  );
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.white)),
                                                child: Text(
                                                  'Contain',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 56, 56, 56),
                                                    fontFamily: 'Poppins-Bold',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: widget._height / 25,
                                  ),
                                ],
                              ),

                              context.read<IncidentButtonsCubit>().state.cointainer1Finished == true && context.read<IncidentButtonsContainer2Cubit>().state.cointainer1Finished == true && context.read<IncidentButtonsContainer3Cubit>().state.cointainer1Finished == true 
                              ?
                              Container(
                                margin: EdgeInsets.only(
                                  left: widget._height / 25,
                                  right: widget._height / 40,
                                  top: widget._height / 60,
                                  bottom: widget._height / 60),
                                width: double.infinity,
                                child: FilledButton.tonal(
                                  style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 255, 255, 255)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 224, 224, 224)),
                                  ),
                                  onPressed: () {
                                    openNewTab(
                                        'https://drive.google.com/uc?export=download&id=1tV8NRA5xUqK2-qmLHkggG-mgiHqXf0ia');
                                  },
                                  child: const Text(
                                    'Download incident report',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                              : Container()
                            ],
                          ),
                        ),
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

  getActualPage() {
    if (context.watch<PageChangeManagerCubit>().state) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: widget._height / 40),
          width: widget._width,
          height: widget._height,
          child: incidentDetails ? panel6() : panel4(),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 59, 255, 222),
              color: Colors.transparent),
          margin: EdgeInsets.only(top: widget._height / 40),
          width: widget._width,
          height: widget._height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              panel1(),
              SizedBox(
                width: widget._width / 100,
              ),
              Expanded(
                child: Container(
                  //color: Colors.red,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              panel2(),
                              SizedBox(
                                width: widget._width / 100,
                              ),
                              panel3(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: widget._height / 50,
                      ),
                      panel4()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._width / 1.22,
      height: widget._height / 1.2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 46, 46, 46),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: widget._width / 80, vertical: widget._height / 40),
      child: Container(
        //color: Colors.cyan,
        color: Colors.transparent,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MissionControlTitle(),
                getActualPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IncidentItem extends StatelessWidget {
  const IncidentItem({
    super.key,
    required this.widget,
    required this.containerPressed,
    required this.checkboxColumn,
    required this.checkVariableState,
    required this.title,
    required this.icon,
    required this.controller,
  });

  final MissionControlPanel widget;
  final bool checkVariableState;
  final bool containerPressed;
  final List<Widget> checkboxColumn;
  final String title;
  final IconData icon;
  final ExpansionTileController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget._width,
      margin: EdgeInsets.only(
          left: widget._height / 25,
          right: widget._height / 40,
          //top: widget._height / 50,
          bottom: widget._height / 70),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color:
            checkVariableState
            ? const Color.fromRGBO(0, 255, 149, 1)
            :
            const Color.fromARGB(255, 255, 69, 109),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile( 
          
          //controller: controller,
          leading: Container(
            child: Icon(
              icon,
              color: checkVariableState ? Color.fromRGBO(0, 75, 44, 1) : Color.fromARGB(255, 104, 0, 22),
              size: 50,
            ),
          ),
          title: Container(
            //color: Colors.cyan,
            alignment: Alignment.centerLeft,
            height: 70,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: checkVariableState ? Color.fromRGBO(0, 75, 44, 1) : Color.fromARGB(255, 104, 0, 22),
                fontFamily: 'Poppins-Bold',
                fontSize: widget._height / 25,
              ),
            ),
          ),
          shape: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
          iconColor: Color.fromARGB(255, 70, 70, 70),
          collapsedIconColor: Color.fromARGB(255, 70, 70, 70),
          tilePadding: EdgeInsets.only(left: 15, right: 39, top: 10, bottom: 10),
          childrenPadding: EdgeInsets.symmetric(horizontal: 20),
          children: checkboxColumn),
    );
  }
}

class CheckBoxAction extends StatefulWidget {
  const CheckBoxAction({
    required this.title,
    required this.description,
    required this.checkVariableState,
    required this.checkVariableMethods,
    required this.id,
    super.key,
  });

  final bool checkVariableState;
  final checkVariableMethods;
  final String title;
  final String description;
  final int id;

  @override
  State<CheckBoxAction> createState() => _CheckBoxActionState();
}

class _CheckBoxActionState extends State<CheckBoxAction> {
  late ConfettiController _centerController;
  bool downloadCSV = false;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _centerController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 70, 70, 70),
      ),
      //margin: const EdgeInsets.only(right: 27),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Poppins-Bold',
                      fontSize: 20,
                    ),
                  ),
                ),
                Checkbox(
                  fillColor: const MaterialStatePropertyAll(Colors.transparent),
                  checkColor: const Color.fromARGB(255, 0, 199, 7),
                  overlayColor: const MaterialStatePropertyAll(
                      Color.fromARGB(28, 0, 0, 0)),
                  side: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 214, 54, 102)),
                  value: widget.checkVariableState,
                  onChanged: (value) {
                    setState(() {
                      widget.checkVariableMethods.toggleContainerCheckbox(widget.id);
                      print(widget.checkVariableState);
                     
                    });

                    // if (widget.lastfield) {
                    //   if (active) {
                    //     showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           backgroundColor:
                    //               const Color.fromARGB(255, 49, 49, 49),
                    //           title: const Text(
                    //             'Threat successfully eradicated!',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontFamily: 'Poppins',
                    //               fontWeight: FontWeight.w900,
                    //               fontSize: 35,
                    //             ),
                    //           ),
                    //           content: Container(
                    //             height: 170,
                    //             child: Column(
                    //               children: [
                    //                 Align(
                    //                   alignment: Alignment.center,
                    //                   child: ConfettiWidget(
                    //                     confettiController: _centerController,
                    //                     blastDirection: 180,
                    //                     maxBlastForce: 5,
                    //                     minBlastForce: 1,
                    //                     emissionFrequency: 0.001,

                    //                     // 10 paticles will pop-up at a time
                    //                     numberOfParticles: 5,

                    //                     // particles will pop-up
                    //                     gravity: 0,
                    //                   ),
                    //                 ),
                    //                 const Text(
                    //                   '11 users',
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 30,
                    //                       color:
                    //                           Color.fromARGB(255, 0, 199, 116)),
                    //                 ),
                    //                 const Text(
                    //                   'Successfully blocked',
                    //                   style: TextStyle(
                    //                     fontSize: 25,
                    //                     color: Color.fromARGB(255, 0, 199, 116),
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 10,
                    //                 ),
                    //                 const Text(
                    //                   '191 shares',
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 30,
                    //                       color:
                    //                           Color.fromARGB(255, 0, 199, 116)),
                    //                 ),
                    //                 const Text(
                    //                   'Successfully arrested',
                    //                   style: TextStyle(
                    //                     fontSize: 25,
                    //                     color: Color.fromARGB(255, 0, 199, 116),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           actions: [
                    //             FilledButton.tonal(
                    //               style: const ButtonStyle(
                    //                 overlayColor: MaterialStatePropertyAll(
                    //                     Color.fromARGB(255, 255, 255, 255)),
                    //                 backgroundColor: MaterialStatePropertyAll(
                    //                     Color.fromARGB(255, 224, 224, 224)),
                    //               ),
                    //               onPressed: () {
                    //                 openNewTab(
                    //                     'https://drive.google.com/uc?export=download&id=1tV8NRA5xUqK2-qmLHkggG-mgiHqXf0ia');
                    //               },
                    //               child: const Text(
                    //                 'Download incident report',
                    //                 textAlign: TextAlign.center,
                    //                 style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontFamily: 'Poppins',
                    //                   fontWeight: FontWeight.w900,
                    //                   fontSize: 20,
                    //                 ),
                    //               ),
                    //             ),
                    //             FilledButton.tonal(
                    //               style: const ButtonStyle(
                    //                 overlayColor: MaterialStatePropertyAll(
                    //                     Color.fromARGB(255, 0, 108, 122)),
                    //                 backgroundColor: MaterialStatePropertyAll(
                    //                     Color.fromARGB(255, 0, 87, 99)),
                    //               ),
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text(
                    //                 'Accept',
                    //                 style: TextStyle(
                    //                   color: Color.fromARGB(255, 255, 255, 255),
                    //                   fontFamily: 'Poppins',
                    //                   fontSize: 20,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   }

                    //   _centerController.play();
                    // }
                  },
                ),
              ],
            ),
            widget.checkVariableState
                ? Container(
                    color: const Color.fromARGB(255, 70, 70, 70),
                    alignment: Alignment.centerLeft,
                    child: AnimatedTextKit(
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          widget.description,
                          textAlign: TextAlign.start,
                          speed: const Duration(milliseconds: 20),
                          curve: Curves.linear,
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  State<AnimatedProgressIndicator> createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    final colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(
            begin: const Color.fromARGB(255, 244, 54, 86),
            end: const Color.fromARGB(255, 255, 123, 0)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(
            begin: const Color.fromARGB(255, 255, 123, 0),
            end: const Color.fromARGB(255, 251, 255, 0)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(
            begin: const Color.fromARGB(255, 251, 255, 0),
            end: const Color.fromARGB(255, 1, 255, 107)),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.linear));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    _controller.animateTo(widget.progress);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        minHeight: 5,
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }
}

class TableText extends StatelessWidget {
  const TableText(
      {super.key,
      required this.height,
      required this.text,
      this.textBold = false});

  final double height;
  final String text;
  final bool textBold;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      //color: Colors.red,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: height / 50,
            color: Colors.white,
            fontWeight: textBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class KeyIndicator extends StatelessWidget {
  const KeyIndicator({
    super.key,
    required double width,
    required double height,
    required String title,
    required double principalNumber,
    required double secondaryNumber,
    required bool state,
  })  : _width = width,
        _height = height,
        _title = title,
        _principalNumber = principalNumber,
        _secondaryNumber = secondaryNumber,
        _state = state;

  final double _width;
  final double _height;
  final String _title;
  final double _principalNumber;
  final double _secondaryNumber;
  final bool _state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      //color: Color.fromARGB(255, 0, 205, 212),
      //alignment: Alignment.centerLeft,
      //padding: EdgeInsets.only(top: _height / 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins-Bold',
              fontSize: _width / 125,
            ),
          ),
          Row(
            children: [
              Text(
                '$_principalNumber.0',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Poppins-Bold',
                  fontSize: _height / 25,
                ),
              ),
              _state
                  ? Icon(
                      Icons.arrow_upward_rounded,
                      color: const Color.fromARGB(255, 244, 54, 86),
                      size: _height / 30,
                    )
                  : Icon(
                      Icons.arrow_downward_rounded,
                      color: const Color.fromARGB(255, 54, 244, 117),
                      size: _height / 30,
                    ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$_secondaryNumber.0',
                  style: TextStyle(
                    color: _state
                        ? const Color.fromARGB(255, 244, 54, 86)
                        : const Color.fromARGB(255, 54, 244, 117),
                    fontFamily: 'Poppins-Bold',
                    fontSize: _height / 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountSection extends StatefulWidget {
  const AccountSection({
    super.key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  //bool incidentsIsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: widget._width / 7.9,
          height: widget._height / 1.2,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: widget._width / 80,
            vertical: widget._height / 40,
          ),
          child: Container(
            //color: Color.fromARGB(255, 75, 75, 75),
            width: widget._width,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      //color: Colors.red,
                      width: widget._width,
                      height: widget._height / 10,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('resources/images/avatar.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Container(
                      width: widget._width,
                      //color: Colors.cyan,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Ingeniero #0231',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: widget._width / 125),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  width: widget._width,
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        context
                            .read<ButtonStateCubit>()
                            .setIncidentsControlState(true);
                        context
                            .read<ButtonStateCubit>()
                            .setMissionControlState(false);
                        context.read<PageChangeManagerCubit>().setPage(false);
                      });
                    },
                    style: ButtonStyle(
                        overlayColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 108, 122)),
                        backgroundColor: MaterialStatePropertyAll(context
                                .watch<ButtonStateCubit>()
                                .state
                                .incidentsControlState
                            ? const Color.fromARGB(255, 0, 87, 99)
                            : Colors.transparent)),
                    child: Text(
                      'Mision Control',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: widget._width / 125),
                    ),
                  ),
                ),
                Container(
                  width: widget._width,
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        context
                            .read<ButtonStateCubit>()
                            .setIncidentsControlState(false);
                        context
                            .read<ButtonStateCubit>()
                            .setMissionControlState(true);
                        context.read<PageChangeManagerCubit>().setPage(true);
                      });
                    },
                    style: ButtonStyle(
                        overlayColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 108, 122)),
                        backgroundColor: MaterialStatePropertyAll(context
                                .watch<ButtonStateCubit>()
                                .state
                                .missionControlState
                            ? const Color.fromARGB(255, 0, 87, 99)
                            : Colors.transparent)),
                    child: Text(
                      'Incidents',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: widget._width / 125),
                    ),
                  ),
                ),
                Container(
                  width: widget._width,
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    },
                    style: const ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 122, 0, 30)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    child: Text(
                      'Log out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: widget._width / 125),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // incidentsIsSelected == true
        //     ? IncidentsControlPanel(
        //         width: widget._width, height: widget._height)
        //     : MissionControlPanel(height: widget._height, width: widget._width),
        MissionControlPanel(width: widget._width, height: widget._height)
        //incidentsIsSelected: incidentsIsSelected)
      ],
    );
  }
}
