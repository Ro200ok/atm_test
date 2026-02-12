import 'dart:async';

import 'package:atm_test/runner_io.dart';
import 'package:atm_test/shared/logging/app_logger.dart';

void main() {
  registerCoreDependencies();

  runZonedGuarded(
    $initializeApp,
    (Object error, StackTrace stackTrace) {
      injector<AppLoggerItf>().error(
        'Unhandled zone error',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
