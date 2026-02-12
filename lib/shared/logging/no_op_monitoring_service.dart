import 'package:atm_test/shared/logging/monitoring_service.dart';

class NoOpMonitoringService implements MonitoringService {
  @override
  void reportError(Object error, [StackTrace? stackTrace]) {}
}
