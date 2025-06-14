import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    super.key,
    required this.title,
    required this.dataImage,
    @required this.imageTopPading,
  });
  final String title;
  final String dataImage;
  final double? imageTopPading;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * (imageTopPading ?? 0.05),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Center(child: Image.asset(dataImage, fit: BoxFit.cover)),
        ),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
