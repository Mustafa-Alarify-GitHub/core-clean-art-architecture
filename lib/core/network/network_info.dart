import 'package:connectivity_plus/connectivity_plus.dart';

/// Check Internet is connected
class ConnectivityService {
  final _connectivity = Connectivity();

  Stream<List<ConnectivityResult>> get onChange =>
      _connectivity.onConnectivityChanged;

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
