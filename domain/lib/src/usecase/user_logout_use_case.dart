import 'package:domain/domain.dart';
import 'package:domain/src/common/result.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserLogoutUseCase implements BaseUseCase {
  final UserRepository _userRepository;

  UserLogoutUseCase(this._userRepository);

  Future<Result<void>> logout() {
    return _userRepository.logout();
  }
}
