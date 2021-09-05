import 'package:flutter/material.dart';
import 'package:mobigic_test_flutter/app/home/controller/home_page_controller.dart';
import 'package:mobigic_test_flutter/app/utils/string_constants.dart';

class UserSearchWidget extends StatelessWidget {
  const UserSearchWidget({
    Key? key,
    required HomePageController mHomePageController,
  })  : _mHomePageController = mHomePageController,
        super(key: key);

  final HomePageController _mHomePageController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
            maxLength: 1,//_mHomePageController.getMaxLengthForInput() ?? 1,
            textCapitalization: TextCapitalization.characters,
            onChanged: (value) {
              _mHomePageController.searchInput.value = value;
            },
            obscureText: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              labelText: kTxtSearchForCharacterFromMatrix,
              hintText: kTxtSearchForCharacterFromMatrix,
            ),
          
      ),
    );
  }
}