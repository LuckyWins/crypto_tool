import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Home"),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Text(
                "${state.bynToUsd} BYN = 1 USD",
                style: TextStyle(
                  fontSize: 14,
                  color: AppStyles.mainTextColor.withOpacity(0.5)
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}