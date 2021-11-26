import 'package:couwn_douwn/provider/provider_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartPauseButton extends StatelessWidget {
  const StartPauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-0.5, 0.9),
      child: SizedBox.fromSize(
        size: const Size(
          80,
          80,
        ),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            if (!context.read<ProviderTime>().isRun) {
              context.read<ProviderTime>().startTimer();
            } else {
              context.read<ProviderTime>().pauseTimer();
            }
          },
          child: Text(
            text(context),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }

  String text(BuildContext context) {
    if (context.read<ProviderTime>().isRun) {
      return 'pause';
    } else {
      if (!context.read<ProviderTime>().isStart()) {
        return 'Resume';
      } else {
        return 'start';
      }
    }
  }
}
