import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class ZoomSlider extends StatelessWidget {
  final void Function(double)? onChanged;
  final double zoomPercent;

  const ZoomSlider(
      {super.key, required this.onChanged, required this.zoomPercent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Column(
        children: [
          Icon(
            Icons.add_rounded,
            color: AppColors.defaultColor,
            size: 30,
          ),
          RotatedBox(
            quarterTurns: -1,
            child: SizedBox(
              width: 200,
              child: SliderTheme(
                data: SliderThemeData(
                    overlayShape: SliderComponentShape.noOverlay),
                child: Slider(
                  value: zoomPercent,
                  min: 0.3,
                  max: 3.0,
                  thumbColor: Colors.white,
                  activeColor: AppColors.mainColor.withOpacity(0.8),
                  inactiveColor: Colors.white.withOpacity(0.5),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
          Icon(
            Icons.minimize_rounded,
            color: AppColors.defaultColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
