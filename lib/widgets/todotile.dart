import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final Function(bool?) onChanged;
  final bool taskCompleted;
  final String taskName;
  final void Function(BuildContext)? onPressed;
  const TodoTile({Key? key, required this.taskCompleted, required this.taskName, required this.onChanged, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: onPressed,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(8),
            icon: Icons.delete_forever,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              SizedBox(
                width: 10,
              ),
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
