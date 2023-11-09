import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timesheet/presentation/utils/const.dart';
import 'package:timesheet/presentation/widgets/common/bottom_buttons_bar.dart';
import 'package:timesheet/presentation/widgets/common/custom_appbar.dart';
import 'package:timesheet/presentation/widgets/common/name_avatar.dart';
import 'package:timesheet/provider_container.dart';

class EditAccountPage extends ConsumerStatefulWidget {
  const EditAccountPage({
    super.key,
  });

  @override
  ConsumerState<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends ConsumerState<EditAccountPage> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final myAccount = ref.read(myAccountProvider);
    controller.text = myAccount.nickname;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myAccount = ref.watch(myAccountProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Edit Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myAccount.imageUrl != null
                  ? Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: FadeInImage(
                        placeholder: const AssetImage(
                            'assets/images/unknown_person.jpg'),
                        image: NetworkImage(
                          myAccount.imageUrl!,
                        ),
                        fit: BoxFit.cover,
                        height: 155,
                        width: 155,
                      ),
                    )
                  : NameAvatar(
                      text: myAccount.avatarText,
                      backgroundColor: const Color.fromARGB(255, 207, 228, 250),
                      textColor: const Color.fromARGB(255, 15, 84, 140),
                      size: 155,
                    ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              focusNode: focusNode,
              controller: controller,
              validator: (val) {
                if (val == '') {
                  return 'Please fill in';
                }
                return null;
              },
              maxLines: 1,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kColorMidtGrey),
                  ),
                  border: OutlineInputBorder()),
              onTapOutside: (event) {
                focusNode.unfocus();
              },
            ),
          ),
          const Spacer(),
          BottomButtonBar(
              onCancel: () => Navigator.of(context).pop(),
              onSave: () {
                if (_formKey.currentState!.validate()) {
                  //TODO: relace with api to update image and nickname
                  ref.watch(myAccountProvider.notifier).onSaveEditAccount(
                      controller.text, myAccount.imageUrl ?? '');
                  Navigator.of(context).pop();
                }
              })
        ]),
      ),
    );
  }
}
