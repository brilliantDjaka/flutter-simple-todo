import 'package:flutter/widgets.dart';

class Loading with ChangeNotifier {
  var _isLoading = 0;
  bool get isLoading => _isLoading > 0 ? true : false;
  initLoading() {
    _isLoading++;
    notifyListeners();
  }

  completeLoading() {
    _isLoading--;
    notifyListeners();
  }
}
