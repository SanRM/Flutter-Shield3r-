import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
//import 'package:shield3r/principal_page/principal_page_body.dart';
import 'package:shield3r/widgets/responsive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _containerColor = Colors.transparent;
  double _height = 0;
  double _width = 0;
  double _appBarHeight = 110;

  double _container1Opacity = 0;
  double _container2Opacity = 0;
  double _container3Opacity = 0;

  bool container1Selected = false;
  bool container2Selected = false;
  bool container3Selected = false;

  bool quickStart = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _containerColor = _scrollController.offset < 50
            ? Colors.transparent
            : const Color.fromARGB(148, 0, 0, 0);

        _appBarHeight = _scrollController.offset < 50 ? 110 : 105;

        _container1Opacity = _scrollController.offset < _height / 15 ? 0 : 1;
        _container2Opacity = _scrollController.offset < _height / 5 ? 0 : 1;
        _container3Opacity = _scrollController.offset < _height / 3.5 ? 0 : 1;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  logo() {
    return Image.asset(
      'resources/images/logo.png',
      height: _height / 10,
    );
  }

  // createTextBlock(text, container, containerIsSelected) {

  //   return InkWell(
  //     onHover: (value) {
  //       print('hola');
  //       setState(
  //         () {
  //           containerSelected = containerSelected == false ? true : false;
  //         },
  //       );
  //     },
  //     onTap: () {
  //       print('a');
  //     },
  //     child: AnimatedOpacity(
  //         opacity: container,
  //         duration: const Duration(seconds: 1),
  //         curve: Curves.fastLinearToSlowEaseIn,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: Colors.blue,
  //           ),
  //           width: containerSelected ? _width / 4 : _width / 4.1,
  //           height: _height,
  //         ),
  //       ),
  //   );
  // }

  createCard(opacity, text) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color.fromARGB(255, 32, 32, 32)),
          color: const Color.fromARGB(255, 46, 46, 46),
        ),
        width: _width / 3.8,
        height: _height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: _width / 100),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: _height / 24,
            fontFamily: 'Poppins-Bold',
          ),
        ),
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

  buildBody() {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            const Color.fromRGBO(0, 180, 124, 1),
          ),
          thumbVisibility: const MaterialStatePropertyAll(true),
          thickness: const MaterialStatePropertyAll(10),
          radius: const Radius.circular(15),
          trackVisibility: const MaterialStatePropertyAll(true),
          trackColor: const MaterialStatePropertyAll(
            Color.fromARGB(160, 0, 0, 0),
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 26, 26, 26),
              height: _height * 1.4,
              width: _width,
            ),
            SizedBox(
              height: _height,
              width: _width,
              child: Image.asset(
                'resources/images/banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: _height / 4,
              right: _width / 10,
              child: AnimatedContainer(
                duration: const Duration(seconds: 500),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(160, 0, 0, 0),
                ),
                curve: Curves.decelerate,
                width: _width / 2.5,
                child: Column(
                  children: [
                    Container(
                      //color: Colors.red,
                      width: _width,
                      margin: EdgeInsets.only(
                          top: _height / 30,
                          left: _width / 60,
                          right: _width / 60),
                      child: DefaultTextStyle(
                        style: const TextStyle(),
                        child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'CIBERSEGURIDAD NATIVA EN LA NUBE',
                              cursor: '',
                              speed: const Duration(milliseconds: 100),
                              curve: Easing.legacyDecelerate,
                              textStyle: TextStyle(
                                fontSize: _height / 18,
                                fontFamily: 'Poppins-Bold',
                                color: const Color.fromRGBO(219, 255, 244, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      //color: Colors.blue,
                      width: _width,
                      margin: EdgeInsets.only(
                          top: _height / 100,
                          left: _width / 60,
                          right: _width / 60),
                      child: DefaultTextStyle(
                        style: TextStyle(
                            color: const Color.fromRGBO(219, 255, 244, 1),
                            fontFamily: 'Poppins',
                            fontSize: _height / 30),
                        child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'Respuesta automatizada para proteger tus activos digitales.',
                                speed: const Duration(milliseconds: 40)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //color: Color.fromARGB(255, 244, 54, 219),
                      width: _width,
                      margin: EdgeInsets.only(
                          top: _height / 50,
                          left: _width / 60,
                          right: _width / 60),
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            quickStart = !quickStart;
                          });
                        },
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.decelerate,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: quickStart ?  const Color.fromRGBO(2, 255, 175, 1) : const Color.fromRGBO(0, 180, 124, 1),
                                width: 2),
                            color: quickStart
                                ? const Color.fromRGBO(2, 255, 175, 1)
                                : Colors.transparent,
                          ),

                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _width / 80,
                                vertical: _height / 100),
                            child: Text(
                              'Inicio rápido',
                              style: TextStyle(
                                color: quickStart ? const Color.fromRGBO(5, 54, 39, 1) : const Color.fromRGBO(17, 211, 149, 1),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w900,
                                fontSize: _height / 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: _width,
                      //color: Colors.red,
                      margin: EdgeInsets.only(
                          top: _height / 100,
                          left: _width / 60,
                          right: _width / 60,
                          bottom: _height / 30),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: const Color.fromRGBO(241, 74, 52, 1),
                          fontFamily: 'Poppins-Bold',
                          fontSize: _height / 20,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          //totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText('>',
                                speed: const Duration(seconds: 1)),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   //color: Colors.blue,
                    //   margin: EdgeInsets.only(
                    //       top: _height / 30,
                    //       left: _width / 60,
                    //       right: _width / 60),
                    //   child: Text(
                    //     'CIBERSEGURIDAD NATIVA EN LA NUBE',
                    //     style: TextStyle(
                    //         color: const Color.fromRGBO(219, 255, 244, 1),
                    //         fontFamily: 'Poppins-Bold',
                    //         fontSize: _height / 18),
                    //   ),
                    // ),
                    // Container(
                    //   //color: const Color.fromARGB(255, 184, 33, 243),
                    //   margin: EdgeInsets.only(
                    //       top: _height / 100,
                    //       left: _width / 60,
                    //       right: _width / 60),
                    //   child: Text(
                    //     'Respuesta automatizada para proteger tus activos digitales.',
                    //     style: TextStyle(
                    //         color: const Color.fromRGBO(219, 255, 244, 1),
                    //         fontSize: _height / 30),
                    //   ),
                    // ),
                    // Container(
                    //   //color: Color.fromARGB(255, 33, 100, 243),
                    //   margin: EdgeInsets.only(
                    //       top: _height / 100,
                    //       left: _width / 60,
                    //       right: _width / 60,
                    //       bottom: _height / 30),
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     '>_',
                    //     style: TextStyle(
                    //         color: const Color.fromRGBO(255, 98, 0, 1),
                    //         fontFamily: 'Poppins-Bold',
                    //         fontSize: _height / 20),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _height / 1.15,
              right: _width / 20,
              left: _width / 20,
              child: Container(
                //color: Colors.red,
                width: _width / 1.2,
                height: _height / 4,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    createCard(_container1Opacity,
                        'Integración de herramientas y automatización'),
                    createCard(_container2Opacity,
                        'Optimización del conocimiento y del tiempo'),
                    createCard(_container3Opacity,
                        'Recopilación de datos relevantes para el análisis de eventos'),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _height * 1.4 / 1.20,
              right: _width / 20,
              left: _width / 20,
              child: Container(
                //color: Colors.red,
                width: _width / 1.2,
                height: _height / 5,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'resources/images/logo2.png',
                      height: _height / 10,
                    ),
                    Image.asset(
                      'resources/images/logo.png',
                      height: _height / 10,
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

  buildAppBar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      color: _containerColor,
      height: _appBarHeight,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: _width / 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo(),
            navigationButtons(),
          ],
        ),
      ),
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
          buildAppBar(),
        ],
      ),
    );
  }


}
