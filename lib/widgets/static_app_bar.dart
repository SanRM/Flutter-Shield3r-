import 'package:flutter/material.dart';

class StaticAppBar extends StatelessWidget {
  const StaticAppBar({
    super.key,
    required double width,
    required double height,
  }) : _width = width, _height = height;

  final double _width;
  final double _height;

  logo(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: Image.asset(
        'resources/images/logo.png',
        height: _height / 10,
      ),
    );
  }

  navigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            'Mission Control',
            style: TextStyle(color: Colors.white, fontSize: _height / 40),
          ),
        ),
        SizedBox(
          width: _width / 50,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Incidents',
            style: TextStyle(color: Colors.white, fontSize: _height / 40),
          ),
        ),
        SizedBox(
          width: _width / 50,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Documentation',
            style: TextStyle(color: Colors.white, fontSize: _height / 40),
          ),
        ),
        SizedBox(
          width: _width / 50,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'A3Sec',
            style: TextStyle(color: Colors.white, fontSize: _height / 40),
          ),
        ),
        SizedBox(
          width: _width / 40,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      color: Colors.transparent,
      height: 110,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: _width / 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo(context),
            navigationButtons()
          ],
        ),
      ),
    );
  }
}