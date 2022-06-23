import 'dart:math';

import 'package:fake_train_api/src/models/models.dart';
import 'package:fake_train_api/src/utils/utils.dart';
import 'package:uuid/uuid.dart';

class TrainGenerator {
  TrainGenerator(this.startPoint, this.endPoint, this.baseDate);

  final String startPoint;
  final String endPoint;
  DateTime baseDate;

  List<Train> generate(final int quantity) {
    final random = Random();
    final journeyGenerator = JourneyGenerator(startPoint, endPoint, baseDate);

    return List.generate(quantity, (int index) {
      baseDate = baseDate.add(Duration(minutes: random.nextInt(15) + 15));

      journeyGenerator.baseDate = baseDate;

      return Train(
        id: const Uuid().v4(),
        number: random.nextInt(700) + 100,
        trainCategory: TrainCategoryGenerator.random(),
        carrier: _carriers[random.nextInt(_carriers.length)],
        journeyDate: baseDate,
        journey: journeyGenerator.generate(random.nextInt(10) + 2),
        delay: Delay(
          delay: random.nextInt(7),
          wasExpected: random.nextBool(),
        ),
      );
    });
  }

  final List<Carrier> _carriers = [
    const Carrier(
      fullName: 'České Dráhy',
      shortName: 'ČD',
      url:
          'https://yt3.ggpht.com/ytc/AKedOLSiI42AVJLogC2M1rFw_eBJfWnZP10mOmmPmoCP8w=s900-c-k-c0x00ffffff-no-rj',
    ),
    const Carrier(
      fullName: 'ZSSK',
      shortName: 'ZSSK',
      url:
          'https://play-lh.googleusercontent.com/T6Bn81JH_G0vSZHonFwNZKLMNs440PE_1Am5qJH-zw2BI3vJtEkb6cZ5iBCu1zmfo9k9',
    ),
    const Carrier(
      fullName: 'RegioJet',
      shortName: 'RJ',
      url:
          'https://play-lh.googleusercontent.com/gXMTIJ0CAnQ395b8ituTtGidnTTdQBIC6gIqojgePX-q-R-BK5CS72pIYudZcPnWHf0',
    ),
  ];
}

extension TrainCategoryGenerator on TrainCategory {
  static TrainCategory random() {
    final random = Random();
    final categoryIndex = random.nextInt(TrainCategory.values.length - 1);
    return TrainCategory.values[categoryIndex];
  }
}
