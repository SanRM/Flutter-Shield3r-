import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:js' as js;

import '../cubits/cubits.dart';

class StaticAppBar extends StatefulWidget {
  const StaticAppBar({
    super.key,
    required double width,
    required double height,
    required bool showOtherOptions,
  })  : _width = width,
        _height = height,
        showOtherOptions = showOtherOptions;

  final double _width;
  final double _height;
  final bool showOtherOptions;

  @override
  State<StaticAppBar> createState() => _StaticAppBarState();
}

class _StaticAppBarState extends State<StaticAppBar> {
  logo(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: Image.asset(
        'resources/images/logo.png',
      ),
    );
  }

  navigationButtons(pageChangeManagerCubit, buttonStateCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.showOtherOptions
            ? Row(
                children: [
                  InkWell(
                    onTap: () {
                      pageChangeManagerCubit.setPage(false);
                      buttonStateCubit.setIncidentsControlState(true);
                      buttonStateCubit.setMissionControlState(false);
                    },
                    child: Text(
                      'Mission Control',
                      style: TextStyle(
                          color: Colors.white, fontSize: widget._height / 40),
                    ),
                  ),
                  SizedBox(
                    width: widget._width / 50,
                  ),
                  InkWell(
                    onTap: () {
                      pageChangeManagerCubit.setPage(true);
                      buttonStateCubit.setIncidentsControlState(false);
                      buttonStateCubit.setMissionControlState(true);
                    },
                    child: Text(
                      'Incidents',
                      style: TextStyle(
                          color: Colors.white, fontSize: widget._height / 40),
                    ),
                  ),
                  SizedBox(
                    width: widget._width / 50,
                  ),
                  InkWell(
                    onTap: () {
                      js.context.callMethod('open', ['https://www.a3sec.com/']);
                    },
                    child: Text(
                      'A3Sec',
                      style: TextStyle(
                          color: Colors.white, fontSize: widget._height / 40),
                    ),
                  ),
                ],
              )
            : InkWell(
                onTap: () {
                  js.context.callMethod('open', ['https://www.a3sec.com/']);
                },
                child: Text(
                  'A3Sec',
                  style: TextStyle(color: Colors.white, fontSize: widget._height / 40),
                ),
              ),
        SizedBox(
          width: widget._width / 40,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final pageChangeManagerCubit = context.watch<PageChangeManagerCubit>();
    final buttonStateCubit = context.watch<ButtonStateCubit>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      color: Colors.transparent,
      height: 110,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: widget._width / 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo(context),
            navigationButtons(pageChangeManagerCubit, buttonStateCubit),
          ],
        ),
      ),
    );
  }
}
