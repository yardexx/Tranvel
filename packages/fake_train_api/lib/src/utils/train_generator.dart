import 'dart:math';

import 'package:fake_train_api/src/models/models.dart';
import 'package:fake_train_api/src/utils/utils.dart';

class TrainGenerator {

  TrainGenerator(this.startPoint, this.endPoint, this.baseDate);
  final String startPoint;
  final String endPoint;
  final DateTime baseDate;

  List<Train> generate(final int quantity) {
    final random = Random();
    final journeyGenerator =
        JourneyGenerator(startPoint, endPoint, baseDate);

    return List.generate(
      quantity,
      (_) => Train(
        number: random.nextInt(700),
        trainCategory: TrainCategoryGenerator.random(),
        carrier: _carriers[random.nextInt(_carriers.length - 1)],
        journeyDate: baseDate,
        journey: journeyGenerator.generate(random.nextInt(10) + 2),
        delay: Delay(
          delay: random.nextInt(15),
          wasExpected: random.nextBool(),
        ),
      ),
    );
  }

  final List<Carrier> _carriers = [
    const Carrier(fullName: 'České Dráhy', shortName: 'ČD'),
    const Carrier(
        fullName: 'Železničná spoločnosť Slovensko', shortName: 'ZSSK',),
    const Carrier(fullName: 'RegioJet', shortName: 'RJ'),
  ];
}

extension TrainCategoryGenerator on TrainCategory {
  static TrainCategory random() {
    final random = Random();
    final categoryIndex = random.nextInt(TrainCategory.values.length - 1);
    return TrainCategory.values[categoryIndex];
  }
}
