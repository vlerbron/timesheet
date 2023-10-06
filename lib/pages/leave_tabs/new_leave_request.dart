import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/utils/const.dart';

class NewLeaveRequest extends StatefulWidget {
  const NewLeaveRequest({super.key});

  @override
  State<NewLeaveRequest> createState() => _NewLeaveRequestState();
}

class _NewLeaveRequestState extends State<NewLeaveRequest> {
  final formatter = DateFormat('dd/MM/yyyy');
  final DateTime todayDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late DateTime startDate;
  final TextEditingController _startDateController = TextEditingController();

  @override
  void initState() {
    startDate = todayDate;
    _startDateController.text = formatter.format(startDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New request leave',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: kColorDarkGrey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(2.5),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 14,
                )),
          )
        ],
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: kColorLightGrey))),
          child: Row(
            children: [
              const Row(
                children: [
                  Text(
                    'Start date',
                  ),
                  Text(
                    '*',
                    style: kRequiredTextStyle,
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  controller: _startDateController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                      onPressed: () async {
                        startDate = await showDatePicker(
                                context: context,
                                initialDate: todayDate,
                                firstDate: DateTime(todayDate.year - 5,
                                    todayDate.month, todayDate.day),
                                lastDate: DateTime(todayDate.year + 5,
                                    todayDate.month, todayDate.day)) ??
                            todayDate;
                        setState(() {
                          _startDateController.text =
                              formatter.format(startDate);
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
