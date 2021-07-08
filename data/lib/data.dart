library data;

import 'package:data/src/di/locator.dart';

export 'src/common/constants.dart';

class Data {
  static void init() {
    /// setup required locators for data module
    setupLocator();
  }
}
