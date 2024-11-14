import 'dart:io';
import 'package:objectdb/objectdb.dart';

final path = '${Directory.current.path}/my.db';

// create database instance and open
final db = ObjectDB(FileSystemStorage(path));

class FileSystemStorage {
  FileSystemStorage(String path);
}
