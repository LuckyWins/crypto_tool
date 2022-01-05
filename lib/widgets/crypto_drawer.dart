import 'package:cryptotool/navigation.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class CryptoDrawer extends StatefulWidget {
  final bool isGpuSelected;
  final bool isCalculatorSelected;
  final bool isHelpSelected;
  final bool isSettingsSelected;

  final Function(bool value)? settingsCallback;

  const CryptoDrawer({
    this.isGpuSelected = false,
    this.isCalculatorSelected = false,
    this.isHelpSelected = false,
    this.isSettingsSelected = false,
    this.settingsCallback
  });

  @override
  _CryptoDrawerState createState() => _CryptoDrawerState();
  
}

class _CryptoDrawerState extends State<CryptoDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const CryptoDrawerHeader(
            title: 'title',
            subtitle: 'subtitle',
          ),
          DrawerItemSvg(
            selected: widget.isGpuSelected,
            assetName: 'gpu',
            text: 'Видеокарты',
            onTap: () {
              if (!widget.isGpuSelected) {
                Navigation.toHome();
              }
            }
          ),
          DrawerItem(
            selected: widget.isCalculatorSelected,
            icon: Icons.calculate,
            text: 'Калькулятор',
            onTap: () {
              if (!widget.isCalculatorSelected) {
                Navigation.toCalculator();
              }
            }
          ),
          const Divider(),
          DrawerItem(
            selected: widget.isHelpSelected,
            icon: Icons.help_outline,
            text: 'Помощь',
            onTap: () {
              // Close the drawer.
              Navigator.pop(context);
              if (!widget.isHelpSelected) {
                // Navigation.toInfo();
              }
            },
          ),
          DrawerItem(
            selected: widget.isSettingsSelected,
            icon: Icons.settings,
            text: 'Настройки',
            onTap: () async {
              // Close the drawer.
              Navigator.pop(context);
              if (!widget.isSettingsSelected) {
                final value = await Navigation.toSettings();
                widget.settingsCallback?.call(value ?? false);
              }
            },
          )
        ]
      ),
    )
  );
  
}