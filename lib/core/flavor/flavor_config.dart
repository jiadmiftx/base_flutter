import 'package:flutter/material.dart';

enum FlavorType {
  staging,
  prod,
}

class FlavorValues {
  final String titleApp;

  const FlavorValues({
    this.titleApp = "Development App",
  });
}

class FlavorConfig {
  final FlavorType flavor;
  final MaterialColor color;
  final FlavorValues values;
  final String server;
  final String webviewServer;
  final String webApiServer;

  static FlavorConfig? _instance;

  FlavorConfig({
    this.flavor = FlavorType.staging,
    this.color = Colors.orange,
    this.values = const FlavorValues(),
    this.server = '',
    this.webApiServer = '',
    this.webviewServer = '',
  }) {
    _instance = this;
  }

  static FlavorConfig get instance => _instance ?? FlavorConfig();
}
