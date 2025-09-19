import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/ui/player/components/player_control.dart';
import '/ui/player/player_controller.dart';

class StandardPlayer extends StatelessWidget {
  const StandardPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.find<PlayerController>();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add a lyrics toggle button to the player controls
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Obx(() => Icon(
                  playerController.showLyricsflag.value 
                    ? Icons.lyrics 
                    : Icons.lyrics_outlined,
                  color: Theme.of(context).textTheme.titleMedium!.color,
                )),
                onPressed: () => playerController.showLyrics(),
                tooltip: "Toggle Lyrics",
              ),
            ],
          ),
          // Player controls
          const Expanded(
            child: PlayerControlWidget(),
          ),
        ],
      ),
    );
  }
}
