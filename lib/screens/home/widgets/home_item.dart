import 'package:cryptotool/models/models.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final Videocard videocard;

  const HomeItem(this.videocard);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(videocard.name),
      subtitle: Text("\$ ${videocard.minPrice} - ${videocard.maxPrice}"),
    );
  }
}