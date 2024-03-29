import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DialogService {
  final StackRouter _router;

  DialogService(this._router);

  BuildContext _getSafeContext() {
    final context = _router.navigatorKey.currentContext;
    return context != null
        ? context
        : throw ('Have you forgot to setup routes?');
  }

  Future<OkCancelResult> error(
      {required String title, required String message}) {
    return showOkAlertDialog(
        context: _getSafeContext(), title: title, message: message);
  }

  Future<OkCancelResult> ask(
      {required String title,
      required String message,
      required String positiveButton,
      required String negativeButton}) {
    return showOkCancelAlertDialog(
        context: _getSafeContext(),
        title: title,
        message: message,
        okLabel: positiveButton,
        cancelLabel: negativeButton);
  }

  void showLoader() async {
    return showDialog(
        context: _getSafeContext(),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: Container(
                child: SpinKitFoldingCube(
                  color: Theme.of(_getSafeContext()).accentColor,
                ),
              ));
        });
  }
}
