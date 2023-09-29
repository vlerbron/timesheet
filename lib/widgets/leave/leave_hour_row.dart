import 'package:flutter/material.dart';
import 'package:timesheet/models/leave_model.dart';
import 'package:timesheet/widgets/name_avatar.dart';

class LeaveHourRow extends StatelessWidget {
  const LeaveHourRow(
      {super.key,
      required this.leaveHours,
      required this.leaves,
      required this.currentDate});

  final LeaveHours leaveHours;
  final List<Leave> leaves;
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
                _getLeaveHourDisplayText(leaveHours),
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

  String _getLeaveHourDisplayText(LeaveHours leaveHours) {
    String leaveHourDisplayText;
    if (leaveHours == LeaveHours.allday) {
      leaveHourDisplayText = '${leaveHours.name[0].toUpperCase()}'
          '${leaveHours.name.substring(1, 3)} '
          '${leaveHours.name.substring(3)} ';
    } else {
      leaveHourDisplayText =
          leaveHours.name[0].toUpperCase() + leaveHours.name.substring(1);
    }

    return leaveHourDisplayText;
  }

  List<Widget> _getDisplayAvatar(List<Leave> leaves) {
    List<Widget> displayAvatar = [];
    for (Leave leave in leaves) {
      if (displayAvatar.length == 5) {
        displayAvatar.add(
          NameAvatar(
            text: '+${leaves.length - 5}',
            backgroundColor: Colors.white,
            textColor: const Color.fromARGB(255, 128, 128, 128),
          ),
        );
        break;
      } else {
        displayAvatar.add(
          NameAvatar(
            text: leave.employee.avatarText,
            backgroundColor: leaveTypesColor[leave.leaveType]!,
            textColor: Colors.white,
          ),
        );
      }
    }
    return displayAvatar;
  }
}
