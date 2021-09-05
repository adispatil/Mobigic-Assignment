import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test_flutter/app/home/widgets/input_matrix_widget.dart';
import 'package:mobigic_test_flutter/app/home/widgets/user_input_text_widget.dart';
import 'package:mobigic_test_flutter/app/home/widgets/user_search_widget.dart';
import 'package:mobigic_test_flutter/app/utils/app_constants.dart';
import 'package:mobigic_test_flutter/app/utils/string_constants.dart';
import 'package:mobigic_test_flutter/app/utils/text_styles.dart';
import 'package:mobigic_test_flutter/app/home/controller/home_page_controller.dart';

// ignore: must_be_immutable
class HomePageV2 extends StatelessWidget {
  HomePageV2({Key? key}) : super(key: key);

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
              Center(
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: const Text(
                    kTxtEnterMatrixValue,
                    style: TextStyles.kTextH1BlackBold,
                  ),
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
                        _mHomePageController.columnCount.value =
                            int.parse(value);
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
                  () => Visibility(
                    visible: _mHomePageController.columnCount.value > 0 &&
                            _mHomePageController.rowCount.value > 0
                        ? true
                        : false,
                    child: Obx(
                      () => Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              _mHomePageController.getMaxLengthForInput(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            crossAxisCount:
                                _mHomePageController.columnCount.value == 0
                                    ? 1
                                    : _mHomePageController.columnCount.value,
                            childAspectRatio:
                                _mHomePageController.getChildAspectRatio(
                                    Get.size.width,
                                    Get.size.height,
                                    kToolbarHeight),
                          ),
                          itemBuilder: (context, index) {
                            return Center(
                              child: Obx(
                                () => Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _mHomePageController
                                                .getCharacter(index) ==
                                            _mHomePageController
                                                .searchInput.value
                                        ? Colors.lightBlueAccent
                                        : Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                  ),
                                  child: Center(
                                    child: Obx(
                                      () => Text(
                                        _mHomePageController
                                            .getCharacter(index),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
