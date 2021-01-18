import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
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
              var option = await showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  // title: Text(
                  //   "Сортировка",
                  //   style: TextStyle(
                  //     fontSize: 18
                  //   ),
                  // ),
                  children: SortExtersion.mapNamesForFilter.map((option, description) => MapEntry(option,
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context, option),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: state.sortOption == option
                                ? FontWeight.bold
                                : FontWeight.normal
                          ),
                        ),
                      ),
                    )
                  )).values.toList(),
                )
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