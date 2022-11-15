import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_interface/Screens/student.dart';
import 'package:fyp_interface/Screens/student_login.dart';
import 'package:fyp_interface/Screens/teacher.dart';
import 'package:fyp_interface/Screens/teacher_login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FAST Attendence System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Select Your Designation',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times new Roman',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 90),
          Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      //side: const BorderSide(width: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StreamBuilder(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return const StudentScreen();
                            } else {
                              return const StudentLogin();
                            }
                          })))),
                  child: const Text(
                    "Student Login",
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      //side: const BorderSide(width: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StreamBuilder(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return const TeacherScreen();
                            } else {
                              return const TeacherLogin();
                            }
                          })))),
                  child: const Text(
                    "Teacher Login",
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
