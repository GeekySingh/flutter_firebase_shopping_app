import 'package:domain/domain.dart';
import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/user_data.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserLoginUseCase implements BaseUseCase {
  final UserRepository _userRepository;

  UserLoginUseCase(this._userRepository);

  Future<Result<UserData?>> login(String email, String password) {
    return _userRepository.login(email, password);
  }
}
