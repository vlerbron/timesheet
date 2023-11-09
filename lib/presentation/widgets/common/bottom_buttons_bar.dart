import 'package:flutter/material.dart';
import 'package:timesheet/presentation/widgets/common/button/save_button.dart';
import 'package:timesheet/presentation/widgets/common/button/short_cancel_button.dart';

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  final void Function() onCancel;
  final void Function() onSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          const Divider(),
          Row(
            children: [
              const Spacer(),
              ShortCancelButton(
                onTap: onCancel,
              ),
              const Spacer(),
              SaveButton(onTap: onSave),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
