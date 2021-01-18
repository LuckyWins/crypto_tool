import 'package:cryptotool/blocs/blocs.dart';
import 'package:cryptotool/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {

  Map<SortOptions, String> _mapOptions = {
    SortOptions.cardPriceAsc: "Сначала дешевые",
    SortOptions.cardPriceDesc: "Сначала дорогие",
    SortOptions.paybackDesc: "Сначала быстроокупаемые",
    SortOptions.paybackAsc: "Сначала плохоокупаемые",
    SortOptions.dailyUsdDesc: "Сначала самые доходные",
    SortOptions.dailyUsdAsc: "Сначала менее прибыльные"
  };

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
                  title: Text(
                    "Сортировать по",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  children: _mapOptions.map((option, description) => MapEntry(option,
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context, option),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.w400
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