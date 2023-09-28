import 'package:flutter/material.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/widgets/common/save_button.dart';
import 'package:timesheet/widgets/common/short_cancel_button.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New task'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Date'),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? ''
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(
                            Icons.calendar_month,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                color: Color.fromARGB(127, 0, 0, 0),
                thickness: 1,
              ),
              const SizedBox(height: 300),
              const Divider(
                color: Color.fromARGB(127, 0, 0, 0),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ShortCancelButton(onTap: () => Navigator.pop(context)),
                    const SizedBox(width: 5),
                    SaveButton(
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
