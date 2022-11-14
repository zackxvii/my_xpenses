import 'package:get/get.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello Worlsssd',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}
