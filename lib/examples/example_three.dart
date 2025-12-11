import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ExampleThree extends ConsumerStatefulWidget {
  const ExampleThree({super.key});

  @override
  ConsumerState<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends ConsumerState<ExampleThree> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(textProvider.notifier).state = _controller.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Three')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(controller: _controller),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final text = ref.watch(textProvider);
                return Text('You typed: $text');
              },
            ),
          ],
        ),
      ),
    );
  }
}

final textProvider = StateProvider((Ref ref) {
  return '';
});
