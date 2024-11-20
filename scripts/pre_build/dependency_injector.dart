import 'dart:developer';
import 'dart:io';

void main() {
  const dependency = 'google_maps_flutter';
  const version = '^2.9.0';

  final pubspecFile = File('../../pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    log('Error: pubspec.yaml not found in the current directory.');
    exit(1);
  }

  final content = pubspecFile.readAsStringSync();
  final lines = content.split('\n');
  final buffer = StringBuffer();

  bool dependenciesFound = false;
  bool dependencyAdded = false;

  for (int i = 0; i < lines.length; i++) {
    buffer.writeln(lines[i]);
    if (identical(lines[i].trim(), '$dependency: $version')) {
      dependencyAdded = true;
    }
    if (lines[i].trim() == 'dependencies:') {
      dependenciesFound = true;
    } else if (dependenciesFound &&
        lines[i].trim().isEmpty &&
        !dependencyAdded) {
      log(lines[i]);
      buffer.writeln('  $dependency: $version');
      dependencyAdded = true;
    }
  }

  if (!dependenciesFound) {
    log('Error: No dependencies section found in pubspec.yaml!');
    exit(1);
  }

  if (dependencyAdded) {
    log('$dependency added to pubspec.yaml.');
    pubspecFile.writeAsStringSync(buffer.toString());
  } else {
    log('$dependency is already present in pubspec.yaml.');
  }
  log('Dependency added and pubspec resolved successfully!');
}
