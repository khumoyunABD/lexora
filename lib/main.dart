import 'package:flutter/material.dart';
import 'package:lexora/core/di/di.dart';
import 'package:lexora/lexora_app.dart';

void main() {
  setupDependencies();
  runApp(const LexoraApp());
}
