import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shield3r/widgets/responsive.dart';
import 'package:shield3r/widgets/static_app_bar.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String userName = 'User';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _height = 0;
  double _width = 0;

  double loginBoxOpacity = 0;

  @override
  void initState() {
    super.initState();

    _updateLoginBoxHeight();
  }

  void _updateLoginBoxHeight() async {
    await Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          loginBoxOpacity = 1;
        });
      },
    );
  }

  buildBody() {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 26, 26, 26),
          height: _height,
          width: _width,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.cyan,
                ),
                width: _width / 2.7,
                height: _height / 1.5,
                // child: Image.asset(
                //   'resources/images/banner3.jpg',
                //   fit: BoxFit.cover,
                //   height: _height / 10,
                // ),
                padding: EdgeInsets.symmetric(
                    horizontal: _width / 90, vertical: _height / 40),
                //padding: EdgeInsets.all(10),
                child: Image.asset(
                  'resources/images/banner2.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                width: _width / 2.7,
                height: _height / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginAppBar(width: _width, height: _height),
                    TextFormFields(width: _width, height: _height),
                    AccessButton(
                        width: _width, height: _height, context: context),
                    //SizedBox(height: _height / 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = Responsive(context: context).getDeviceHeight();
    _width = Responsive(context: context).getDeviceWidth();

    return Scaffold(
      body: Stack(
        children: [
          buildBody(),
          StaticAppBar(width: _width, height: _height, showOtherOptions: false),
        ],
      ),
    );
  }
}

class AccessButton extends StatefulWidget {
  const AccessButton({
    super.key,
    required double width,
    required double height,
    required this.context,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;
  final BuildContext context;

  @override
  State<AccessButton> createState() => _AccessButtonState();
}

class _AccessButtonState extends State<AccessButton> {
  bool access = false;
  bool isloading = false;

  bool loginIsAproved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: widget._width / 50,
        left: widget._width / 50,
        bottom: widget._height / 30,
      ),
      child: InkWell(
        onHover: (value) {
          setState(() {
            access = !access;
          });
        },
        onTap: () async {
          _formKey.currentState?.validate();


          var randomNum = Random().nextInt(3) + 1;

          if (_formKey.currentState?.validate() == true) {
            setState(() {
              isloading = !isloading;
            });

            Future.delayed(
              Duration(seconds: randomNum),
              () {
                Navigator.pushReplacementNamed(
                  context,
                  '/missionControl',
                  arguments: userName,
                );
              },
            );
          }
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            padding: EdgeInsets.symmetric(vertical: widget._height / 100),
            curve: Curves.decelerate,
            width: widget._width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: access
                        ? const Color.fromRGBO(17, 211, 149, 1)
                        : const Color.fromARGB(255, 26, 26, 26),
                    width: 2),
                color: access
                    ? const Color.fromRGBO(17, 211, 149, 1)
                    : const Color.fromARGB(255, 26, 26, 26)),
            child: isloading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: widget._width / 10,
                      ),
                      Icon(
                        Icons.key,
                        color: access
                            ? const Color.fromARGB(255, 26, 26, 26)
                            : const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Enter',
                        style: TextStyle(
                          color: access
                              ? const Color.fromARGB(255, 26, 26, 26)
                              : const Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: widget._height / 40,
                        ),
                      ),
                      SizedBox(
                        width: widget._width / 10,
                      ),
                    ],
                  )),
      ),
    );
  }
}

class TextFormFields extends StatefulWidget {
  const TextFormFields({
    super.key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.white,
      ),
      margin: EdgeInsets.only(
        right: widget._width / 70,
        left: widget._width / 70,
        bottom: widget._height / 30,
      ),
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              // height: _height / 3,
              // width: _width / 3.75,
              //color: const Color.fromARGB(255, 255, 255, 255),
              alignment: Alignment.centerRight,
              child: TextFormField(
                //controller: nameController,
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo de texto obligatorio';
                  }
                  return null;
                },

                decoration: InputDecoration(
                    labelText: 'Username',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 26, 26, 26),
                      fontWeight: FontWeight.bold),
                  errorStyle: const TextStyle(
                      color: Color.fromARGB(255, 244, 54, 95),
                      fontWeight: FontWeight.bold),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 244, 54, 95), width: 1)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 244, 54, 95), width: 2)),
                  icon: const Icon(Icons.person,
                      color: Color.fromARGB(255, 26, 26, 26)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 25, 204, 106))),
                  floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 26, 26, 26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 26, 26, 26),
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.name,
                cursorColor: const Color.fromARGB(255, 26, 26, 26),
                cursorWidth: 1.5,
              ),
            ),
            SizedBox(
              height: widget._height / 25,
            ),
            Container(
              // height: _height / 3,
              // width: _width / 3.75,
              //color: const Color.fromARGB(255, 255, 255, 255),
              alignment: Alignment.centerRight,
              child: TextFormField(
                //controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo de texto obligatorio';
                  }
                  return null;
                },

                decoration: InputDecoration(
                    labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 26, 26, 26),
                      fontWeight: FontWeight.bold),
                  errorStyle: const TextStyle(
                      color: Color.fromARGB(255, 244, 54, 95),
                      fontWeight: FontWeight.bold),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 244, 54, 95), width: 1)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 244, 54, 95), width: 2)),
                  icon: const Icon(Icons.lock,
                      color: Color.fromARGB(255, 26, 26, 26)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 25, 204, 106))),
                  floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 26, 26, 26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                obscureText: true,
                style: const TextStyle(
                  color: Color.fromARGB(255, 26, 26, 26),
                  fontWeight: FontWeight.bold,
                ),

                keyboardType: TextInputType.visiblePassword,
                cursorColor: const Color.fromARGB(255, 26, 26, 26),
                cursorWidth: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({
    super.key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: const Color.fromARGB(255, 54, 143, 244),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: _width / 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 26, 26, 26),
            ),
            margin: EdgeInsets.only(
              top: _height / 30,
              right: _width / 60,
              bottom: _height / 30,
            ),
            padding: const EdgeInsets.all(10),
            height: _height / 8,
            child: Image.asset(
              'resources/images/logo4.png',
              height: _height / 10,
            ),
          ),
          Container(
            //color: Colors.cyan,
            child: Column(
              children: [
                SizedBox(
                  height: _height / 100,
                ),
                Container(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: _height / 15,
                      fontFamily: 'Poppins-Bold',
                    ),
                  ),
                ),
                Container(
                  height: _height / 80,
                  width: _width / 6,
                  color: const Color.fromARGB(255, 26, 26, 26),
                )
              ],
            ),
          ),
          SizedBox(
            width: _width / 50,
          ),
        ],
      ),
    );
  }
}
