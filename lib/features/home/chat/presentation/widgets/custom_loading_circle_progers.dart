import 'package:flutter/material.dart';

class CustomLoadingCircleProgres extends StatelessWidget {
  const CustomLoadingCircleProgres({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,

      child: CircularProgressIndicator.adaptive(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}
