import 'package:flutter/material.dart';

import 'my_app.dart' deferred as app;

void main() {
  runApp(FutureBuilder(
      future: app.loadLibrary(),
      builder: (c, _) {
        if (_.connectionState == ConnectionState.done) {
          return app.MyApp();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }));
}
