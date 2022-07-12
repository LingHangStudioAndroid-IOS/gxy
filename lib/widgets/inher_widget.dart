import 'package:flutter/material.dart';

class SharedDataWidget extends InheritedWidget {
  const SharedDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);
  final int data;

  static SharedDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
  }

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}
