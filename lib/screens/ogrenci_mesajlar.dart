import 'package:flutter/material.dart';
import '../widgets/animated_message_card.dart';

class OgrenciMesajlari extends StatelessWidget {
  const OgrenciMesajlari({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimatedMessageCard(
          index: index,
          delayMilliseconds: index * 150,
          name: 'Öğrenci $index',
          time: '0${index + 1}:00',
          message: 'Bu öğrenci mesajıdır. İçerik $index',
          avatarPath: 'assets/profile.png',
        );
      },
    );
  }
}
