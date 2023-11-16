import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/timesheet/select_issue_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/common/button/long_cancel_button.dart';
import 'package:timesheet/presentation/widgets/timesheet/issue_item.dart';
import 'package:timesheet/provider_container.dart';

class SelectIssuePage extends ConsumerStatefulWidget {
  const SelectIssuePage({super.key, required this.fnCallBack});

  final void Function() fnCallBack;

  @override
  ConsumerState<SelectIssuePage> createState() => _SelectIssuePageState();
}

class _SelectIssuePageState extends ConsumerState<SelectIssuePage> {
  late List<SelectIssueEntity> _selectIssues;
  final _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectIssues = ref.watch(selectIssueProvider);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

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
              controller: _searchController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorScheme.secondary,
                hintText:
                    'Search from title, issue no, project code, client code',
                hintStyle:
                    textTheme.bodyMedium!.copyWith(color: kColorDarkGrey),
                suffixIcon: IconButton(
                  icon: Image.asset('assets/icons/icon-close.png'),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _selectIssues = ref.watch(selectIssueProvider);
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kWidgetCircularRadius),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (val) {
                setState(() {
                  _selectIssues = ref
                      .read(selectIssueProvider.notifier)
                      .filterSelectIssues(val);
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectIssues.length,
              itemBuilder: (context, index) => IssueItem(
                selectIssueEntity: _selectIssues[index],
                onTap: (SelectIssueEntity entity) {
                  ref
                      .read(taskProvider.notifier)
                      .setSelectedIssueEntity(entity);
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
