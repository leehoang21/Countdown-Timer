import 'package:couwn_douwn/provider/provider_images_position.dart';
import 'package:couwn_douwn/provider/provider_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ArrowButton extends StatelessWidget {
  final Icon icon;
  final int value;
  final bool isRight;
  final bool lim;
  const ArrowButton({
    Key? key,
    required this.lim,
    required this.icon,
    required this.value,
    required this.isRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().screenHeight * 0.3,
      right: isRight ? 10 : null,
      left: isRight ? null : 10,
      child: IconButton(
        onPressed: () {
          var _isStart = context.read<ProviderTime>().isStart();

          if (lim && _isStart) {
            context.read<ProviderImagePosition>().setImagePosition(value);
          }
        },
        icon: icon,
      ),
    );
  }
}
