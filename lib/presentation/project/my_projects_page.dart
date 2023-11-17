import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/domain/entities/project/project_entity.dart';
import 'package:timesheet/presentation/routes/route.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/common/button/floating_add_button.dart';
import 'package:timesheet/presentation/widgets/common/tabs.dart';
import 'package:timesheet/presentation/widgets/project/project_item.dart';
import 'package:timesheet/provider_container.dart';

class MyProjectsPage extends ConsumerStatefulWidget {
  const MyProjectsPage({super.key});

  @override
  ConsumerState<MyProjectsPage> createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends ConsumerState<MyProjectsPage> {
  late List<ProjectEntity> _projectList;
  final _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _projectList = ref.watch(projectProvider);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Project',
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
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
                    hintText: 'Project code, project name, or client code',
                    hintStyle:
                        textTheme.bodyMedium!.copyWith(color: kColorDarkGrey),
                    suffixIcon: IconButton(
                      icon: Image.asset('assets/icons/icon-close.png'),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _projectList = ref.watch(projectProvider);
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(kWidgetCircularRadius),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _projectList = ref
                          .read(projectProvider.notifier)
                          .filterProjectList(val);
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _projectList.length,
                  itemBuilder: (context, index) => ProjectItem(
                    projectEntity: _projectList[index],
                    onTap: (ProjectEntity entity) {
                      Navigator.of(context)
                          .pushNamed(Routes.projectPage, arguments: entity);
                    },
                  ),
                ),
              ),
            ],
          ),
          FloatingAddButton(onPressed: () {
            //Navigator.of(context).pushNamed(Routes.newEditTaskPage);
          }),
        ],
      ),
      bottomNavigationBar: const Tabs(selectedIndex: 2),
    );
  }
}
