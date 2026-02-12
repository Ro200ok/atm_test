import 'dart:developer' as dev;

import 'package:atm_test/shared/logging/app_logger.dart';
import 'package:atm_test/shared/logging/monitoring_service.dart';
import 'package:flutter/foundation.dart';

/// Log level.
enum LogLevel {
  info(1),
  warning(2),
  error(3);

  const LogLevel(this.value);
  final int value;
}

class AppLoggerImpl implements AppLoggerItf {
  AppLoggerImpl(
    this._monitoringService, {
    LogLevel minimumLevel = LogLevel.info,
    bool enableInfoInRelease = false,
  })  : _minimumLevel = minimumLevel,
        _enableInfoInRelease = enableInfoInRelease;

  final MonitoringService _monitoringService;
  final LogLevel _minimumLevel;
  final bool _enableInfoInRelease;

  bool _shouldLog(LogLevel level) {
    if (level.value < _minimumLevel.value) return false;
    if (kReleaseMode && level == LogLevel.info && !_enableInfoInRelease) {
      return false;
    }
    return true;
  }

  @override
  void info(String message) {
    if (!_shouldLog(LogLevel.info)) return;
    dev.log(message, name: 'INFO');
  }

  @override
  void warning(String message) {
    if (!_shouldLog(LogLevel.warning)) return;
    dev.log(message, name: 'WARNING');
  }

  @override
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!_shouldLog(LogLevel.error)) return;
    dev.log(message, name: 'ERROR', error: error, stackTrace: stackTrace);

    if (error != null) {
      try {
        _monitoringService.reportError(error, stackTrace);
      } on Object catch (_) {
        dev.log('MonitoringService.reportError failed', name: 'Logger');
      }
    }
  }
}
