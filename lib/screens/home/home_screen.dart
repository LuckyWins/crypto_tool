import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scrollController = ScrollController();
  RefreshController refreshController = RefreshController();

  List<Videocard> _videocards = [];
  bool get isListEmpty => _videocards.isEmpty;

  SortOptions? _currentOption;
  var _showPriceRise = false;
  var _includeElectricityCost = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) => context.read<HomeBloc>().add(HomeCheckLoaded()));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: CryptoDrawer(
      isGpuSelected: true,
      settingsCallback: (value) {
        if (value) refreshController.requestRefresh();
      },
    ),
    appBar: AppBar(
      centerTitle: false,
      title: AppBarTitle(),
      actions: [
        FilterButton()
      ],
    ),
    body: BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          _catchErrorToRefreshController();
        }
        if (state is HomeLoaded) {
          _successLoad(state);
        }
        if (state is HomeToggleRefresh) {
          refreshController.requestRefresh();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageTitle(
            option: _currentOption,
          ),
          Expanded(
            child: Scrollbar(
              child: SmartRefresher(
                scrollController: _scrollController,
                primary: false,
                controller: refreshController,
                onRefresh: () => _onRefresh(
                  option: _currentOption
                ),
                enablePullDown: true,
                enablePullUp: false,
                header: RefreshHeader(),
                child: isListEmpty
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Список пуст.\nВоспользуйтесь фильтром',
                      textAlign: TextAlign.center
                    )
                  ],
                )
                : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  separatorBuilder: (context, _) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),
                  itemCount: _videocards.length,
                  itemBuilder: (BuildContext context, int index) => HomeItem(
                    videocard: _videocards[index],
                    showPriceRise: _showPriceRise || _currentOption == SortOptions.priceRiseAsc,
                    includeElectricityCost: _includeElectricityCost
                  )
                )
              ),
            ),
          )
        ],
      ),
    )
  );

  void _onRefresh({
    required SortOptions? option
  }) {
    context.read<HomeBloc>().add(HomeInit(
      option: option
    ));
  }

  void _catchErrorToRefreshController() {
    refreshController.refreshFailed();
  }

  void _successLoad(HomeLoaded state) {
    refreshController.resetNoData();

    setState(() {
      _currentOption = state.sortOption;
      _videocards = List.from(state.videocards);
      _showPriceRise = state.showPriceRise;
      _includeElectricityCost = state.includeElectricityCost;
    });
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn
    );

    if (isListEmpty) {
      refreshController.refreshToIdle();
    } else {
      refreshController.refreshCompleted();
    }
  }
}
