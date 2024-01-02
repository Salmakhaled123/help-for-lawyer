import 'package:hive_flutter/hive_flutter.dart';

const kTasksBox = 'tasks';
const nameBox = 'lawyer';
final box = Hive.box<String>(nameBox);
final String? name = box.get('lawyerName');
