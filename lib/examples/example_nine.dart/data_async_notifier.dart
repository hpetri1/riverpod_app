import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/examples/example_five.dart';

final dataAsyncProvider = AsyncNotifierProvider<DataAsyncNotifier, String>(() {
  return DataAsyncNotifier();
}, retry: (retryCount, error) => null);

class DataAsyncNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    return await ref.read(mockApiProvider).fetchData();
  }

  Future<void> refreshData() async {
    try {
      state = const AsyncValue.loading();
      final data = await ref.read(mockApiProvider).fetchData();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }

    /// The code above can be replaced with this SINGLE line
    /// state = await AsyncValue.guard(() => ref.read(mockApiProvider).fetchData());
    /// If using this line, add "skipLoadingOnRefresh: false" in UI or add
    /// state = const AsyncValue.loading(); at the top
  }
}
