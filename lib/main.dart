import 'package:flutter/material.dart';
import 'package:networking/ui/home.dart';
import 'package:logging/logging.dart';

main() {
  runApp(MyApp());
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name} ${event.message}');
  });
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
