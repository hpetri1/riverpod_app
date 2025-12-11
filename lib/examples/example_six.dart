import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/utils/mock_timer_service.dart';

final tickerProvider = StreamProvider((Ref ref) {
  final service = ref.read(timerProvider);
  return service.tickWithErrors();
}, retry: (retryCount, error) => null);

class ExampleSix extends ConsumerWidget {
  const ExampleSix({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker = ref.watch(tickerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Example Six')),
      body: Center(
        child: ticker.when(
          skipLoadingOnRefresh: false,
          data: (count) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seconds elapsed:'),
              Text(
                '$count',
                style: TextStyle(fontSize: 32, color: Colors.amber[800]),
              ),
            ],
          ),
          error: (e, _) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$e', style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.refresh(tickerProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
