import 'package:flutter/foundation.dart';

final class EmailProvider extends ChangeNotifier {
  String _email = " ";

  String get email => _email;

  changeemail(String email) async {
    _email = email;
    notifyListeners();
  }
}
