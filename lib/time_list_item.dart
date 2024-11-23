import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post_review/Item_Time.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TimerListItem extends StatefulWidget {
  final ItemTimer item;

  const TimerListItem({required this.item});

  @override
  _TimerListItemState createState() => _TimerListItemState();
}

class _TimerListItemState extends State<TimerListItem> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          widget.item.elapsedTime += Duration(seconds: 1);
        });
      });
    }
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.item.id}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0) {
          _startTimer();
        } else {
          _stopTimer();
        }
      },
      child: Text('${widget.item.elapsedTime.inSeconds}s'),
    );
  }
}
