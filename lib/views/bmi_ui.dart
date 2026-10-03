import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // เพิ่ม import สำหรับ FilteringTextInputFormatter

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {

  // สร้างตัวควบคุมสำหรับ TextField เพื่อเช็คผู้ใช้กรอกข้อมูลหรือไม่
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  // ฟังก์ชันคำนวณ BMI และแปลผลลัพธ์
  String Show_bmi = '0.00';
  String Show_result = 'การแปลผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 248, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางหน้าจอในแนวตั้ง
            children: [
              // ชื่อหัวข้อแอพ
              Text(
                'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.026,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // รูปภาพ BMI
              Image.asset(
                'assets/images/bmi.png',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              // ช่องกรอกน้ำหนัก
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: weightController, // เชื่อมต่อ TextField กับตัวควบคุม
                    keyboardType: TextInputType.number, // เปิดคีย์บอร์ดตัวเลข
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // บังคับให้พิมพ์ได้เฉพาะตัวเลข 0-9 เท่านั้น
                    ],
                    decoration: const InputDecoration(
                      hintText: 'กรอกน้ำหนักของคุณ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // ช่องกรอกส่วนสูง
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: heightController, // เชื่อมต่อ TextField กับตัวควบคุม
                    keyboardType: TextInputType.number, // เปิดคีย์บอร์ดตัวเลข
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // บังคับให้พิมพ์ได้เฉพาะตัวเลข 0-9 เท่านั้น
                    ],
                    decoration: InputDecoration(
                      hintText: 'กรอกส่วนสูงของคุณ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // ปุ่มคำนวณ BMI
              ElevatedButton(
                onPressed: () {
                  // validate input ตรวจสอบว่าผู้ใช้กรอกข้อมูลหรือไม่
                  if (weightController.text.isEmpty || heightController.text.isEmpty == true) {
                    //ใช้ SnackBar แสดงข้อความแจ้งเตือน
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('กรุณากรอกและน้ำหนักและส่วนสูง!'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ));
                    return; // ออกจากฟังก์ชันหากข้อมูลไม่ครบ
                  }
                  // ดึงค่าที่ผู้ใช้กรอกมาและแปลงเป็น double
                  double weight = double.parse(weightController.text);
                  double height = double.parse(heightController.text);
                  double bmi = weight / ((height / 100) * (height / 100)); // แปลงส่วนสูงจาก cm เป็น m
                 // นำค่า BMI ไปแสดงผลลัพธ์ //***โค้ดคำสั่งที่มีผลต่อการแสดงผลต้องเขียนอยู่ภายใต้คำสั่ง setState()***/
                  setState(() {
                    // นำตัวแปร bmi ไปกำหนดค่าให้ Show_bmi ต้องทำเป็น String ใช้คำสั่ง toString กำหนดทศนิยมใช้ AsFixed() ก่อนถึงจะแสดงผลลัพธ์ได้
                    Show_bmi = bmi.toStringAsFixed(2); // แสดงผลลัพธ์ BMI 2 ตำแหน่งทศนิยม
                    if (bmi < 18.5) {
                      Show_result = 'น้ำหนักน้อย / ผอม';
                    } else if (bmi < 22.9) {
                      Show_result = 'น้ำหนักปกติ / สมส่วน';
                    } else if (bmi < 24.9) {
                      Show_result = 'น้ำหนักเกิน';
                    } else if (bmi < 29.9) {
                      Show_result = 'โรคอ้วนระดับ 1';
                    } else {
                      Show_result = 'โรคอ้วนระดับ 2';
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 60),
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'คำนวณ BMI',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: 15),
              // ปุ่มรีเซ็ต
              ElevatedButton(
                onPressed: () {
                  // ล้างค่าที่ผู้ใช้กรอกและรีเซ็ตผลลัพธ์
                  setState(() {
                    weightController.clear();
                    heightController.clear();
                    Show_bmi = '0.00';
                    Show_result = 'การแปลผล';
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 60),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'ล้างข้อมูล',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              //กรอบแสดงผลลัพธ์ BMI
              Container(
                width: MediaQuery.of(context).size.width,
                height:
                    150, // เพิ่มความสูงเพื่อให้มีพื้นที่พอสำหรับข้อความ 3 บรรทัด
                decoration: BoxDecoration(
                  color: Color(0xFFCDE4CE), // พื้นหลังสีเขียวอ่อน
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวตั้ง
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        Show_bmi, // แสดงค่าดัชนีมวลกาย
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5252), // สีแดงอมส้มสำหรับตัวเลข
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        Show_result, // แสดงผลลัพธ์การแปลผล
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
