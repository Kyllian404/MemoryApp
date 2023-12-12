import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i_local_db.g.dart';

abstract class ILocalDb  {
  Future<dynamic> getData(String key);
  Future<void> setData(String key, Object data);
  Stream<dynamic> watchData(String key);
}

@Riverpod(keepAlive: true)
ILocalDb localDb (LocalDbRef ref) {
  //* Override this in the main method
  throw UnimplementedError();
}