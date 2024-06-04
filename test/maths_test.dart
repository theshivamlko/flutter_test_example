

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/maths.dart';

main() {

  group("maths tes", () {
    test('math add test', () {
      var res= add(1, 2);
      expect(res, 3);
    });
  });

}