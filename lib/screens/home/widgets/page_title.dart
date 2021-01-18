import 'package:flutter/material.dart';
import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Widget body = Container();
        if (state is HomeLoaded) {
          if (state.sortOption != SortOptions.none) {
            return Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.black.withOpacity(0.3),
            child: Text(
              state.sortOption.name,
              style: TextStyle(
                color: Colors.white
              ),
            )
          );
          }
        }
        return body;
      },
    );
  }
}