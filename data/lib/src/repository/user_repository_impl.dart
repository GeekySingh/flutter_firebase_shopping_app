import 'package:data/src/data/firebase/firebase_auth_service.dart';
import 'package:data/src/data/mapper/user_mapper.dart';
import 'package:data/src/data/storage/local_storage_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final FirebaseAuthService _authService;
  final LocalStorageService _storageService;

  UserRepositoryImpl(this._authService, this._storageService);

  @override
  Future<Result<UserData?>> login(String email, String password) async {
    final result = await _authService.login(email, password);
    if (result.isLeft) {
      final userData = result.left?.toUserData();
      _storageService.saveUserData(userData);
      return Success(userData);
    } else
      return Error(result.right);
  }

  @override
  Future<Result<UserData?>> register(String name, String email, String phoneNumber, String password) async {
    final result = await _authService.register(email, password);
    if (result.isLeft) {
      final userData = result.left?.toUserData();
      userData?.name = name;
      userData?.number = phoneNumber;
      _storageService.saveUserData(userData);
      return Success(userData);
    } else
      return Error(result.right);
  }

  @override
  Future<Result<void>> logout() async {
    final logout = await _authService.logout();
    if (logout)
      return Success(null);
    else
      return Error('');
  }
}
