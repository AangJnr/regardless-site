import 'package:flutter_test/flutter_test.dart';
import 'package:regardless_site/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SectionCategoriesViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
