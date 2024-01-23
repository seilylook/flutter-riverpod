import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/home_screen.dart';
import 'package:flutter_state_management/user.dart';
import 'package:logger/logger.dart';

var logger = Logger();

final fetchUserProvider =
    FutureProvider.family.autoDispose((ref, String index) {
  final userRepository = ref.watch(userRepositryProvider);
  return userRepository.fetchUserData(index);
});

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
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
      home: MyHomePage(),
    );
  }
}
