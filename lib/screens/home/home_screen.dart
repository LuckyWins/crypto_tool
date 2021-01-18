import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        actions: [
          UpdateButton()
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          Widget body = Container();
          if (state is HomeLoading) {
            body = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                ),
                LoadingIndicator()
              ],
            );
          }
          if (state is HomeLoaded) {
            body = ListView.separated(
              separatorBuilder: (context, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              itemCount: state.videocards?.length ?? 0,
              itemBuilder: (context, index) => HomeItem(state.videocards[index])
            );
          }
          if (state is HomeError) {
            body = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error?.toString() ?? "Ошибка"),
                SizedBox(height: 16),
                FlatButton(
                  onPressed: () => context.read<HomeBloc>().add(HomeInit()),
                  child: Text("Повторить")
                )
              ],
            );
          }
          return body;
        },
      )
    );
  }
}
