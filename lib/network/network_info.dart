import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity connectivity;

  const NetworkInfo({required this.connectivity});

  Future<ConnectivityResult> get isConnected =>
      connectivity.checkConnectivity();
}
