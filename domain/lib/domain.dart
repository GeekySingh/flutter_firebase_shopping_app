library domain;

import 'package:domain/src/di/locator.dart';

export 'src/common/error_type.dart';
export 'src/common/result.dart';
export 'src/model/article_model.dart';
export 'src/model/user_data.dart';
export 'src/repository/user_repository.dart';
export 'src/usecase/user_login_use_case.dart';
export 'src/usecase/user_logout_use_case.dart';
export 'src/usecase/user_registration_use_case.dart';

class Domain {
  static void init() {
    /// setup required locators for domain module
    setupLocator();
  }
}
