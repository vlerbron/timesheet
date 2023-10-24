import 'package:flutter/material.dart';
import 'package:timesheet/presentation/utils/const.dart';

class DateInput extends StatefulWidget {
  const DateInput(
      {super.key,
      required this.title,
      required this.controller,
      required this.initDate,
      required this.onSelectedDate,
      required this.validator});

  final String title;
  final DateTime initDate;
  final void Function(DateTime) onSelectedDate;
  final String? Function(String?) validator;
  final TextEditingController controller;
  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = widget.initDate;
    widget.controller.text = dateFormatterddMMyyyy.format(selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Row(
            children: [
              Text(
                widget.title,
              ),
              const Text(
                '*',
                style: kRequiredTextStyle,
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              textAlign: TextAlign.right,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    size: 16,
                  ),
                  onPressed: () async {
                    selectedDate = await _presentDatePicker();
                    widget.controller.text =
                        dateFormatterddMMyyyy.format(selectedDate);
                    widget.onSelectedDate(selectedDate);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      const Divider(),
    ]);
  }

  Future<DateTime> _presentDatePicker() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: widget.initDate,
        firstDate: DateTime(widget.initDate.year - 5, widget.initDate.month,
            widget.initDate.day),
        lastDate: DateTime(widget.initDate.year + 5, widget.initDate.month,
            widget.initDate.day));

    return date ?? selectedDate;
  }
}
