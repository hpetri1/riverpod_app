import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleFour extends ConsumerStatefulWidget {
  const ExampleFour({super.key});

  @override
  ConsumerState<ExampleFour> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends ConsumerState<ExampleFour>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    final duration = ref.read(durationProvider);
    _animationController = AnimationController(vsync: this, duration: duration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Four')),
      body: Center(
        child: ScaleTransition(
          scale: _animationController.drive(Tween(begin: 0.5, end: 1.5)),
          child: const Icon(Icons.circle, size: 80, color: Colors.blue),
        ),
      ),
    );
  }
}

final durationProvider = Provider((_) => const Duration(seconds: 2));
