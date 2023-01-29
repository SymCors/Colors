import 'dart:ui';

import 'package:flutter/material.dart';

/// [CustomScrollBehavior] is a [ScrollBehavior] that allows the scroll bar to
/// be dragged on touch screens.
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
