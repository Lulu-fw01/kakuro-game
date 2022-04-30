import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';

/// Time card that shows number of seconds,
/// minutes or hours at the moment.
 Widget timeCard({required String time}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: buttonColor, 
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            time,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: fifthColor, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
