import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/leave_entity.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/common/name_avatar.dart';

class LeaveHourRow extends StatelessWidget {
  const LeaveHourRow(
      {super.key,
      required this.leaveHours,
      required this.leaves,
      required this.currentDate});

  final LeaveHours leaveHours;
  final List<LeaveEntity> leaves;
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentDate.weekday < 6 && leaves.isNotEmpty, //1 - 5 is Mon-Fri
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                getLeaveHourDisplayText(leaveHours),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: const Color.fromARGB(255, 97, 97, 97)),
              ),
            ),
            Flexible(
                flex: 4,
                child: Row(
                  children: _getDisplayAvatar(leaves),
                )),
          ],
        ),
      ),
    );
  }

  List<Widget> _getDisplayAvatar(List<LeaveEntity> leaves) {
    List<Widget> displayAvatar = [];
    for (LeaveEntity leave in leaves) {
      if (displayAvatar.length == 5) {
        displayAvatar.add(
          NameAvatar(
            text: '+${leaves.length - 5}',
            backgroundColor: Colors.white,
            textColor: kColorDarkGrey,
          ),
        );
        break;
      } else {
        displayAvatar.add(
          NameAvatar(
            text: leave.employee!.avatarText,
            backgroundColor: leaveTypesColor[leave.leaveType]!,
            textColor: Colors.white,
          ),
        );
      }
    }
    return displayAvatar;
  }
}
