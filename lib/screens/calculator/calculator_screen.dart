import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/styles.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/widgets.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _hashrateController = TextEditingController();

  RefreshController refreshController = RefreshController();

  // for textController
  bool initialLoaded = false;

  @override
  void initState() {
    super.initState();

    _hashrateController.addListener(() {
      final value = _hashrateController.text.toIntOrNull() ?? 0;
      context.read<CalculatorBloc>().add(CalculatorCompute(value));
    });

    WidgetsBinding.instance?.addPostFrameCallback((_) => context.read<CalculatorBloc>().add(CalculatorCheckLoaded()));
  }

  @override
  void dispose() {
    _hashrateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DismissOutside(
    child: Scaffold(
      drawer: const CryptoDrawer(isCalculatorSelected: true),
      appBar: AppBar(
        title: const Text('Калькулятор дохода'),
      ),
      body: SmartRefresher(
        // topSafe: false,
        // bottomSafe: false,
        primary: false,
        controller: refreshController,
        onRefresh: () => context.read<CalculatorBloc>().add(CalculatorInit()),
        enablePullDown: true,
        enablePullUp: false,
        header: RefreshHeader(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: BlocConsumer<CalculatorBloc, CalculatorState>(
            listener: (context, state) {
              if (state is CalculatorError) {
                _catchErrorToRefreshController();
              }
              if (state is CalculatorInitial) {
                _successLoad();
              }
              if (state is CalculatorToggleRefresh) {
                refreshController.requestRefresh();
              }
            },
            buildWhen: (context, state) {
              if (state is CalculatorLoading) return false;
              return true;
            },
            builder: (context, state) {
              Widget body = Container();

              if (state is CalculatorInitial) {
                if (!initialLoaded) {
                  _hashrateController.text = state.hashrate.toString();
                  initialLoaded = true;
                }
                body = Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EthRate(
                      eth: state.ethRate,
                      changePercentage: state.changePercentage,
                    ),
                    const SizedBox(height: 16),
                    HashrateField(
                      controller: _hashrateController,
                    ),
                    const SizedBox(height: 32),
                    CalculateTimeControl(
                      selectedTab: state.time,
                      onTabChanged: (value) {
                        context.read<CalculatorBloc>().add(CalculatorUpdateTime(value));
                      },
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Ваш доход за ${state.time.calculationName}',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: EthProfit(state.ethProfit)
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: UsdProfit(state.usdProfit)
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48),
                      child: Text(
                        'Примерные данные основанные на профитности пула EMCD за 24ч',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                    )
                  ],
                );
              }
              // if (state is CalculatorLoading) {
              //   body = Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: <Widget>[
              //       LoadingIndicator(),
              //       SizedBox(
              //         height: 16,
              //       ),
              //       Center(child: Text("Пожалуйста, подождите"))
              //     ],
              //   );
              // }
              if (state is CalculatorError) {
                body = Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Center(
                        child: Text(
                          'Не удалось связаться с серверами',
                          style: TextStyle(
                            color: AppStyles.mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () => context.read<CalculatorBloc>().add(CalculatorInit()),
                      child: const Text(
                        'Повторить',
                        style: TextStyle(
                          color: AppStyles.mainColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                );
              }

              return body;
            },
          ),
        ),
      )
    ),
  );

  void _catchErrorToRefreshController() {
    refreshController.refreshFailed();
  }

  void _successLoad() {
    refreshController
      ..resetNoData()
      ..refreshCompleted();
  }
}