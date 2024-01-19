import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/home_screen.dart';
import 'package:flutter_state_management/user.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger();

final fetchUserProvider = FutureProvider((ref) async {
  const url = 'https://jsonplaceholder.typicode.com/todos/1';

  final res = await http.get(Uri.parse(url));

  logger.d(res.body);
  return User.fromJson(res.body);
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Riverpod',
      home: HomeScreen(),
    );
  }
}
