import 'package:flutter/material.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/validators_and_helpers/date_time_formatter.dart';
import 'package:quizdent/features/home/domain/entities/event_entity.dart';
import 'package:quizdent/features/home/presentation/widgets/event_time_bar.dart';

class EventWidget extends StatelessWidget {
  final EventEntity eventEntity;
  const EventWidget({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    const double widgetHeight = 220;
    const double borderRadius = 5;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.kEventScreen,arguments: eventEntity);
      },
      child: Container(
        width: double.infinity,
        height: widgetHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: Column(
          children: [
            Hero(
              //todo: add event id existed in the event entity to the hero tag
              tag: 'event_photo_${eventEntity.id}',
              child: Container(
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
                        Text(eventEntity.date.day.toString(),style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 21, color: Colors.redAccent)),
                        Text(DateTimeFormatter.getMonthName(eventEntity.date), style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(eventEntity.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,fontSize: 18, overflow: TextOverflow.ellipsis),maxLines: 2,),
                        Text(eventEntity.subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54,fontSize: 15, overflow: TextOverflow.ellipsis),maxLines: 1,),
                        const Spacer(),
                        EventTimeBar(dateTime: eventEntity.date)

                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
