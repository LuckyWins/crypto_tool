import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsSavedSuccess) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        Widget body = Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Настройки"),
          ),
        );

        if (state is SettingsLoading) {
          body = Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Настройки"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                ),
                LoadingIndicator()
              ],
            )
          );
        }
        if (state is SettingsInitial) {
          body = SettingsForm(
            initialBynToUsdExchangeSource: state.bynToUsdExchangeSource,
            initialBynToUsdExchangeRate: state.bynToUsdExchangeRate,
            initialSortOption: state.sortOption,
            initialShowPriceRise: state.showPriceRise,
            initialIncludeElectricityCost: state.includeElectricityCost,
            initialElectricityCost: state.electricityCost,
          );
        }
        return body;
      },
    );
  }
}