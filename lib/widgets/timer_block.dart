// timer_block.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';

class TimerBlock extends StatelessWidget {

  final RxInt time;

  const TimerBlock(this.time, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(3)),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(3)),
        color: GouyiColors.theme,

      ),
      child: Text(
        time.value.toString().padLeft(2, '0'),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

}