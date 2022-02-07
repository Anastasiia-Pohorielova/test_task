import 'package:flutter/material.dart';
import 'package:test_task/res/app_consts.dart';
import 'package:test_task/res/app_styles/app_shadows.dart';

/// it is widget for pointer
class PointerWidget extends StatelessWidget {

  /// Diameter of pointer
  final double sizeOfPointer;
  /// On tap function
  final Function() onTap;

  /// Constructor for building widget
  const PointerWidget({
    required this.sizeOfPointer,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: sizeOfPointer,
        height: sizeOfPointer,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: AppShadows.pointerShadow(),
        ),
        child: const Text(AppConsts.pointerTitle),
      ),
    );
  }
}
