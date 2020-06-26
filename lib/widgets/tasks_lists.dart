import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/widgets/tasks_tiles.dart';
import 'package:provider/provider.dart';
import 'package:flutterstatemanagement/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskadata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskadata.tasks[index];
            return TaskTile(
              taskTitle: taskadata.tasks[index].name,
              isChecked: taskadata.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                taskadata.updateTask(task);
              },
              longPressCallback: () {
                taskadata.deleteTask(task);
              },
            );
          },
          itemCount: taskadata.taskCount,
        );
      },
    );
  }
}
