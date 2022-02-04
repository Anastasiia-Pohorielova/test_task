import 'package:flutter/material.dart';

/// Class for storing all shadows in the app
class AppShadows {
  /// Shadow for pointer
  static List<BoxShadow> pointerShadow() {
    return [
      const BoxShadow(
        color: Colors.white,
        blurRadius: 10.0,
        offset: Offset.zero,
      ),
    ];
  }
}