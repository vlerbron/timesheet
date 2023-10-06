import 'package:flutter/material.dart';
import 'package:timesheet/utils/const.dart';

class CircleGreyClosePageButton extends StatelessWidget {
  const CircleGreyClosePageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 10),
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: kColorDarkGrey,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(2.5),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          size: 14,
        ),
      ),
    );
  }
}
