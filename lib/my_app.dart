import 'package:couwn_douwn/animation_images.dart';
import 'package:couwn_douwn/arrow_button.dart';
import 'package:couwn_douwn/circular_progress.dart';
import 'package:couwn_douwn/color.dart';
import 'package:couwn_douwn/image_path.dart';
import 'package:couwn_douwn/name_images.dart';
import 'package:couwn_douwn/provider/provider_images_position.dart';
import 'package:couwn_douwn/provider/provider_time.dart';
import 'package:couwn_douwn/start_pause_button.dart';
import 'package:couwn_douwn/stop_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return Scaffold(
          backgroundColor: ColorApp.lightOrange,
          appBar: AppBar(
            backgroundColor: ColorApp.lightOrange,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                const Text(
                  'bất ngờ chưa',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
                Image.asset(ImagePath.imagesGif),
              ],
            ),
          ),
          body: SizedBox.fromSize(
            size: Size(
              ScreenUtil().screenWidth,
              ScreenUtil().screenHeight,
            ),
            child: Stack(
              children: [
                AnimationImages.name(
                  rightPosition:
                      context.watch<ProviderImagePosition>().screenSoft,
                  nameImage: NameImages.soft,
                ),
                AnimationImages.name(
                  rightPosition:
                      context.watch<ProviderImagePosition>().screenpoached,
                  nameImage: NameImages.poached,
                ),
                AnimationImages.name(
                  rightPosition:
                      context.watch<ProviderImagePosition>().screenhardBoiled,
                  nameImage: NameImages.hardBoiled,
                ),
                ArrowButton(
                    lim: context.read<ProviderImagePosition>().soft > -1,
                    icon: const Icon(Icons.arrow_back_ios),
                    value: -1,
                    isRight: false),
                AnimationImages(
                  imagePath: ImagePath.imagesSoftBoiledEgg,
                  rightPosition:
                      context.watch<ProviderImagePosition>().screenSoft,
                ),
                AnimationImages(
                  imagePath: ImagePath.imagesPoachedEgg,
                  rightPosition:
                      context.watch<ProviderImagePosition>().screenpoached,
                ),
                AnimationImages(
                  imagePath: ImagePath.imagesHardBoiledEgg,
                  rightPosition:
                      context.watch<ProviderImagePosition>().screenhardBoiled,
                ),
                ArrowButton(
                    lim: context.read<ProviderImagePosition>().poached < 1,
                    icon: const Icon(Icons.arrow_forward_ios),
                    value: 1,
                    isRight: true),
                const CircularProgress(),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: Text(
                    (context.watch<ProviderTime>().stringSeconds),
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                    ),
                  ),
                ),
                StartPauseButton(),
                const StopButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
