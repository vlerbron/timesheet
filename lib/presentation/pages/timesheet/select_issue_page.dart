import 'package:flutter/material.dart';
import 'package:timesheet/models/select_issue_model.dart';
import 'package:timesheet/presentation/widgets/timesheet/issue_item.dart';
import 'package:timesheet/widgets/common/long_cancel_button.dart';
import 'package:timesheet/widgets/nav_icon.dart';

class SelectIssuePage extends StatelessWidget {
  const SelectIssuePage({super.key, required this.selectIssueModels});

  final List<SelectIssueModel> selectIssueModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Issue',
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              autofocus: false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 240, 240, 240),
                hintText:
                    'Search from title, issue no, project code, client code',
                suffixIcon: const NavIcon('icon-close.png'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectIssueModels.length,
              itemBuilder: (context, index) => IssueItem(
                selectIssueModel: selectIssueModels[index],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 16),
          Center(
            child: LongCancelButton(
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
