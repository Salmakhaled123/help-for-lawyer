import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_lawyer/cubits/task_cubit/task_cubit.dart';
import 'package:help_lawyer/views/home/add_task_bottom_sheet.dart';
import 'package:help_lawyer/views/home/my_drawer.dart';
import 'package:help_lawyer/views/home/tasks_list.dart';
import 'header_calender.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<TaskCubit>(context).fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddTaskBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'My lawsuits',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body:  Column(
        children: [
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {

              });
            },

          ),
          Expanded(child: TasksList()),
        ],
      ),
    );
  }
}
