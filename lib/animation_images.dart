import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationImages extends StatelessWidget {
  late final String text;
  final bool isName;
  final double rightPosition;
  late final double topPosition;
  AnimationImages({
    Key? key,
    required String imagePath,
    this.isName = false,
    required this.rightPosition,
  }) : super(key: key) {
    text = imagePath;
    topPosition = ScreenUtil().screenHeight * 0.2;
  }

  AnimationImages.name({
    Key? key,
    required String nameImage,
    this.isName = true,
    required this.rightPosition,
    this.topPosition = 20,
  }) : super(key: key) {
    text = nameImage;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        right: rightPosition,
        top: topPosition,
        child: isName
            ? Text(
                text,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.deepOrange,
                ),
              )
            : SizedBox(
                width: ScreenUtil().screenWidth * 0.3,
                height: ScreenUtil().screenHeight * 0.3,
                child: Image.asset(text),
              ),
        duration: const Duration(milliseconds: 200));
  }
}
