import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HeaderCalender extends StatefulWidget {
  const HeaderCalender({
    super.key,
  });

  @override
  State<HeaderCalender> createState() => _HeaderCalenderState();
}

class _HeaderCalenderState extends State<HeaderCalender> {

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(

      headerStyle: HeaderStyle(
        formatButtonVisible: false,
      ),
      weekendDays: [],
      focusedDay: DateTime.now(),
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(Duration(days: 30)),
      calendarFormat: CalendarFormat.week,
      headerVisible: true,
      calendarStyle: CalendarStyle(
        selectedTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        selectedDecoration:  BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        defaultDecoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(8),
        ),
        defaultTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        isTodayHighlighted: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {

        _focusedDay = focusedDay;
      },

    );
  }
}
