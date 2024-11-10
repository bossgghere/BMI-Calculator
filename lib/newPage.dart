import 'package:flutter/material.dart';

class Newpage extends StatelessWidget {
  var nameFromHome;

  Newpage(this.nameFromHome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data $nameFromHome'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context); // This pops the current screen and returns to the previous one
                },
                child: Text('Back'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
