import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_helper.g.dart';

@Riverpod(keepAlive: true)
class NetworkStatus extends _$NetworkStatus {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  bool build() {
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      final hasConnection = results.any((r) => r != ConnectivityResult.none);
      state = hasConnection;
    });

    _initialize();
    return true; // Assume online initially
  }

  Future<void> _initialize() async {
    final results = await Connectivity().checkConnectivity();
    final hasConnection = results.any((r) => r != ConnectivityResult.none);
    state = hasConnection;
  }
}
