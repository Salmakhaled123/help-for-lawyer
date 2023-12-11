import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_lawyer/cubits/home_cubit/home_cubit.dart';
import 'package:help_lawyer/models/task_model.dart';
import 'package:help_lawyer/views/lawyer_name/custom_button.dart';
import 'package:help_lawyer/views/lawyer_name/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  DateTime? date ;
  bool dateError = false ;

  @override
  Widget build(BuildContext context) {
    String? title, description;


    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32,),
          CustomTextFormField(
              hintText: 'Title',
              obscureText: false,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Title required';
                }
                return null;
              },
              onSaved: (value) {
                title = value;
              },
              type: TextInputType.text),
          SizedBox(height: 15,),
          CustomTextFormField(
            hintText: 'Description',
            obscureText: false,
            maxLines: 5,
            type: TextInputType.text,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Description required';
              }
              return null;
            },
            onSaved: (value) {
              description = value;
            },
          ),
          SizedBox(height: 32,),
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return CustomButton(
                      isLoading: state is AddTaskLoading ? true : false,
                      text: 'Add Task',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          var currentDate = DateTime.now();
                          var formattedCurrentDate = DateFormat.yMd().format(currentDate);
                          var taskModel = TaskModel(
                            title: title!,
                            discription: description!,
                            date: formattedCurrentDate,
                          );
                          BlocProvider.of<HomeCubit>(context).addTask(taskModel);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {

                          });
                        }
                      }
                  );
                },
              )
          ),
          SizedBox(height: 15,)
        ],
      ),

    );
  }
  void chooseDateForToDo() async {
    var choosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    setState(() {
      date = choosenDate;
      if (date != null) {
        dateError = false;
      }
    });
  }
}
