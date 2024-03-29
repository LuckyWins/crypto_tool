import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:cryptotool/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is HomeLoaded) {
        return IconButton(
          onPressed: () async {
            final option = await Multiplatform.showDropdown<SortOptions>(
              context,
              map: SortExtersion.mapNamesForFilter,
              selected: state.sortOption
            );
            if (option != null) {
              context.read<HomeBloc>().add(HomeFilter(option));
            }
          },
          icon: const Icon(Icons.sort),
        );
      } else {
        // return Container();
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.sort,
            size: 24,
            color: Colors.black.withOpacity(0.5),
          ),
        );
      }
    },
  );
}