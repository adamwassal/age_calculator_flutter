import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int day = 1;
  int month = 1;
  int year = 2000;

  int myday = 0;
  int mymonth = 0;
  int myyear = 0;

  DateTime now = DateTime.now();

  List<int> months = [31, 28, 31, 30, 31, 30, 31, 30, 31];

  int now_day = DateTime.now().day;
  int now_month = DateTime.now().month;
  int now_year = DateTime.now().year;

  int calculated_hour = 0;
  int calculated_minute = 0;
  int calculated_second = 0;

  calculateAge() {
    if (day > now_day) {
      now_month = now_month - 1;
      now_day = now_day + months[month - 1];
    }
    if (month > now_month) {
      now_year = now_year - 1;
      now_month = now_month + 12;
    }

    myyear = now_year - year;
    mymonth = now_month - month;
    myday = now_day - day;
    calculated_hour = myyear * 12 * 30 * 24;
    calculated_minute = myyear * 12 * 30 * 24 * 60;
    calculated_second = myyear * 12 * 30 * 24 * 60 * 60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDA0063),
      appBar: AppBar(
        backgroundColor: Color(0xffDA0063),
        title: Text(
          'Calculator Age',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Column(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 400,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: DateTime(year, month, day),
                                  maximumYear: now.year,
                                  minimumYear: now_year - 70,
                                  onDateTimeChanged: (DateTime newDateTime) {
                                    setState(() {
                                      day = newDateTime.day;
                                      month = newDateTime.month;
                                      year = newDateTime.year;
                                    });

                                    print(day);
                                    print(month);
                                    print(year);
                                    if (day < 0 || month < 0 || year < 0) {
                                      day = 0;
                                      month = 0;
                                      year = 0;
                                    } else {
                                      calculateAge();
                                    }
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Calculate',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ));
              },
              child: Text('Enter your birthday'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Years',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '  $myyear',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Months',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '$mymonth',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          ' Days',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '     $myday',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '    Hours',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '     $calculated_hour',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '      Minutes',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '     $calculated_minute',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '       Seconds',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '     $calculated_second',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
