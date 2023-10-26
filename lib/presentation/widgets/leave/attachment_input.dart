import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/provider_container.dart';
import 'package:timesheet/presentation/widgets/leave/remove_photo.dart';

class AttachmentInput extends ConsumerWidget {
  const AttachmentInput({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leave = ref.watch(leaveRequestProvider);
    return Column(
      children: [
        Row(children: [
          Text(title),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              iconColor: Theme.of(context).colorScheme.onBackground,
              foregroundColor: Theme.of(context).colorScheme.onBackground,
            ),
            onPressed: () {
              _getFile(context, ref);
            },
            child: const SizedBox(
              width: 70,
              child: Row(
                children: [
                  Text('Upload'),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ]),
        Visibility(
          visible: leave.attachment!.isNotEmpty,
          child: SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: leave.attachment!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  var preview = leave.attachment![index];
                  return Container(
                    margin: const EdgeInsets.all(4),
                    width: 70,
                    height: 70,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  RemovePhoto(child: preview.values.first),
                            ),
                          );
                        },
                        child: preview.values.first),
                  );
                }),
          ),
        ),
        const Divider()
      ],
    );
  }

  _getFile(BuildContext context, WidgetRef ref) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      ref.read(leaveRequestProvider.notifier).onAddAttachment(file);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select file'),
      ));
    }
  }
}
