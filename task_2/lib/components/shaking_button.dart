
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class ShakingButton extends StatefulWidget {
  const ShakingButton({super.key});

  @override
  State<ShakingButton> createState() => _ShakingButtonState();
}

class _ShakingButtonState extends State<ShakingButton> {
    bool autoPlay = false;
    Color buttonColor = Colors.green;
    
    late AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
              shakeConstant: ShakeHardConstant2(),
              autoPlay: autoPlay,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      playShake();
                      playSound();
                    });
                  },
                  style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor, // Change button color here
              elevation: 5, // Adjust elevation as needed
            ),
                  child: const Text("Shaking Button")),
            );
  }
  Future<void> playSound() async {
    String audioPath = "sounds/applepay.mp3";
    await player.play(AssetSource(audioPath));
    player.onPlayerComplete.listen((event) {
      setState(() {
        autoPlay = false;
        buttonColor = Colors.green;
      });
    });
  }

  void playShake() {
    setState(() {
      buttonColor = Colors.blue;
      autoPlay = !autoPlay;
    });
  }
}