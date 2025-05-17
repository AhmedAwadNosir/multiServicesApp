import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/functions/get_user_data.dart';
import 'package:multiservices_app/generated/l10n.dart';

class UserDataAppBarr extends StatelessWidget {
  const UserDataAppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(),
      builder: (context, snapshot) {
        return Row(
          children: [
            CircleAvatar(
              radius: 29,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      snapshot.data?.profilImageLink ?? "",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "${S.of(context).Hi}${snapshot.data?.userName ?? ""}😎",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.settings,
                size: 33,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
