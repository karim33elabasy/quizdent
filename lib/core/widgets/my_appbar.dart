import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/my_padding.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  final bool? isCenter;
  const MyAppbar({super.key, this.isCenter, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: MyPadding.appBarVerticalSpace,
        horizontal: MyPadding.appBarHorizontalSpace,
      ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: isCenter == null || isCenter == true? TextAlign.center:null,
                maxLines: 1,)
            )
          ],
        )
    );
  }
}
