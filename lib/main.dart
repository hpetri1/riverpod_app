import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/examples/example_one.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: const ExampleOne())));
}
