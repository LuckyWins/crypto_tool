import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return IconButton(
            onPressed: () async {
              var option = await Multiplatform.showDropdown<SortOptions>(
                context: context,
                map: SortExtersion.mapNamesForFilter,
                selected: state.sortOption
              );
              if (option != null) {
                context.read<HomeBloc>().add(HomeFilter(option));
              }
            },
            icon: Icon(Icons.sort),
          );
        } else {
          return Container();
        }
      },
    );
  }
}