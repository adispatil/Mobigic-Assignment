import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test_flutter/app/home/controller/home_page_controller.dart';
import 'package:mobigic_test_flutter/app/utils/string_constants.dart';

class UserInputTextWidget extends StatelessWidget {
  const UserInputTextWidget({
    Key? key,
    required HomePageController mHomePageController,
  })  : _mHomePageController = mHomePageController,
        super(key: key);

  final HomePageController _mHomePageController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => TextField(
          maxLength: _mHomePageController.getMaxLengthForInput() ?? 1,
          textCapitalization: TextCapitalization.characters,
          onChanged: (value) {
            _mHomePageController.userInputText.value = value;
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: kTxtEnterCharactersForMatrix,
            hintText: kTxtEnterCharactersForMatrix,
          ),
        ),
      ),
    );
  }
}