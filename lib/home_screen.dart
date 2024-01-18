import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // notifier가 상태 값을 변경하도록 도와준다.
  void onChangeName(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onChangeAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onChangeName(ref, value);
            },
          ),
          TextField(
            onSubmitted: (value) {
              onChangeAge(ref, value);
            },
          ),
          Column(
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.age.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
