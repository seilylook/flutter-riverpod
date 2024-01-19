import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // notifier가 상태 값을 변경하도록 도와준다.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Text(data.userId.toString()),
            ),
            Center(
              child: Text(data.id.toString()),
            ),
            Center(
              child: Text(data.title),
            ),
            Center(
                child: Checkbox(
              onChanged: (value) => null,
              value: data.completed,
            ))
          ],
        ),
      );
    }, error: (error, st) {
      return Center(
        child: Text(
          error.toString(),
        ),
      );
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
