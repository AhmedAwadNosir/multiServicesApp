import 'package:flutter/material.dart';
import 'package:multiservices_app/generated/l10n.dart';

class NoInternetConectionWidget extends StatelessWidget {
  const NoInternetConectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.wifi_off, color: Colors.red, size: 55),
        Text(
          S.of(context).NoInternetConnection,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            S.of(context).Pleasecheckyourinternetsettingsandtryagain,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
