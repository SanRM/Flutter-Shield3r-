import 'package:flutter/material.dart';

class Responsive {

  BuildContext? _context;

  Responsive({required BuildContext context}) {
    _context = context;
  }

  getContext() {
    return _context;
  }

  getDeviceWidth(){
    return MediaQuery.of(getContext()).size.width;
  }

  getDeviceHeight(){
    return MediaQuery.of(getContext()).size.height;
  }

}