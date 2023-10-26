import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/presentation/widgets/common/button/long_cancel_button.dart';
import 'package:timesheet/presentation/widgets/common/nav_icon.dart';
import 'package:timesheet/presentation/widgets/timesheet/issue_item.dart';
import 'package:timesheet/provider_container.dart';

class SelectIssuePage extends ConsumerStatefulWidget {
  const SelectIssuePage({super.key, required this.selectIssueModels, required this.fnCallBack});

  final List<SelectIssueEntity> selectIssueModels;
  final void Function() fnCallBack;

  @override
  ConsumerState<SelectIssuePage> createState() => _SelectIssuePageState();
}

class _SelectIssuePageState extends ConsumerState<SelectIssuePage> {
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
              itemCount: widget.selectIssueModels.length,
              itemBuilder: (context, index) => IssueItem(
                selectIssueEntity: widget.selectIssueModels[index],
                onTap: (SelectIssueEntity entity) {
                  ref.read(taskProvider.notifier).setSelectedIssueEntity(entity);
                  Navigator.of(context).pop();
                  widget.fnCallBack();
                },
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
