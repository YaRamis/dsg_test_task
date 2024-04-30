import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class DefaultAppButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final double width;
  final double height;

  const DefaultAppButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(AppColors.defaultColor),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(AppColors.overlayColor),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          fixedSize: MaterialStateProperty.all(Size(width, height)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class CircleAppButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final double radius;
  final Color color;

  const CircleAppButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: radius * 2,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(AppColors.overlayColor),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fixedSize: MaterialStateProperty.all(Size.square(radius * 2)),
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
