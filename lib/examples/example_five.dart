import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/utils/mock_api.dart';

final mockApiProvider = Provider((_) => MockApi());

final dataFutureProvider = FutureProvider((Ref ref) async {
  final service = ref.read(mockApiProvider);
  return await service.fetchData();
}, retry: (retryCount, error) => null);

class ExampleFive extends ConsumerWidget {
  const ExampleFive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(dataFutureProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Example Five')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            result.when(
              skipLoadingOnRefresh: false,
              loading: () => CircularProgressIndicator(),
              error: (error, stackTrace) => Text(
                'Failed to fetch data',
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              data: (data) => Text(data, style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => ref.refresh(dataFutureProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
