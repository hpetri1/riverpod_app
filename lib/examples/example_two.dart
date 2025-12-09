import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ExampleTwo extends ConsumerWidget {
  const ExampleTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Two')),
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        icon: Icon(Icons.add),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(counterProvider);
            return Text(counter.toString());
          },
        ),
      ),
    );
  }
}

final counterProvider = StateProvider((Ref ref) {
  return 0;
});
