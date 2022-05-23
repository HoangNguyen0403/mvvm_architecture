import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Wrapper for wrapping widget in Material App.
/// This will avoid UI exception when running widget.
class TestWidgetWrapper extends StatelessWidget {
  final Widget child;

  const TestWidgetWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(400, 800),
        builder: (_, __) => child,
      ),
    );
  }
}
