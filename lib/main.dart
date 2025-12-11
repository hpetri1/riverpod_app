import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/examples/example_seven.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: const ExampleSeven())));
}
