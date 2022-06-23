import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:tickets_api/src/database/database.dart';
import 'package:tickets_api/src/models/models.dart';

part 'ticket_database.g.dart';

@Database(version: 1, entities: [Ticket])
abstract class TicketDatabase extends FloorDatabase {
  TicketDao get ticketDao;
}
