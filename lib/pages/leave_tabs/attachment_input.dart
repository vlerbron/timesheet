import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_previewer/file_previewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/providers/leave_request_provider.dart';

class AttachmentInput extends ConsumerWidget {
  const AttachmentInput(
      {super.key, required this.title, required this.filePreviews});

  final String title;
  final List<Widget> filePreviews;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          visible: filePreviews.isNotEmpty,
          child: SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: filePreviews.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  var preview = filePreviews[index];
                  return Container(
                    margin: const EdgeInsets.all(4),
                    width: 70,
                    height: 70,
                    child: preview,
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
      try {
        final thumbnail = await FilePreview.getThumbnail(file.path);
        filePreviews.add(thumbnail);
      } catch (e) {
        filePreviews.add(Image.asset(""));
      }
      ref.read(leaveRequestProvider.notifier).onAddAttachment(file);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select file'),
      ));
    }
  }
}
