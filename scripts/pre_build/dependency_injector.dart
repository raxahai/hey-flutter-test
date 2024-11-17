import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {
  const dependency = 'google_maps_flutter';
  const version = '^2.9.0';

  final pubspecFile = File('../../pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    debugPrint('Error: pubspec.yaml not found in the current directory.');
    exit(1);
  }

  final content = pubspecFile.readAsStringSync();
  final lines = content.split('\n');
  final buffer = StringBuffer();

  bool dependenciesFound = false;
  bool dependencyAdded = false;

  for (var line in lines) {
    buffer.writeln(line);
    if (line.trim() == 'dependencies:') {
      dependenciesFound = true;
    } else if (dependenciesFound && line.trim().isEmpty && !dependencyAdded) {
      buffer.writeln('  $dependency: $version');
      dependencyAdded = true;
    }
  }

  if (!dependenciesFound) {
    debugPrint('Error: No dependencies section found in pubspec.yaml!');
    exit(1);
  }

  if (dependencyAdded) {
    debugPrint('$dependency added to pubspec.yaml.');
    pubspecFile.writeAsStringSync(buffer.toString());
  } else {
    debugPrint('$dependency is already present in pubspec.yaml.');
  }

  // Run flutter pub get
  debugPrint('Running flutter pub get...');
  var result = Process.runSync('flutter', ['pub', 'get']);
  debugPrint(result.stdout);
  if (result.exitCode != 0) {
    debugPrint('Error running flutter pub get: ${result.stderr}');
    exit(1);
  }

  final packagesResult = Process.runSync('flutter', ['packages', 'get']);
  debugPrint(packagesResult.stdout);
  if (packagesResult.exitCode != 0) {
    debugPrint('Error running flutter pub get: ${result.stderr}');
    exit(1);
  }
  debugPrint('Dependency added and pubspec resolved successfully!');
}
