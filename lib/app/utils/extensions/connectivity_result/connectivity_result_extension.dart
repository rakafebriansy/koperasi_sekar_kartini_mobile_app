import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityResultExtension on List<ConnectivityResult> {
  bool get isOffline => contains(ConnectivityResult.none);

  bool get isOnline => ConnectivityResult.values.where((element) => element != ConnectivityResult.none).any(contains);
}
