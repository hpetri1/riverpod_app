import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/examples/example_nine.dart/data_async_notifier.dart';

class ExampleNine extends ConsumerWidget {
  const ExampleNine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(dataAsyncProvider);
    final dataNotifier = ref.read(dataAsyncProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Example Nine')),
      body: Center(
        child: dataAsync.when(
          skipLoadingOnRefresh: false,
          data: (d) => Text(d, style: const TextStyle(fontSize: 24)),
          error: (e, _) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('$e', style: const TextStyle(color: Colors.red))],
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dataNotifier.refreshData,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
