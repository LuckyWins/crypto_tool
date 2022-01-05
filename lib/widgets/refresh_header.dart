import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => defaultTargetPlatform == TargetPlatform.iOS
    ? const ClassicHeader(
      idleText: 'Потяните вниз, чтобы обновить',
    )
    : const MaterialClassicHeader();
}