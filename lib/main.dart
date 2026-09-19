import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
 
//---------------------------------------------------
 
void main() {
  runApp(
    FlutterBodyHealthCalculatorProject(),
  );
}
 
//----------------------------------------------------
 
class FlutterBodyHealthCalculatorProject extends StatefulWidget {
  const FlutterBodyHealthCalculatorProject({super.key});
 
  @override
  State<FlutterBodyHealthCalculatorProject> createState() =>  _FlutterBodyHealthCalculatorProjectState();
}
 
class _FlutterBodyHealthCalculatorProjectState  extends State<FlutterBodyHealthCalculatorProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}