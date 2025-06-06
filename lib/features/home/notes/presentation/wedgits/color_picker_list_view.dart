import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/core/utils/widgets/app_colors.dart';
import 'package:multiservices_app/features/home/notes/presentation/wedgits/color_picker.dart';
import 'package:multiservices_app/features/home/notes/states_manager/add_note/add_note_cubit.dart';

class ColorPickerListView extends StatefulWidget {
  ColorPickerListView({super.key});

  @override
  State<ColorPickerListView> createState() => _ColorPickerListViewState();
}

class _ColorPickerListViewState extends State<ColorPickerListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppColors.kcolors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).noteColor =
                  AppColors.kcolors[index].toARGB32();
              setState(() {});
            },
            child: ColorPiker(
              bacgroundColor: AppColors.kcolors[index],
              isSelected: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
