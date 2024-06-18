import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/helpers/extension.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/features/home/widgets/class_screen.dart';
import 'package:omr/features/home/widgets/exam_widget.dart';
import 'package:omr/features/add_exam/ui/add_exam_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const List<Widget> _widgetOptions = <Widget>[
    ExamWidget(),
    ClassScreen(),
    AddExamScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(backgroundColor: Colors.white),
      appBar: AppBar(
        title: Text(
          'Exams',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.7,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(Routes.addExamScreen);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    weight: 2,
                    color: Color(0xFF245BBC),
                  ),
                  Text(
                    'Add New',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF245BBC),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: HomeScreen._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            label: 'Exams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_sharp),
            label: 'Reports',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[700],
        iconSize: 22.sp,
        selectedLabelStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
