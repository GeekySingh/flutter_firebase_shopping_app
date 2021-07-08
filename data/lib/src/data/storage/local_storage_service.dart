

import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const USER_DATA = 'user_data';

@Injectable()
class LocalStorageService {

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> saveUserData(UserData? userData) async {
    await _secureStorage.write(key: USER_DATA, value: userData?.toMap().toString());
  }

  Future<void> clear(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}