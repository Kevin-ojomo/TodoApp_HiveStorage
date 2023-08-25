import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_localstorage/widgets/mybutton.dart';

class DIalogBox extends StatelessWidget {
  final VoidCallback onsaved;
  final VoidCallback oncancel;
  final TextEditingController controller;
  const DIalogBox({Key? key, required this.onsaved, required this.oncancel, required this.controller}) : super(key: key);

  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Add a To Do"),
      actions: [
        Container(
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(hintText: "New ToDO?", focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
              ),
              Row(
                children: [
                  MyButton(
                    text: "save",
                    onpressed: onsaved,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MyButton(
                    text: "Close",
                    onpressed: oncancel,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
