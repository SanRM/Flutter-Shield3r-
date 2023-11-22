import 'dart:html' as html;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shield3r/widgets/charts.dart';
import 'package:shield3r/widgets/responsive.dart';
import 'package:shield3r/widgets/static_app_bar.dart';

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
          StaticAppBar(width: _width, height: _height),
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
  const MissionControlPanel(
      {super.key,
      required double width,
      required double height,
      required bool incidentsIsSelected})
      : _width = width,
        _height = height,
        _incidentsIsSelected = incidentsIsSelected;

  final double _width;
  final double _height;
  final bool _incidentsIsSelected;

  @override
  State<MissionControlPanel> createState() => _MissionControlPanelState();
}

class _MissionControlPanelState extends State<MissionControlPanel> {
  final AppCharts charts = AppCharts();

  bool incidentDetails = false;

  MissionControlTitle() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      height: widget._height / 10,
      width: widget._width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: widget._incidentsIsSelected
            ? Colors.pink
            : const Color.fromRGBO(0, 255, 149, 1),
      ),
      child: Text(
        widget._incidentsIsSelected ? 'INCIDENTS' : 'MISSION CONTROL',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: widget._incidentsIsSelected
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
            child: Expanded(
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

  tableItem(
      version, ruleName, Sparkline, incidentNumber, State, ManageRedirect) {
    return version == 1
        ? TableRow(
            children: [
              TableText(height: widget._height, text: ruleName),
              Container(
                //color: Colors.red,
                width: widget._width,
                height: widget._height / 15,
                margin: const EdgeInsets.all(20),
                child: LineChart(
                  charts.tertiaryChart(),
                ),
              ),
              TableText(height: widget._height, text: incidentNumber),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                //color: Colors.red,
                child: Text(
                  State,
                  style: TextStyle(
                      fontSize: widget._height / 50,
                      color: State == 'Neutralized'
                          ? const Color.fromARGB(255, 2, 241, 109)
                          : const Color.fromARGB(255, 255, 15, 67),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        : TableRow(
            children: [
              TableText(height: widget._height, text: ruleName),
              Container(
                //color: Colors.red,
                width: widget._width,
                height: widget._height / 15,
                margin: const EdgeInsets.all(20),
                child: LineChart(
                  charts.tertiaryChart(),
                ),
              ),
              TableText(height: widget._height, text: incidentNumber),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                //color: Colors.red,
                child: Text(
                  State,
                  style: TextStyle(
                      fontSize: widget._height / 50,
                      color: State == 'Neutralized'
                          ? const Color.fromARGB(255, 2, 241, 109)
                          : const Color.fromARGB(255, 255, 15, 67),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 10,
                //color: Colors.red,
                margin: const EdgeInsets.all(11),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      incidentDetails = incidentDetails == true ? false : true;
                    });

                    //print(ManageRedirect);
                  },
                  style: const ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 0, 108, 122)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  child: Text(
                    'Examine',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: widget._width / 125),
                  ),
                ),
              ),
            ],
          );
  }

  panel4() {
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
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: const FlexColumnWidth(2),
                        1: const FlexColumnWidth(5),
                        2: const FlexColumnWidth(2.5),
                        3: const FlexColumnWidth(1.5),
                        4: const FlexColumnWidth(1.5),
                      },
                      children: [
                        TableRow(
                          children: [
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
                            TableText(
                                height: widget._height,
                                text: 'State',
                                textBold: true),
                          ],
                        ),
                        tableItem(1, 'Threat activity detected', 'a',
                            '54SD-65DE54R-001', 'Neutralized', 'a'),
                        tableItem(1, 'Intrusion Detection Warning', 'a',
                            '78DF-23GH89Y-002', 'Not resolved', 'a'),
                        tableItem(1, 'Unauthorized Access Attempt', 'a',
                            '45JK-78BN32M-003', 'Neutralized', 'a'),
                        tableItem(1, 'Data Exfiltration Detected', 'a',
                            '90PL-12CV67B-004', 'Neutralized', 'a'),
                        tableItem(1, 'Network Anomaly Detected', 'a',
                            '23RT-56FG12H-005', 'Not resolved', 'a'),
                        tableItem(1, 'Ransomware Activity Detected', 'a',
                            '67XZ-89LK43Q-006', 'Neutralized', 'a'),
                        tableItem(1, 'Botnet Activity Detected', 'a',
                            '34VY-01NM76P-007', 'Neutralized', 'a'),
                        tableItem(1, 'Brute Force Attack Alert', 'a',
                            '89RF-45UI23O-008', 'Neutralized', 'a'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  panel4WithOutManage() {
    return Container(
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
                      0: const FlexColumnWidth(2),
                      1: const FlexColumnWidth(5),
                      2: const FlexColumnWidth(2.5),
                      3: const FlexColumnWidth(1.5),
                      4: const FlexColumnWidth(1.5),
                    },
                    children: [
                      TableRow(
                        children: [
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
                          TableText(
                              height: widget._height,
                              text: 'State',
                              textBold: true),
                          TableText(
                              height: widget._height,
                              text: 'Manage',
                              textBold: true),
                        ],
                      ),
                      tableItem(2, 'Intrusion Detection Warning', 'a',
                          '78DF-23GH89Y-002', 'Neutralized', 'a'),
                      tableItem(2, 'Threat activity detected', 'a',
                          '54SD-65DE54R-001', 'Not resolved', 'a'),
                      tableItem(2, 'Unauthorized Access Attempt', 'a',
                          '45JK-78BN32M-003', 'Neutralized', 'a'),
                      tableItem(2, 'Data Exfiltration Detected', 'a',
                          '90PL-12CV67B-004', 'Neutralized', 'a'),
                      tableItem(2, '2, Network Anomaly Detected', 'a',
                          '23RT-56FG12H-005', 'Not resolved', 'a'),
                      tableItem(2, 'Ransomware Activity Detected', 'a',
                          '67XZ-89LK43Q-006', 'Neutralized', 'a'),
                      tableItem(2, 'Botnet Activity Detected', 'a',
                          '34VY-01NM76P-007', 'Neutralized', 'a'),
                      tableItem(2, 'Brute Force Attack Alert', 'a',
                          '89RF-45UI23O-008', 'Neutralized', 'a'),
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
                      thumbColor: MaterialStatePropertyAll(Color.fromARGB(255, 58, 58, 58))
                    )
                  ),
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
                        container1Pressed
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedTextKit(
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        '''1. CONTAIN''',
                                        textAlign: TextAlign.start,
                                        textStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'Poppins-Bold',
                                          fontSize: widget._width / 70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Network Segmentation',
                                    description:
                                        'Implement network segmentation to isolate critical systems and contain the spread of security threats.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Isolation of Compromised Devices',
                                    description:
                                        'Isolate compromised devices from the network to prevent further spread of security threats.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Suspension of User Accounts',
                                    description:
                                        'Temporarily suspend user accounts associated with security incidents to contain potential risks.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Application Quarantine Measures',
                                    description:
                                        'Implement quarantine measures for affected applications to prevent them from causing further harm.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Traffic Filtering and Monitoring',
                                    description:
                                        'Enhance traffic filtering and monitoring mechanisms to quickly identify and contain suspicious network activities.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                
                //
                                ],
                              )
                            : Container(),
                        container2Pressed
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: widget._height / 40,
                                  ),
                                  AnimatedTextKit(
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        '''2. ERADICATE''',
                                        textAlign: TextAlign.start,
                                        textStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'Poppins-Bold',
                                          fontSize: widget._width / 70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CheckBoxAction(
                                    title: 'Enhanced Firewall Protection',
                                    description:
                                        'Upgrade and configure firewalls to provide enhanced protection against cyber threats.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title:
                                        'Implementation of Intrusion Detection Systems',
                                    description:
                                        'Deploy Intrusion Detection Systems to identify and respond to potential security breaches.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Isolation of Compromised Devices',
                                    description:
                                        'Isolate compromised devices from the network to prevent further threats and attacks.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Data Encryption Protocols',
                                    description:
                                        'Implement strong data encryption protocols to safeguard sensitive information.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Regular Security Audits',
                                    description:
                                        'Conduct regular security audits to identify and address potential vulnerabilities.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                ],
                              )
                            : Container(),
                        container3Pressed
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: widget._height / 40,
                                  ),
                                  AnimatedTextKit(
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        '''3. RECOVER''',
                                        textAlign: TextAlign.start,
                                        textStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'Poppins-Bold',
                                          fontSize: widget._width / 70,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CheckBoxAction(
                                    title: 'Data Backup and Recovery Plan',
                                    description:
                                        'Establish a comprehensive data backup and recovery plan to minimize data loss in case of a security incident.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Incident Response Team Activation',
                                    description:
                                        'Activate an incident response team to quickly respond to and mitigate the impact of security incidents.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'System Restoration Protocols',
                                    description:
                                        'Implement protocols for the systematic restoration of systems and services affected by security incidents.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title:
                                        'Communication and Notification Procedures',
                                    description:
                                        'Establish communication and notification procedures to keep stakeholders informed during the recovery process.',
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                  CheckBoxAction(
                                    title: 'Post-Incident Analysis',
                                    description:
                                        'Conduct a thorough analysis of security incidents to identify lessons learned and improve future incident response.',
                                        lastfield: true,
                                  ),
                                  SizedBox(
                                    height: widget._height / 80,
                                  ),
                                ],
                              )
                            : Container(),
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
                      margin: EdgeInsets.only(left: widget._height / 50),
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
                          left: widget._height / 50,
                          right: widget._height / 40,
                          top: widget._height / 50,
                          bottom: widget._height / 70),
                      child: AnimatedProgressIndicator(
                        progress: progress,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.cyan,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: widget._width,
                                height: widget._height,
                                // color: const Color.fromARGB(
                                //   166,
                                //   33,
                                //   149,
                                //   243,
                                // ),
                                padding: container1Hover
                                    ? EdgeInsets.symmetric(
                                        horizontal: widget._width / 150,
                                        vertical: widget._height / 75,
                                      )
                                    : EdgeInsets.symmetric(
                                        horizontal: widget._width / 100,
                                        vertical: widget._height / 50,
                                      ),
                                child: InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      container1Hover =
                                          container1Hover ? false : true;
                                      //      print('container1Pressed: $container1Pressed');
                                      // print('container2Pressed: $container2Pressed');
                                      // print('container3Pressed $container3Pressed');
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      container1Pressed =
                                          container1Pressed ? false : true;
                                    });
                                    updateProgressIndicator(container1Pressed);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    decoration: BoxDecoration(
                                      color: container1Pressed
                                          ? const Color.fromRGBO(0, 255, 149, 1)
                                          : const Color.fromARGB(
                                              255, 255, 69, 109),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        var h = constraints.maxHeight;
                                        var w = constraints.maxWidth;

                                        return CreateIncidentButton(
                                          height: h,
                                          width: w,
                                          containerIsPressed: container1Pressed,
                                          title: 'CONTAIN',
                                          icon: Icons.security_rounded,
                                          description:
                                              'Measures are being implemented to limit the spread and impact of the threat, restricting its scope within our systems and networks.',
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: widget._width,
                                height: widget._height,
                                // color: const Color.fromARGB(
                                //   166,
                                //   33,
                                //   149,
                                //   243,
                                // ),
                                padding: container2Hover
                                    ? EdgeInsets.symmetric(
                                        horizontal: widget._width / 150,
                                        vertical: widget._height / 75,
                                      )
                                    : EdgeInsets.symmetric(
                                        horizontal: widget._width / 100,
                                        vertical: widget._height / 50,
                                      ),
                                child: InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      container2Hover =
                                          container2Hover ? false : true;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      container2Pressed =
                                          container2Pressed ? false : true;
                                    });

                                    updateProgressIndicator(container2Pressed);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    decoration: BoxDecoration(
                                      color: container2Pressed
                                          ? const Color.fromRGBO(0, 255, 149, 1)
                                          : const Color.fromARGB(
                                              255, 255, 69, 109),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: LayoutBuilder(
                                        builder: (context, constraints) {
                                      var h = constraints.maxHeight;
                                      var w = constraints.maxWidth;

                                      return CreateIncidentButton(
                                        height: h,
                                        width: w,
                                        containerIsPressed: container2Pressed,
                                        icon: Icons.delete,
                                        title: 'ERADICATE',
                                        description:
                                            'Actions are being taken to completely eliminate the threat and its effects, ensuring thorough cleansing and full restoration of the systems.',
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: widget._width,
                                height: widget._height,
                                // color: const Color.fromARGB(
                                //   166,
                                //   33,
                                //   149,
                                //   243,
                                // ),
                                padding: container3Hover
                                    ? EdgeInsets.symmetric(
                                        horizontal: widget._width / 150,
                                        vertical: widget._height / 75,
                                      )
                                    : EdgeInsets.symmetric(
                                        horizontal: widget._width / 100,
                                        vertical: widget._height / 50,
                                      ),
                                child: InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      container3Hover =
                                          container3Hover ? false : true;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      container3Pressed =
                                          container3Pressed ? false : true;
                                    });

                                    updateProgressIndicator(container3Pressed);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    decoration: BoxDecoration(
                                      color: container3Pressed
                                          ? const Color.fromRGBO(0, 255, 149, 1)
                                          : const Color.fromARGB(
                                              255, 255, 69, 109),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        var h = constraints.maxHeight;
                                        var w = constraints.maxWidth;

                                        return CreateIncidentButton(
                                          height: h,
                                          width: w,
                                          containerIsPressed: container3Pressed,
                                          icon: Icons.verified,
                                          title: 'RECOVER',
                                          description:
                                              'Affected systems and data are being restored, corrective measures implemented, and security strengthened.',
                                        );
                                      },
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }

  getActualPage() {
    if (widget._incidentsIsSelected) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: widget._height / 40),
          width: widget._width,
          height: widget._height,
          child: incidentDetails ? panel6() : panel4WithOutManage(),
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

class CheckBoxAction extends StatefulWidget {
  const CheckBoxAction({
    required this.title,
    required this.description,
    this.lastfield = false,
    super.key,
  });

  final bool lastfield;
  final String title;
  final String description;

  @override
  State<CheckBoxAction> createState() => _CheckBoxActionState();
}

class _CheckBoxActionState extends State<CheckBoxAction> {
  bool active = false;

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

  static openNewTab(String setUrl) {
    return html.window.open(setUrl, 'Download');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 70, 70, 70),
      ),
      margin: const EdgeInsets.only(right: 27),
      child: Container(
        margin: const EdgeInsets.all(10),
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
                  value: active,
                  onChanged: (value) {
                    setState(() {
                      active = !active;
                    });

                    if (widget.lastfield) {
                      if (active) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 49, 49, 49),
                              title: const Text(
                                'Threat successfully eradicated!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 35,
                                ),
                              ),
                              content: Container(
                                height: 170,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: ConfettiWidget(
                                        confettiController: _centerController,
                                        blastDirection: 180,
                                        maxBlastForce: 5,
                                        minBlastForce: 1,
                                        emissionFrequency: 0.001,

                                        // 10 paticles will pop-up at a time
                                        numberOfParticles: 5,

                                        // particles will pop-up
                                        gravity: 0,
                                      ),
                                    ),
                                    const Text(
                                      '11 users',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color:
                                              Color.fromARGB(255, 0, 199, 116)),
                                    ),
                                    const Text(
                                      'Successfully blocked',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 0, 199, 116),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '191 shares',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color:
                                              Color.fromARGB(255, 0, 199, 116)),
                                    ),
                                    const Text(
                                      'Successfully arrested',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 0, 199, 116),
                                      ),
                                    ),
                                  ],
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

                      _centerController.play();
                    }
                  },
                ),
              ],
            ),
            active
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
      duration: const Duration(seconds: 10),
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

class CreateIncidentButton extends StatelessWidget {
  const CreateIncidentButton(
      {super.key,
      required this.height,
      required this.width,
      required this.containerIsPressed,
      required this.title,
      required this.description,
      required this.icon});

  final double height;
  final double width;
  final String title;
  final String description;
  final IconData icon;
  final bool containerIsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(height / 10),
      //color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
              right: 1,
              child: containerIsPressed
                  ? const Icon(
                      Icons.check,
                      size: 30,
                      color: Color.fromARGB(255, 0, 100, 50),
                    )
                  : const Icon(
                      Icons.warning_amber_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 100, 0, 13),
                    )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.green,
                  height: height,
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: height / 1.2,
                    color: containerIsPressed
                        ? const Color.fromRGBO(0, 97, 57, 1)
                        : const Color.fromARGB(255, 104, 0, 22),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: containerIsPressed
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: containerIsPressed
                                  ? const Color.fromRGBO(0, 97, 57, 1)
                                  : const Color.fromARGB(255, 104, 0, 22),
                              fontFamily: 'Poppins-Bold',
                              fontSize: width / 35,
                            ),
                          ),
                          Text(
                            description,
                            style: TextStyle(
                              color: containerIsPressed
                                  ? const Color.fromRGBO(0, 97, 57, 1)
                                  : const Color.fromARGB(255, 65, 0, 14),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              fontSize: width / 47,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: containerIsPressed
                              ? const Color.fromRGBO(0, 97, 57, 1)
                              : const Color.fromARGB(255, 104, 0, 22),
                          fontFamily: 'Poppins-Bold',
                          fontSize: width / 25,
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
  bool isSelected1 = true;
  bool isSelected2 = false;

  bool incidentsIsSelected = false;

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
                        isSelected2 = false;
                        isSelected1 = true;
                        incidentsIsSelected = false;
                      });
                    },
                    style: ButtonStyle(
                        overlayColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 108, 122)),
                        backgroundColor: MaterialStatePropertyAll(isSelected1
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
                        isSelected2 = true;
                        isSelected1 = false;
                        incidentsIsSelected = true;
                      });
                    },
                    style: ButtonStyle(
                        overlayColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 108, 122)),
                        backgroundColor: MaterialStatePropertyAll(isSelected2
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
        MissionControlPanel(
            width: widget._width,
            height: widget._height,
            incidentsIsSelected: incidentsIsSelected)
      ],
    );
  }
}
