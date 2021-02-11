import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateTimeControl extends StatelessWidget {
  final CalculateTime selectedTab;
  final Function(CalculateTime activeTab) onTabChanged;

  const CalculateTimeControl({
    @required this.selectedTab,
    @required this.onTabChanged
  });
    
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoSegmentedControl<CalculateTime>(
        // borderColor: AppStyles.mainTextColor.withOpacity(0.1),
        // unselectedColor: Colors.white,
        // selectedColor: Colors.white,
        // pressedColor: Colors.white,
        onValueChanged: (tab) => onTabChanged(tab),
        groupValue: selectedTab,
        children: <CalculateTime, Widget> {
          CalculateTime.hour: _tabItem(CalculateTime.hour),
          CalculateTime.day: _tabItem(CalculateTime.day),
          CalculateTime.week: _tabItem(CalculateTime.week),
          CalculateTime.month: _tabItem(CalculateTime.month),
        },
      ),
    );
  }

  Widget _tabItem(CalculateTime controlledTab) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(
        controlledTab.name,
        style: TextStyle(
          // fontSize: 16,
          // letterSpacing: -0.1
        ),
      )
    );
  }
}