import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Test Date Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatePickerController _controller = DatePickerController();

  DateTime _currentValue = DateTime.now();

  final DateTime _datePickerStartValue = DateTime(2022, 7, 1);

  String _selectedValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Current Time:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                _currentValue.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: size.height * 0.1),
              const Text(
                "Selected Time:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  _selectedValue,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: size.height * 0.1),
              DatePicker(
                _datePickerStartValue,
                width: 70,
                height: 85,
                controller: _controller,
                selectionColor: Colors.purple,
                selectedTextColor: Colors.white,
                monthTextStyle: const TextStyle(color: Colors.red),
                dateTextStyle: const TextStyle(color: Colors.green),
                dayTextStyle: const TextStyle(color: Colors.blue),
                onDateChange: (date) {
                  String formattedTime = DateFormat.Hm().format(DateTime.now());
                  String formattedDate = DateFormat.yMMMMd().format(date);
                  setState(() {
                    _selectedValue = "$formattedDate  $formattedTime";
                    _currentValue = DateTime.now();
                  });
                },
              ),
            ],
          ),
        ));
  }
}
