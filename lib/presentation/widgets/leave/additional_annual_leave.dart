import 'package:flutter/material.dart';
import 'package:timesheet/domain/leave/leave_quota_entity.dart';

import 'package:timesheet/presentation/utils/const.dart';

class AdditionalAnnualLeaveBox extends StatelessWidget {
  const AdditionalAnnualLeaveBox({
    super.key,
    this.additionalAnnualLeaves,
  });
  final List<AdditionalAnnualLeave>? additionalAnnualLeaves;

  @override
  Widget build(BuildContext context) {
    return additionalAnnualLeaves != null
        ? Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                      blurRadius: 0),
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.14),
                      spreadRadius: 0,
                      offset: Offset(0, 1),
                      blurRadius: 2),
                ]),
            child: Column(
              children: [
                for (var additionalAnnualLeave in additionalAnnualLeaves!)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Text(
                          additionalAnnualLeave.details,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: kColorGreyText,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .fontSize),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              '${additionalAnnualLeave.numberOfDays}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: kColorGreyText,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Days',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: kColorGreyText,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ],
            ),
          )
        : Container();
  }
}
