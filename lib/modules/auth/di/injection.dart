import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';
import '../data/datasource/local/auth_local_datasource.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/auth_repository.dart';
import '../presentation/provider/auth_notifier.dart';

// * local data source
final _localAuthDataSource = Provider<AuthLocalDataSource>((ref) =>
    AuthLocalDataSourceImpl(secureStorage: ref.watch(sharedPrefsProvider)));
final _authLocalDataSource = Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl(secureStorage: ref.watch(sharedPrefsProvider)));
// // * local data source

// * remote data source
// final _loginRemoteDataSource = Provider<LoginRemoteDataSource>((ref) =>
//     LoginRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// final _sendOtpRemoteDataSource = Provider<SendOtpRemoteDataSource>((ref) => SendOtpRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// final _registerRemoteDaraSource = Provider<RegisterRemoteDataSource>((ref) => RegisterRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// * remote data source

// *  Repo implementation
final authRepositoryProvider = Provider<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        localDataSource: ref.watch(_localAuthDataSource),
        networkInfo: ref.watch(networkInfoProvider)));
// //
// // final loginRepositoryProvider = Provider<LoginRepository>((ref) =>
// //     LoginRepositoryImpl(
// //         remoteDataSource: ref.watch(_loginRemoteDataSource),
// //         networkInfo: ref.watch(networkInfoProvider),
// //         localDataSource: ref.watch(_authLocalDataSource)));
// // final sendOtpRepositoryProvider = Provider<SendOtpRepository>((ref) =>
// //     SendOtpRepositoryImpl(
// //         remoteDataSource: ref.watch(_sendOtpRemoteDataSource),
// //         networkInfo: ref.watch(networkInfoProvider),
// //     ));
// // final registerRepositoryProvider = Provider<RegisterRepository>((ref) =>
// //     RegisterRepositoryImpl(
// //         remoteDataSource: ref.watch(_registerRemoteDaraSource),
// //         networkInfo: ref.watch(networkInfoProvider),
// //     ));
// // * Repo implementation
//
// // * auth providers

final authProvider = Provider((ref) => AuthNotifier(ref.watch(authRepositoryProvider)));
final authProviderStateNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => ref.watch(authProvider));
