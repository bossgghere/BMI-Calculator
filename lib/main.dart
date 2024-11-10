import 'package:bmi/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtCon = TextEditingController();
  var ftCon = TextEditingController();
  var inCon = TextEditingController();

  var res = "";
  var msg = "";
  var bgColor = Colors.white;

  // Separate function for BMI logic
  void calculateBMI() {
    var wt = wtCon.text.trim();
    var ft = ftCon.text.trim();
    var inc = inCon.text.trim();

    if (wt.isEmpty || ft.isEmpty || inc.isEmpty) {
      setState(() {
        res = "Please fill all the required fields!";
      });
      return;
    }

    try {
      // Parse inputs and perform BMI calculation
      var iwt = double.parse(
          wt); // Ensure weight is parsed as double for decimal support
      var ift = int.parse(ft); // Height in feet
      var iinc = int.parse(inc); // Height in inches

      // Convert height to meters
      var totalInches = (ift * 12) + iinc;
      var totalCm = totalInches * 2.54;
      var heightInMeters = totalCm / 100;

      // BMI formula
      var bmi = iwt / (heightInMeters * heightInMeters);

      // Determine BMI category
      if (bmi > 25) {
        msg = "You are\nOVERWEIGHT";
        bgColor = Colors.red.shade100;
      } else if (bmi < 18) {
        msg = "You are\nUNDERWEIGHT";
        bgColor = Colors.yellow.shade100;
      } else {
        msg = "You are\nHEALTHY!";
        bgColor = Colors.green.shade100;
      }

      setState(() {
        res = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
      });
    } catch (e) {
      // Catch any errors, like non-numeric input
      setState(() {
        res = "Invalid input. Please enter valid numbers.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title),
        title: Icon(
          Icons.calculate,
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header text
                  Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Weight input field
                  TextField(
                    controller: wtCon,
                    decoration: InputDecoration(
                      labelText: 'Enter your Weight in kg',
                      prefixIcon: Icon(Icons.line_weight, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),

                  // Height input field (Feet)
                  TextField(
                    controller: ftCon,
                    decoration: InputDecoration(
                      labelText: 'Enter your Height in feet',
                      prefixIcon: Icon(Icons.height, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),

                  // Height input field (Inches)
                  TextField(
                    controller: inCon,
                    decoration: InputDecoration(
                      labelText: 'Enter your Height (in inches)',
                      prefixIcon: Icon(Icons.height, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  // Calculate Button
                  ElevatedButton(
                    onPressed: calculateBMI, // Call the function here
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadowColor: Colors.blue.shade100,
                      elevation: 2,
                    ),
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    res,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
