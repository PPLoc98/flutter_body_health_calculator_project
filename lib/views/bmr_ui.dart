import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
// สร้างตัวแปรเก็บ index ของรายการที่เลือก
  int _SexIndex = 0;

  // สร้างตัวแปรแบบ List คือ ตัวแปร 1 ตัวเก็บได้มากกว่า 1 ข้อมูลเหมือน Array
  //List subSexShow = [
    //M(),
    // F(),
  //];

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
                    const Text(
                      'เพศ',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 8),
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
                                  const Size(50, 60), // ความสูง*กว้างกล่อง
                              // กำหนดสีพื้นหลังและสีตัวอักษรตามเงื่อนไขเมื่อเลือกเพศชายหรือหญิง
                              backgroundColor: _SexIndex == 0
                                  ? const Color(0xFFC4E0F9)
                                  : Colors.white,
                              foregroundColor: _SexIndex == 0
                                  ? const Color(0xFF1A56B8)
                                  : Colors.black87,
                              elevation: 2, // เพิ่มเงา
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // ขอบมน
                              ),
                            ),
                            child: const Text(
                              'ชาย',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20), // ระยะห่างระหว่างปุ่ม
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
                                  const Size(50, 60), // ความสูง*กว้างกล่อง
                              // กำหนดสีพื้นหลังและสีตัวอักษรตามเงื่อนไขเมื่อเลือกเพศชายหรือหญิง
                              backgroundColor: _SexIndex == 1
                                  ? const Color(0xFFC4E0F9)
                                  : Colors.white,
                              foregroundColor: _SexIndex == 1
                                  ? const Color(0xFF1A56B8)
                                  : Colors.black87,
                              elevation: 2, // เพิ่มเงา
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
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
                    const Text(
                      'น้ำหนัก (kg.)',
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
                SizedBox(height: 20),
                // ช่องกรอกอายุ
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'อายุ (ปี)',
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    // เติม const เพื่อลบ warning
                    'คำนวณ BMR',
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
                  child: const Text(
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
                  decoration: const BoxDecoration(
                    color: Color(0xFFCDE4CE), // พื้นหลังสีเขียวอ่อน
                  ),
                  child: const Center(
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
                          '0.00',
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
