import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
// สร้างตัวแปรเก็บ index ของรายการที่เลือกเพศ โดยเริ่มต้นเป็น 0 (ชาย)
  int _SexIndex = 0;

  // สร้างตัวแปรสำหรับ TextField เพื่อเช็คผู้ใช้กรอกข้อมูลหรือไม่
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // ฟังก์ชันคำนวณ BMR 
  String Show_bmr = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 248, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางหน้าจอในแนวตั้ง
              children: [
                SizedBox(
                  height: 30,
                ),
                // ชื่อหัวข้อแอพ
                Text(
                  'คำนวณหาอัตราการเผาผลาญที่',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // รูปภาพ BMR
                Image.asset(
                  'assets/images/bmr.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                // เลือกเพศ
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'เพศ',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    // ใช้ Row เพื่อวางปุ่มชายและหญิงในแนวนอน
                    Row(
                      children: [
                        // ปุ่มชาย (ใช้ ElevatedButton)
                        Expanded(
                          //ปุ่มชาย (ใช้ ElevatedButton)
                          child: ElevatedButton(
                            // ใส่คำสั่งเมื่อกดปุ่มชาย
                            onPressed: () {
                              setState(() {
                                _SexIndex = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(50, 60), // ความสูง*กว้างกล่อง
                              // กำหนดสีพื้นหลังและสีตัวอักษรตามเงื่อนไขเมื่อเลือกเพศชายหรือหญิง
                              backgroundColor: _SexIndex == 0
                                  ? Color(0xFFC4E0F9)
                                  : Colors.white,
                              foregroundColor: _SexIndex == 0
                                  ? Color(0xFF1A56B8)
                                  : Colors.black87,
                              elevation: 2, // เพิ่มเงา
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // ขอบมน
                              ),
                            ),
                            child: Text(
                              'ชาย',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20), // ระยะห่างระหว่างปุ่ม
                        // ปุ่มหญิง (ใช้ ElevatedButton)
                        Expanded(
                          child: ElevatedButton(
                            // ใส่คำสั่งเมื่อกดปุ่มหญิง
                            onPressed: () {
                              setState(() {
                                _SexIndex = 1;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(50, 60), // ความสูง*กว้างกล่อง
                              // กำหนดสีพื้นหลังและสีตัวอักษรตามเงื่อนไขเมื่อเลือกเพศชายหรือหญิง
                              backgroundColor: _SexIndex == 1
                                  ? Color(0xFFC4E0F9)
                                  : Colors.white,
                              foregroundColor: _SexIndex == 1
                                  ? Color(0xFF1A56B8)
                                  : Colors.black87,
                              elevation: 2, // เพิ่มเงา
                              padding: EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'หญิง',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // ช่องกรอกน้ำหนัก
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'น้ำหนัก (kg.)',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: weightController, // TextField > weightController น้ำหนัก
                      keyboardType: TextInputType.number, // เปิดคีย์บอร์ดตัวเลข
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // บังคับให้พิมพ์ได้เฉพาะตัวเลข 0-9 เท่านั้น
                      ],
                      decoration: InputDecoration(
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
                      controller: heightController, // TextField > heightController ส่วนสูง
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
                SizedBox(height: 20),
                // ช่องกรอกอายุ
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'อายุ (ปี)',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: ageController, // TextField > ageController อายุ
                      keyboardType: TextInputType.number, // เปิดคีย์บอร์ดตัวเลข
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // บังคับให้พิมพ์ได้เฉพาะตัวเลข 0-9 เท่านั้น
                      ],
                      decoration: InputDecoration(
                        hintText: 'กรอกอายุของคุณ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // ปุ่มคำนวณ BMR
                ElevatedButton(
                  onPressed: () {
                    // validate input ตรวจสอบว่าผู้ใช้กรอกข้อมูลหรือไม่
                    if (weightController.text.isEmpty || heightController.text.isEmpty ||
                        ageController.text.isEmpty) {
                      //ใช้ SnackBar แสดงข้อความแจ้งเตือน
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('กรุณากรอกน้ำหนัก ส่วนสูง และอายุ!'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ));
                      return; // ออกจากฟังก์ชัน
                    } else {
                      // ดึงค่าที่ผู้ใช้ใน TextField มาแปลงเป็น double
                      double weight = double.parse(weightController.text);
                      double height = double.parse(heightController.text);
                      int age = int.parse(ageController.text);

                      // คำนวณ BMR ตามสูตรของ Harris-Benedict
                      double bmr;
                      if (_SexIndex == 0) {
                        // สำหรับเพศชาย
                        bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
                      } else {
                        // สำหรับเพศหญิง
                        bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
                      }
                        // แสดงผลลัพธ์ BMR โดยใช้ setState เพื่ออัปเดต UI
                      setState(() {
                        Show_bmr = bmr.toStringAsFixed(2); // แสดงผลลัพธ์ BMR
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    // เติม const เพื่อลบ warning
                    'คำนวณ BMR',
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
                      ageController.clear();
                      Show_bmr = '0.00';
                      _SexIndex = 0;
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
                    // เติม const เพื่อลบ warning
                    'ล้างข้อมูล',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(height: 30),
                //กรอบแสดงผลลัพธ์ BMR
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
                          'BMR',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          Show_bmr, // แสดงผลลัพธ์ BMR
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF5252), // สีแดงอมส้มสำหรับตัวเลข
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kcal/day',
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
      ),
    );
  }
}
