import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/examples/example_nine.dart/example_nine.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: const ExampleNine())));
}
