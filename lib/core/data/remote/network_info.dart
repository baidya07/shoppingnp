import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Author:    Bibek Baidya
/// Created:   1.08.2022
/// Description:
/// (c) Copyright by shoppingnp.com
///*/



//flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker dataConnectionChecker;

  NetworkInfoImpl(
      {required this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
