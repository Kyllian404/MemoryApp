import 'package:path_provider/path_provider.dart';
import 'package:memoryapp/src/infrastructure/local_db/i_local_db.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class MySembast implements ILocalDb {
  MySembast(this.db);
  final Database db;
  final store = StoreRef.main();

  static Future<Database> _openDb() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase('${appDocDir.path}/memoryapp.db');
  }

  static Future<MySembast> initDb() async {
    return MySembast(await _openDb());
  }

  @override
  Future getData(String key) async {
    return await store.record(key).get(db);
  }

  @override
  Future<void> setData(String key, data) {
    return store.record(key).put(db, data);
  }

  @override
  Stream watchData(String key) {
    return store.record(key).onSnapshot(db);
  }
}