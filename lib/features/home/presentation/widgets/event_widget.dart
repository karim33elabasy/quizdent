import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';
import 'package:quizdent/features/home/presentation/widgets/event_time_bar.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();
    const double widgetHeight = 220;
    const double borderRadius = 5;
    return Container(
      width: double.infinity,
      height: widgetHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Column(
        children: [
          Container(
            height: widgetHeight*0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderRadius),
                topLeft: Radius.circular(borderRadius),
              ),
              image: DecorationImage(
                image: AssetImage(AppAssets.demoImage),
                fit: BoxFit.fill
              )
            ),
          ),
          Container(
            height: widgetHeight*0.5,
            width: double.infinity,
            padding: const EdgeInsets.all(borderRadius),
            decoration: const BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(borderRadius),
                bottomLeft: Radius.circular(borderRadius),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(dateTime.day.toString(),style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 21, color: Colors.redAccent)),
                      Text(DateTimeFormatter.getMonthName(dateTime), style: Theme.of(context).textTheme.titleLarge,)
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("data"*10, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,fontSize: 18, overflow: TextOverflow.ellipsis),maxLines: 2,),
                      Text("da a"*10, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54,fontSize: 15, overflow: TextOverflow.ellipsis),maxLines: 1,),
                      const Spacer(),
                      EventTimeBar(dateTime: dateTime)

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
