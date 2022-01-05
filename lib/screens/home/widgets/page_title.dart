import 'package:cryptotool/models/models.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final SortOptions option;

  const PageTitle({
    required this.option
  });
  
  @override
  Widget build(BuildContext context) {
    if (option != SortOptions.none) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.black.withOpacity(0.3),
        child: Text(
          option.name,
          style: const TextStyle(
            color: Colors.white
          ),
        )
      );
    } else {
      return Container();
    }
  }
}