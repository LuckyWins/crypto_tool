import 'package:cryptotool/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return Container();
        } else {
          return IconButton(
            onPressed: () => context.read<HomeBloc>().add(HomeInit()),
            icon: Icon(Icons.refresh),
          );
        }
      }
    );
  }
}