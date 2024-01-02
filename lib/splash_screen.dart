import 'package:flutter/material.dart';
import 'package:questions/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.ac_unit_rounded, size: 60),
          CircularProgressIndicator(
            //دايرة التحميل
            color: Colors.blue[800],
            backgroundColor: Colors.deepPurple, //الجزء ال بتلف علية
          ),
        ],
      ),
    ));
  }
}
