import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/user_data.dart';

abstract class UserRepository {
  Future<Result<UserData?>> login(String email, String password);

  Future<Result<UserData?>> register(String name, String email, String phoneNumber, String password);

  Future<Result<void>> logout();
}
