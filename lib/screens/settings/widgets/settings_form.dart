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

  const SettingsForm({
    @required this.initialBynToUsdExchangeSource,
    @required this.initialBynToUsdExchangeRate,
    @required this.initialSortOption,
    @required this.initialShowPriceRise
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
                      showPriceRise: _showPriceRise
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
                    child: CurrencyField(
                      initialValue: widget.initialBynToUsdExchangeRate,
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
                ShowPriceRiseSwitch(
                  value: _showPriceRise,
                  onTap: (value) => setState(() => _showPriceRise = value)
                )
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