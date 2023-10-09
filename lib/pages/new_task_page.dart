import 'package:flutter/material.dart';
import 'package:timesheet/data/dummy_select_issue.dart';
import 'package:timesheet/models/task_model.dart';
import 'package:timesheet/pages/select_issue_page.dart';
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

  //int _selectHours = 1;

  DateTime? _selectedDate;

  void _save() {}

  void _issue() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              SelectIssuePage(selectIssueModels: dummySelectIssue)),
    );
  }

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
                      style: kRequiredTextStyle,
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
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Date'),
                    const Text(
                      '*',
                      style: kRequiredTextStyle,
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
                Row(children: [
                  const Text('Usage time'),
                  const Text(
                    '*',
                    style: kRequiredTextStyle,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0))),
                        const Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'HH',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(':'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                hintText: 'MM',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 200),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cancel Button
                    ShortCancelButton(onTap: () => Navigator.pop(context)),
                    const SizedBox(width: 15),
                    // Save Button
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
