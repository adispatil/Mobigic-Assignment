
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var rowCount = RxInt(0);
  var columnCount = RxInt(0);
  var userInputText = RxString('');
  var searchInput = RxString('');

  int? getMaxLengthForInput() {
    if(rowCount.value > 0 && columnCount.value > 0) {
      return (rowCount.value * columnCount.value);
    } else {
      return 1;
    }
  }

  double _getGridItemHeight(double height, double toolbarHeight){
    return (height - toolbarHeight - 24) / 2;
  }

  double _getGridItemWidth(double width){
    return width / 1;
  }

  double getChildAspectRatio(double width, double height, double toolbarHeight){
    return (_getGridItemWidth(width)/ _getGridItemHeight(height, toolbarHeight));
  }

  /// get character from user input string
  String getCharacter(int index){
    if(index < userInputText.value.length) {
      return userInputText.value[index];
    } else {
      return '*';
    }
  }
}