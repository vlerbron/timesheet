import 'package:flutter/material.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/widgets/common/save_button.dart';
import 'package:timesheet/widgets/common/short_cancel_button.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTaskPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> listOfValue = ['1', '2'];

  int _selectHours = 1;

  DateTime? _selectedDate;

  void _save() {}

  void _issue() {}

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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('Project code'),
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(),
                Row(
                  children: [
                    const Text('Issue'),
                    const Text(
                      '*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: _issue,
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      'Task details',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text('Date'),
                    const Text(
                      '*',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
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
                const Divider(),
                const SizedBox(height: 20),
                const Row(children: [
                  Text('Usage time'),
                  Text(
                    '*',
                    style: kRequiredTextStyle,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       DropdownButtonFormField(
                  //           items: [
                  //             for (final hour in listOfValue)
                  //               DropdownMenuItem(
                  //                 value: hour,
                  //                 child: Text(hour),
                  //               )
                  //           ],
                  //           onChanged: (value) {
                  //             setState(() {
                  //               _selectHours = value! as int;
                  //             });
                  //           })
                  //     ],
                  //   ),
                  // ),
                ]),
                const SizedBox(height: 300),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShortCancelButton(onTap: () => Navigator.pop(context)),
                    const SizedBox(width: 15),
                    SaveButton(
                      onTap: _save,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
