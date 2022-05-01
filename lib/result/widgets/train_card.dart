import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainvel/result/models/models.dart';
import 'package:trainvel/result/widgets/widgets.dart';

class TrainCard extends StatelessWidget {
  final Train train;

  const TrainCard({required this.train, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          width: 2.0,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(
                  text: dateFormat.toDate(train.journeyDate),
                  icon: Icons.calendar_today_outlined,
                ),
                IconText(
                  text: dateFormat.toTime(
                    train.journeyLength(train.journey.last.arrival,
                        train.journey.first.departure),
                  ),
                  icon: Icons.schedule,
                ),
              ],
            ),
            const Divider(thickness: 2.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: Colors.grey.shade400,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16.0,
                    child: Text(
                      'EC',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text('${train.number} - ${train.name}'),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(
                  text: train.journey.first.name,
                  icon: Icons.place_outlined,
                ),
                Text(dateFormat.toTime(train.journey.first.departure)),
              ],
            ),
            const Icon(Icons.more_vert),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(
                  text: train.journey.last.name,
                  icon: Icons.place_outlined,
                ),
                Text(dateFormat.toTime(train.journey.last.arrival)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on DateFormat {
  String toTime(DateTime time) {
    return DateFormat.Hm().format(time);
  }

  String toDate(DateTime date) {
    if (DateTime.now().day == date.day) {
      return 'Today';
    }
    return DateFormat.Md().format(date);
  }
}
