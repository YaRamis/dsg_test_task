import 'package:dsg_test_task/theme/app_colors.dart';
import 'package:dsg_test_task/widgets/common_widgets/zoom_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grid_paper/grid_paper.dart';

import '../common_widgets/app_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _gridLock = false;
  Offset _panOffset = Offset.zero;
  double _zoomPercent = 1.0;
  final painter = Paint();

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _panOffset -= details.delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.canvasBackgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onPanUpdate: _onPanUpdate,
              child: Stack(
                children: [
                  DotMatrixPaper(
                    panOffset: _panOffset,
                    zoomPercent: _zoomPercent,
                    gridUnitSize: 25,
                    background: AppColors.canvasBackgroundColor,
                    style: const DotMatrixStyle.standard().copyWith(
                      divider: DotMatrixDivider.cross,
                      dotColor: AppColors.mainColor,
                      dividerColor: AppColors.mainColor,
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ZoomSlider(
                    onChanged: (double value) {
                      setState(() {
                        _zoomPercent = value;
                      });
                    },
                    zoomPercent: _zoomPercent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        DefaultAppButton(
                          onPressed: () {},
                          width: 40,
                          height: 32,
                          child: const Icon(
                            Icons.undo_rounded,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                          child: VerticalDivider(
                            color: AppColors.defaultColor,
                            width: 0.5,
                            thickness: 0.5,
                          ),
                        ),
                        DefaultAppButton(
                          onPressed: () {},
                          width: 40,
                          height: 32,
                          child: const Icon(
                            Icons.redo_rounded,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CircleAppButton(
                    onPressed: () {
                      _gridLock = !_gridLock;
                      setState(() {});
                    },
                    radius: 23,
                    color: _gridLock ? Colors.blue : Colors.white,
                    child: Icon(
                      Icons.grid_3x3_rounded,
                      size: 30,
                      color: _gridLock ? Colors.white : AppColors.defaultColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
