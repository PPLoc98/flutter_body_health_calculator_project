import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/about_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
 
  @override
  State<HomeUI> createState() => _HomeUIState();
}
 
class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรเก็บ index ของรายการที่เลือก
  int _currentIndex = 1;
 
  // สร้างตัวแปรแบบ List คือ ตัวแปร 1 ตัวเก็บได้มากกว่า 1 ข้อมูลเหมือน Array
  List subViewShow = [
    BmiUI(),
    AboutUI(),
    BmrUI(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // สีพื้นหลังของ Scaffold
      backgroundColor: const Color.fromARGB(255, 253, 248, 255),
      // ส่วนของ AppBar()
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body ว้าว',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar()
      bottomNavigationBar: BottomNavigationBar(        
        onTap: (value) {
          //*** โค้ดอะไรก็ตามที่มีผลต่อการแสดงผลบนหน้าจอ
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heartCircleCheck,
            ),
            label: 'BMR',
          ),
        ],
      ),
      // ส่วนของ body()
      body: subViewShow[_currentIndex],
    );
  }
}