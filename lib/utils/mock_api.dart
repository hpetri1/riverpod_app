import 'dart:math';

class MockApi {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    // Simulate a 30% chance of failure
    final number = Random().nextDouble();
    if (number < 0.3) {
      throw Exception('Failed to fetch data');
    }
    return 'Data returned';
  }
}
