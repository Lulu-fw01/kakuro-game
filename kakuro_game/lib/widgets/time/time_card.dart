import 'package:flutter/material.dart';
import 'package:kakuro_game/assets/consts.dart';

 Widget timeCard({required String time, required String header}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: thirdColor, borderRadius: BorderRadius.circular(20)),
          child: Text(
            time,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: buttonColor, fontSize: 50),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(header, style: const TextStyle(color: Colors.black45)),
      ],
    );
