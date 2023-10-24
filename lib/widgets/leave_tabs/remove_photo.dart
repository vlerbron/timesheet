import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/widgets/common/button/short_cancel_button.dart';
import 'package:timesheet/providers/leave_request_provider.dart';

class RemovePhoto extends ConsumerWidget {
  const RemovePhoto({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Photo'),
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: child),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                const Spacer(),
                ShortCancelButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(leaveRequestProvider.notifier)
                        .onRemoveAttachment(child);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                    backgroundColor: const Color.fromARGB(255, 245, 69, 81),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Dalete'),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
