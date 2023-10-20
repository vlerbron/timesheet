import 'package:flutter/material.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/widgets/name_avatar.dart';

class LeaveDetailItem extends StatelessWidget {
  const LeaveDetailItem({
    super.key,
    required this.leave,
  });

  final Leave leave;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NameAvatar(
            text: leave.employee!.avatarText,
            backgroundColor: leaveTypesColor[leave.leaveType]!,
            textColor: Colors.white),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 4, bottom: 8, top: 8),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: kColorMidtGrey,
              )),
            ),
            child: Text(
              '${leave.employee!.firstName}${leave.employee!.lastName == null ? '' : ' ${leave.employee!.lastName}'}',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: kColorDarkGrey),
            ),
          ),
        )
      ],
    );
  }
}
