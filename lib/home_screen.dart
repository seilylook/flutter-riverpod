import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userNo = '1';

  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserProvider(userNo)).when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) => setState(() {
                userNo = value;
              }),
            ),
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

    // return Scaffold(
    //   body: ref.watch(streamProvider).when(
    //     data: (data) {
    //       return Text(
    //         data.toString(),
    //       );
    //     },
    //     error: (error, st) {
    //       return Center(
    //         child: Text(
    //           error.toString(),
    //         ),
    //       );
    //     },
    //     loading: () {
    //       return const Center(child: CircularProgressIndicator());
    //     },
    //   ),
    // );
  }
}
