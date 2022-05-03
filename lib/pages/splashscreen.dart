import 'dart:async';
import 'package:colhesoja/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController controller;
  Location location = new Location();

  void temporizador() async {
    LocationData data = await location.getLocation();
    Timer(const Duration(seconds: 5), ((){
      Get.to(HomePage(lat: data.latitude ,lng: data.longitude));
    }));
  }

  @override
    initState() {
      super.initState();
      controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4, milliseconds: 30),
    )..addListener(() {
        setState(() {});
      });
      temporizador();
      
    }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 219, 170, 35),
                Color.fromARGB(255, 175, 134, 20),
                Color.fromARGB(255, 139, 105, 9)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
            ],
          ),
        );
  }
}