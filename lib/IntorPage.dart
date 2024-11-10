import 'package:bmi/main.dart';
import 'package:flutter/material.dart';

class Intorpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        // title: const Text('INDEX' , style: TextStyle(
        //   color: Colors.lightBlue,
        //   fontSize: 50,
        //   fontWeight: FontWeight.bold
        // ),),
      ),
      body: Container(
        // color: Colors.red,
        child: Center(
          child: Column(
            
            children: [
              const Text(
                'Welcome All',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: 'Title')),
                  );
                },
                child: const Text('CALCULATOR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
