import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class ActualWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        // color: Colors.black.withOpacity(0.1),
        color: AppStyles.mainColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 8),
          Icon(
            Icons.warning_rounded,
            // color: AppStyles.mainColor,
            color: Colors.yellow,
            size: 32,
          ),
          SizedBox(width: 16),
          Expanded(child: Text("Информация по хешрейту и энергопотреблению не актуальна")),SizedBox(width: 8),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}