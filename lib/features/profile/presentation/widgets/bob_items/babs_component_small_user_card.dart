import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';

class SmallUserCard extends StatelessWidget {
  final Color? cardColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final VoidCallback? onTap;
  final String? userName;
  final Widget? userMoreInfo;
  final ImageProvider userProfilePic;

  const SmallUserCard({super.key,
    required this.cardColor,
    this.cardRadius = 30,
    required this.userName,
    this.backgroundMotifColor = Colors.white,
    this.userMoreInfo,
    required this.userProfilePic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: mediaQueryHeight / 6,
        margin: const EdgeInsets.only(bottom: Sizes.lg),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius:
              BorderRadius.circular(double.parse(cardRadius!.toString())),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: backgroundMotifColor!.withOpacity(.1),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 400,
                backgroundColor: backgroundMotifColor!.withOpacity(.05),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(Sizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: mediaQueryHeight / 18,
                          backgroundImage: userProfilePic,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userName!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: AppColors.white,
                              ),
                            ),
                            if (userMoreInfo != null) ...[
                              userMoreInfo!,
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
