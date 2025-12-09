import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staticStringProvider = Provider((Ref ref) {
  return 'Hello World!';
});

class ExampleOne extends ConsumerWidget {
  const ExampleOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(staticStringProvider);
    return Scaffold(body: Center(child: Text(result)));
  }
}
