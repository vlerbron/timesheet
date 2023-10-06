import 'package:flutter/material.dart';
import 'package:timesheet/utils/const.dart';

class DetailInput extends StatefulWidget {
  const DetailInput(
      {super.key,
      required this.title,
      required this.onSubmitted,
      required this.validator});

  final String title;
  final void Function(String) onSubmitted;
  final String? Function(String?) validator;

  @override
  State<DetailInput> createState() => _DetailInputState();
}

class _DetailInputState extends State<DetailInput> {
  @override
  void dispose() {
    controller.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  final controller = TextEditingController();
  final textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            focusNode: textFieldFocusNode,
            controller: controller,
            validator: widget.validator,
            maxLines: 3,
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kColorLightGrey),
                ),
                border: OutlineInputBorder()),
            onTapOutside: (event) {
              textFieldFocusNode.unfocus();
              widget.onSubmitted(controller.text);
            },
          ),
        ],
      ),
    );
  }
}
