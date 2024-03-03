import 'dart:io';

({bool status, double size}) getFileSizeFromPath(File file, int maxSize) {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);
  if (sizeInMb > maxSize) {
    // This file is Longer than 50 mb
    return (status: false, size: sizeInMb);
  }
  return (status: true, size: sizeInMb);
}
