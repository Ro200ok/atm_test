abstract class AppLoggerItf {
  void info(String message);
  void warning(String message);
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });
}
