import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // เพิ่ม import สำหรับ FilteringTextInputFormatter

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
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
              SizedBox(height: 20,),
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
                  const Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    keyboardType: TextInputType.number, // เปิดคีย์บอร์ดตัวเลข
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // บังคับให้พิมพ์ได้เฉพาะตัวเลข 0-9 เท่านั้น
                    ],
                    decoration: const InputDecoration(
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
                onPressed: () {},
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
                onPressed: () {},
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
                decoration: const BoxDecoration(
                  color: Color(0xFFCDE4CE), // พื้นหลังสีเขียวอ่อน
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวตั้ง
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontSize: 14, color: Colors.black,
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '0.00',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5252), // สีแดงอมส้มสำหรับตัวเลข
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'การแปลผล',
                        style: TextStyle(
                          fontSize: 14, color: Colors.black,
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
