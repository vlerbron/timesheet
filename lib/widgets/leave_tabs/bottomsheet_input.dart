import 'package:flutter/material.dart';
import 'package:timesheet/utils/const.dart';
import 'package:timesheet/widgets/common/circle_grey_closepage_button.dart';

class BottomSheetInput extends StatelessWidget {
  const BottomSheetInput(
      {super.key,
      required this.items,
      required this.title,
      required this.controller,
      required this.validator});

  final List<Widget> items;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Text(
                  title,
                ),
                const Text(
                  '*',
                  style: kRequiredTextStyle,
                )
              ],
            ),
            const Spacer(),
            Expanded(
              child: TextFormField(
                controller: controller,
                validator: validator,
                readOnly: true,
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                    ),
                    onPressed: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: _bottomSheet,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _bottomSheet(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              const CircleGreyClosePageButton(),
            ],
          ),
          const Divider(color: kColorMidtGrey),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}
