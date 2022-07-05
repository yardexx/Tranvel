import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainvel/result/models/models.dart';
import 'package:trainvel/result/widgets/widgets.dart';

class TrainCard extends StatelessWidget {
  const TrainCard({required this.train, super.key});

  final Train train;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat();

    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return BuySheetWidget(
              train: train,
            );
          },
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                      train.journeyLength(
                        train.journey.last.arrival,
                        train.journey.first.departure,
                      ),
                    ),
                    icon: Icons.schedule,
                  ),
                ],
              ),
              const Divider(thickness: 2),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  TrainChip(
                    trailingText: train.number.toString(),
                    leading: Text(
                      train.category,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  TrainChip(
                    trailingText: train.carrier.fullName,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(train.carrier.url),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
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
