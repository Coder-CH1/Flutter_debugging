import 'package:logger/logger.dart';

final logger = Logger();

void logError(String message) {
  logger.e(message);
}