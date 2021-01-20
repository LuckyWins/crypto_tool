import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Crypto Tool"),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Text(
                state.electricityCost == null || state.electricityCost == 0.0
                ? "\$1 = ${state.bynToUsd} BYN"
                : "\$1 = ${state.bynToUsd} BYN; 1kWh = \$${state.electricityCost}",
                style: TextStyle(
                  fontSize: 14,
                  color: AppStyles.mainTextColor.withOpacity(0.5)
                ),
              );
            } else {
              // return Container();
              return Text(
                "\$1 = - BYN",
                style: TextStyle(
                  fontSize: 14,
                  color: AppStyles.mainTextColor.withOpacity(0.5)
                ),
              );
            }
          },
        )
      ],
    );
  }
}