import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'addproduct.dart';
import 'showproductgrid.dart';
import 'showproducttype.dart';

//Method หลักทีRun
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC3Vdjqzs5NLTNggpk99M6OkcQ66BPxEkw",
            authDomain: "onlinefirebase-6773c.firebaseapp.com",
            databaseURL:
                "https://onlinefirebase-6773c-default-rtdb.firebaseio.com",
            projectId: "onlinefirebase-6773c",
            storageBucket: "onlinefirebase-6773c.firebasestorage.app",
            messagingSenderId: "25620085588",
            appId: "1:25620085588:web:3834e2a9796657d75526c1",
            measurementId: "G-5V0252CCTJ"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

//Class stateless สั่งแสดงผลหนาจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 34, 48, 243)),
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}

//Class stateful เรียกใช้การทํางานแบบโต้ตอบ
class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Main> {
//ส่วนเขียน Code ภาษา dart เพื่อรับค่าจากหน้าจอมาคํานวณหรือมาทําบางอย่างและส่งค่ากลับไป
//ส่วนการออกแบบหน้าจอ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังเป็นภาพ
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/Image bg2.png'), // ใส่ชื่อไฟล์ภาพพื้นหลัง
                fit: BoxFit.cover,
              ),
            ),
          ),
          // เนื้อหาหลัก
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    height: 300,
                    child: Image.asset('assets/Image logo3.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addproduct(),
                          ),
                        );
                      },
                      child: Text('บันทึกข้อมูลสินค้า'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => showproductgrid(),
                          ),
                        );
                      },
                      child: Text('แสดงข้อมูลสินค้า'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => showproducttype(),
                          ),
                        );
                      },
                      child: Text('ประเภทสินค้า'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
