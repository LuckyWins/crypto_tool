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
  final SortOptions initialSortOption;
  final bool initialShowPriceRise;
  final bool initialIncludeElectricityCost;
  final double initialElectricityCost;
  final double initialPcPower;

  const SettingsForm({
    @required this.initialBynToUsdExchangeSource,
    @required this.initialBynToUsdExchangeRate,
    @required this.initialSortOption,
    @required this.initialShowPriceRise,
    @required this.initialIncludeElectricityCost,
    @required this.initialElectricityCost,
    @required this.initialPcPower
  });

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _settingsFormKey = GlobalKey<FormState>();

  BynToUsdExchangeSource _bynToUsdExchangeSource;
  double _bynToUsdExchangeRate;
  SortOptions _sortOption;
  bool _showPriceRise;
  bool _includeElectricityCost;
  double _electricityCost;
  double _pcPower;

  final _bynToUsdController = TextEditingController();
  final _sortOptionController = TextEditingController();
  
  Map<BynToUsdExchangeSource, String> _mapBynToUsdExchangeSource = {
    BynToUsdExchangeSource.nbrb: "НБРБ",
    BynToUsdExchangeSource.alfabank: "Альфа-Банк",
    BynToUsdExchangeSource.manually: "Вручную"
  };

  @override
  void initState() {
    super.initState();

    _bynToUsdExchangeSource = widget.initialBynToUsdExchangeSource;
    _bynToUsdController.text = _mapBynToUsdExchangeSource[_bynToUsdExchangeSource];

    _sortOption = widget.initialSortOption;
    _sortOptionController.text = SortExtersion.mapNames[_sortOption];

    _showPriceRise = widget.initialShowPriceRise;
    _includeElectricityCost = widget.initialIncludeElectricityCost;
  }

  @override
  void dispose() {
    _bynToUsdController?.dispose();
    _sortOptionController?.dispose();
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
                      bynToUsdExchangeRate: _bynToUsdExchangeRate,
                      sortOption: _sortOption,
                      showPriceRise: _showPriceRise,
                      includeElectricityCost: _includeElectricityCost,
                      electricityCost: _electricityCost,
                      pcPower: _pcPower
                    )
                  );
                }
              },
            )
          ],
        ),
        body: FullScreen(
          child: Form(
            key: _settingsFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BynToUsdField(
                    controller: _bynToUsdController,
                    onTap: () => _showBynToUsdDropDown(),
                  ),
                ),
                if (_bynToUsdExchangeSource == BynToUsdExchangeSource.manually)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: MoneyField(
                      initialValue: widget.initialBynToUsdExchangeRate,
                      mandatory: true,
                      label: "Курс *",
                      onSaved: (value) {
                        _bynToUsdExchangeRate = value;
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: SortOptionField(
                    controller: _sortOptionController,
                    onTap: () => _showSortOptionDropDown(),
                  ),
                ),
                SizedBox(height: 8),
                ParamSwitch(
                  value: _showPriceRise,
                  text: "Отображать рыночную цену",
                  onTap: (value) => setState(() => _showPriceRise = value)
                ),
                // SizedBox(height: 8),
                ParamSwitch(
                  value: _includeElectricityCost,
                  text: "Включать электроэнергию в расчеты",
                  onTap: (value) => setState(() => _includeElectricityCost = value)
                ),
                if (_includeElectricityCost)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: MoneyField(
                      initialValue: widget.initialElectricityCost,
                      mandatory: true,
                      decimalRange: 4,
                      label: "Цена \$/kWh *",
                      onSaved: (value) {
                        _electricityCost = value;
                      },
                    ),
                  ),
                if (_includeElectricityCost)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: MoneyField(
                      initialValue: widget.initialPcPower,
                      label: "Мощность ПК, W",
                      onSaved: (value) {
                        _pcPower = value;
                      },
                    ),
                  ),
              ],
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

  _showSortOptionDropDown() async {
    final value = await Multiplatform.showDropdown<SortOptions>(
      context:context,
      map: SortExtersion.mapNames,
      selected: _sortOption,
      title: "Сортировка при запуске"
    );
    if (value != null) {
      _sortOptionController.text = SortExtersion.mapNames[value];
      setState(() {
        _sortOption = value;
      });
    }
  }
}