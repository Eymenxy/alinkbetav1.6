import 'package:flutter/material.dart';
import '../widgets/animated_message_card.dart';

class OgretmenMesajlari extends StatelessWidget {
  const OgretmenMesajlari({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimatedMessageCard(
          index: index,
          delayMilliseconds: index * 150, // Her kart için sırayla animasyon
          name: "Öğretmen $index",
          time: "0${index}:30",
          message: "Bu öğretmen mesajıdır. İçerik $index",
          avatarPath: "assets/profile.png",
        );
      },
    );
  }
}
