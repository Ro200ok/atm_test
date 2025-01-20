import 'package:atm_test/runner_io.dart';

import 'dart:async';
import 'dart:developer' as dev;

void main() {
  runZonedGuarded(
    $initializeApp,
    (e, st) => dev.log('Error occured in main zone', error: e, stackTrace: st),
  );
}
