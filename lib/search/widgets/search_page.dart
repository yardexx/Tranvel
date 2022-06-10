import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trainvel/result/cubit/trip_catalog_cubit.dart';
import 'package:trainvel/result/result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static Route<String> route() =>
      MaterialPageRoute(builder: (_) => const SearchPage._());

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  DateTime _lastDate = DateTime.now();
  TimeOfDay _lastTime = TimeOfDay.now();

  String get _start => _startController.text;

  String get _destination => _destinationController.text;

  String get _date => DateFormat.yMd().format(_lastDate);

  String get _time => _lastTime.format(context);

  Future<void> _selectDate() async {
    final newDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: _lastDate,
        lastDate: DateTime.now().add(const Duration(days: 365)),
        fieldHintText: 'When do you want to travel?',);

    if (newDate != null) {
      setState(
        () {
          _lastDate = newDate.withTime(
            hour: _lastTime.hour,
            minute: _lastTime.minute,
          );
          _dateController.text = _date;
        },
      );
    }
  }

  Future<void> _selectTime() async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null) {
      _lastTime = newTime;
      _timeController.text = _time;
    }
  }

  @override
  void dispose() {
    _startController.dispose();
    _destinationController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _dateController.text = _date;
    _timeController.text = _time;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainvel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Where do you want to go?',
              style: theme.textTheme.headline5,
            ),
            TextField(
              controller: _startController,
              decoration: const InputDecoration(
                icon: Icon(Icons.place_outlined),
                labelText: 'From',
                hintText: 'Bratislava',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _destinationController,
              decoration: const InputDecoration(
                icon: Icon(Icons.place_outlined),
                labelText: 'To',
                hintText: 'Brno',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today_outlined),
                      labelText: 'Date',
                    ),
                    onTap: _selectDate,
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: TextField(
                    controller: _timeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.schedule_outlined),
                      labelText: 'Time',
                    ),
                    onTap: _selectTime,
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: () {
                    context
                        .read<TripCatalogCubit>()
                        .fetchCatalog(_start, _destination, _lastDate);
                    Navigator.of(context).push(ResultPage.route());
                  },
                  label: const Text('Search'),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  DateTime withTime({int hour = 0, int minute = 0}) =>
      DateTime(year, month, day, hour, minute);
}
