import 'package:core/common/status.dart';
import 'package:stacked/stacked.dart';

abstract class CoreViewModel extends BaseViewModel {
  late Status _status;

  Status get status => _status;

  void loading() {
    _status = Status.LOADING;
    setBusy(true);
  }

  void loaded(bool success) {
    _status = success ? Status.SUCCESS : Status.ERROR;
    setBusy(false);
    setError(success ? null : true);
  }
}
