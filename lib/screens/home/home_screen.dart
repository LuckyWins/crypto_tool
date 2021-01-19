import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _scrollController = ScrollController();
  RefreshController refreshController = RefreshController(initialRefresh: true);

  List<Videocard> _videocards = [];
  bool get isListEmpty => (_videocards?.length ?? 0) == 0;

  SortOptions _currentOption = SortOptions.none;

  @override
  void dispose() {
    _scrollController?.dispose();
    refreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _successLoad(state.videocards, state.sortOption);
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
                    children: <Widget>[
                      Text(
                        "Список пуст.\nВоспользуйтесь фильтром",
                        textAlign: TextAlign.center
                      )
                    ],
                  )
                  : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    separatorBuilder: (context, _) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(),
                    ),
                    itemCount: _videocards?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) => HomeItem(_videocards[index])
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  _onRefresh({
    @required SortOptions option
  }) {
    context.read<HomeBloc>().add(HomeInit(
      option: option
    ));
  }

  _catchErrorToRefreshController() {
    refreshController.refreshFailed();
  }

  _successLoad(List<Videocard> list, SortOptions option) {
    refreshController.resetNoData();

    setState(() {
      _currentOption = option;
      _videocards = List.from(list);
    });
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn
    );

    if (isListEmpty) {
      refreshController.refreshToIdle();
    } else {
      refreshController.refreshCompleted();
    }
  }
}
