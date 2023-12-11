  import 'package:flutter/material.dart';
import 'package:help_lawyer/models/task_model.dart';

class TaskItem extends StatelessWidget {
    const TaskItem({super.key, required this.task});
    final TaskModel task ;
    @override
    Widget build(BuildContext context) {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration:BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ) ,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:  Text(task.title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                subtitle:  Text(task.discription,style: TextStyle(color: Colors.white),),
                trailing: IconButton(onPressed: (){},color: Colors.white,icon: Icon(Icons.delete),),
              ),
               Text(task.date,style: TextStyle(color: Colors.white),),
            ],
          ) ,
        ),
      );
    }
  }
