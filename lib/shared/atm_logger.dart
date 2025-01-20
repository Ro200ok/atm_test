import 'dart:developer';

class AtmLogger {
  void captureExeption(e, st) {
    log('$e  <<< exeption', stackTrace: st);
  }
}
