import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/utils/utils.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class SettingsForm extends StatefulWidget {
  final BynToUsdExchangeSource initialBynToUsdExchangeSource;
  final double initialBynToUsdExchangeRate;

  const SettingsForm({
    @required this.initialBynToUsdExchangeSource,
    @required this.initialBynToUsdExchangeRate
  });

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _settingsFormKey = GlobalKey<FormState>();

  BynToUsdExchangeSource _bynToUsdExchangeSource;
  double _bynToUsdExchangeRate;

  final _bynToUsdController = TextEditingController();
  
  Map<BynToUsdExchangeSource, String> _mapBynToUsdExchangeSource = {
    BynToUsdExchangeSource.nbrb: "НБРБ",
    BynToUsdExchangeSource.alfabank: "Альфа-Банк",
    BynToUsdExchangeSource.manually: "Вручную"
  };

  @override
  void initState() {
    super.initState();

    _bynToUsdController.text = _mapBynToUsdExchangeSource[widget.initialBynToUsdExchangeSource];
    _bynToUsdExchangeSource = widget.initialBynToUsdExchangeSource;

  }

  @override
  void dispose() {
    _bynToUsdController?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return DismissOutside(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Настройки"),
          actions: [
            SaveButton(
              onPressed: () {
                if (_settingsFormKey.currentState.validate()) {
                  _settingsFormKey.currentState.save();
                  context.read<SettingsBloc>().add(
                    SettingsSave(
                      bynToUsdExchangeSource: _bynToUsdExchangeSource,
                      bynToUsdExchangeRate: _bynToUsdExchangeRate
                    )
                  );
                }
              },
            )
          ],
        ),
        body: FullScreen(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _settingsFormKey,
              child: Column(
                children: [
                  BynToUsdField(
                    controller: _bynToUsdController,
                    onTap: () => _showBynToUsdDropDown(),
                  ),
                  if (_bynToUsdExchangeSource == BynToUsdExchangeSource.manually)
                    CurrencyField(
                      initialValue: widget.initialBynToUsdExchangeRate,
                      onSaved: (value) {
                        _bynToUsdExchangeRate = value;
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showBynToUsdDropDown() async {
    final value = await Multiplatform.showDropdown(
      context:context,
      map: _mapBynToUsdExchangeSource,
      selected: _bynToUsdExchangeSource,
      title: "BYN -> USD"
    );
    if (value != null) {
      _bynToUsdController.text = _mapBynToUsdExchangeSource[value];
      setState(() {
        _bynToUsdExchangeSource = value;
      });
    }
  }
}