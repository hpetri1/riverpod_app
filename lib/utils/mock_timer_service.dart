import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = Provider((_) => MockTimerService());

class MockTimerService {
  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (count) => count);
  }

  Stream<int> tickWithErrors() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }

    throw Exception('Timer stopped unexpectadly');
  }
}
