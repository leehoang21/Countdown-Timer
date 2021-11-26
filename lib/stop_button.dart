import 'package:couwn_douwn/provider/provider_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StopButton extends StatelessWidget {
  const StopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.5, 0.9),
      child: SizedBox.fromSize(
        size: const Size(
          80,
          80,
        ),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            context.read<ProviderTime>().stopTimer();
          },
          child: const Text(
            'stop',
            style: TextStyle(
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
