import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(home: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: ElevatedButton(onPressed: (){}, child: Text("data"))
      ),
    );
  }
}

