import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test_flutter/app/utils/app_constants.dart';
import 'package:mobigic_test_flutter/app/utils/string_constants.dart';
import 'package:mobigic_test_flutter/app/utils/text_styles.dart';
import 'package:mobigic_test_flutter/home_page_controller.dart';

// ignore: must_be_immutable
class HomePageV2 extends StatelessWidget {
  // const HomePageV2({ Key? key }) : super(key: key);

  HomePageController _mHomePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.kAppBarTitle),
      ),
      body: SafeArea(
          child: Container(
        width: Get.size.width,
        height: Get.size.height,
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: const Text(
                kTxtEnterMatrixValue,
                style: TextStyles.kTextH1BlackBold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  InputMatrixWidget(
                    labelText: kTxtRow,
                    hintText: kTxtEnterRowCount,
                    onTextChanged: (value) {
                      _mHomePageController.rowCount.value = int.parse(value);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'x',
                    style: TextStyles.kTextH4BlackBold,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InputMatrixWidget(
                    labelText: kTxtColumn,
                    hintText: kTxtEnterColumnCount,
                    onTextChanged: (value) {
                      _mHomePageController.columnCount.value = int.parse(value);
                    },
                  ),
                ],
              ),
            ),

            /// User input text for matrix
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: UserInputTextWidget(
                  mHomePageController: _mHomePageController),
            ),

            /// user search input
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child:
                  UserSearchWidget(mHomePageController: _mHomePageController),
            ),

            const SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(
                  () => Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _mHomePageController.getMaxLengthForInput(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      crossAxisCount: _mHomePageController.columnCount.value == 0 ? 1 : _mHomePageController.columnCount.value,
                      childAspectRatio: _mHomePageController.getChildAspectRatio(
                          Get.size.width, Get.size.height, kToolbarHeight),
                    ),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Obx(()=>Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: _mHomePageController.getCharacter(index) == _mHomePageController.searchInput.value
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: Center(
                            child: Obx(()=>Text(
                              _mHomePageController.getCharacter(index),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),),
                            ),
                          ),
                        ),),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

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

class InputMatrixWidget extends StatelessWidget {
  const InputMatrixWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onTextChanged,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          onTextChanged(value);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}
