import 'dart:async';
import 'package:flutter/material.dart';
import 'post_card.dart';

class AnimatedMessageCard extends StatefulWidget {
  final int index;
  final int delayMilliseconds;
  final String name;
  final String time;
  final String message;
  final String avatarPath;

  const AnimatedMessageCard({
    super.key,
    required this.index,
    required this.delayMilliseconds,
    required this.name,
    required this.time,
    required this.message,
    required this.avatarPath,
  });

  @override
  State<AnimatedMessageCard> createState() => _AnimatedMessageCardState();
}

class _AnimatedMessageCardState extends State<AnimatedMessageCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    // Gecikmeli başlat
    Timer(Duration(milliseconds: widget.delayMilliseconds), () {
      if (mounted) {
        setState(() => _visible = true);
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ScaleTransition(
        scale: _animation,
        child: _visible
            ? PostCard(
          name: widget.name,
          time: widget.time,
          message: widget.message,
          avatarPath: widget.avatarPath,
        )
            : const SizedBox.shrink(),
      ),
    );
  }
}
