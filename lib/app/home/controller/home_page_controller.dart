import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var rowCount = RxInt(0);
  var columnCount = RxInt(0);
  var userInputText = RxString('');
  var searchInput = RxString('');
  List<int> myList = [];

  int? getMaxLengthForInput() {
    if (rowCount.value > 0 && columnCount.value > 0) {
      return (rowCount.value * columnCount.value);
    } else {
      return 1;
    }
  }

  double _getGridItemHeight(double height, double toolbarHeight) {
    return (height - toolbarHeight - 24) / 2;
  }

  double _getGridItemWidth(double width) {
    return width / 1;
  }

  double getChildAspectRatio(double width, double height,
      double toolbarHeight) {
    return (_getGridItemWidth(width) /
        _getGridItemHeight(height, toolbarHeight));
  }

  /// get character from user input string
  String getCharacter(int index) {
    if (index < userInputText.value.length) {
      return userInputText.value[index];
    } else {
      return '*';
    }
  }

  void getSearchedValuePosition() {
    myList.clear();
    for (var i = 0; i < searchInput.value.length; i++) {
      myList.add(userInputText.value.indexOf(searchInput.value[i]));
      print(myList);
    }

    getDirection();
  }

  /// get background color of searched cells
  bool getIsHighlightSearchedCell(int index) {
    bool isAvailable = false;
    if (searchInput.value.length < 2) {
      for (var i = 0; i < searchInput.value.length; i++) {
        if (searchInput.value[i] == userInputText.value[index]) {
          isAvailable = true;
        }
      }
    }


    // horizontal searching
    if (searchInput.value.length > 1) {
      if (userInputText.value.contains(searchInput.value)) {
        for (var i = 0; i < userInputText.value.length; i++) {
          for (var j = 0; j < searchInput.value.length; j++) {
            if (userInputText.value.indexOf(searchInput.value) >= i) {
              if (userInputText.value[index] == searchInput.value[j]) {
                isAvailable = true;
                break;
              }
            }
          }
        }
      }
    }

    return isAvailable;
  }

  int getDirection() {
    bool isValidVertical = false;
    for (var i = 0; i < columnCount.value; i++) {
      if ((myList[i + 1] - myList[i]) == columnCount.value) {
        isValidVertical = true;
      } else {
        isValidVertical = false;
      }
    }
    print(isValidVertical);
    return -1;
  }
}
