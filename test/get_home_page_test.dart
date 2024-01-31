import 'package:flutter_test/flutter_test.dart';
import 'package:musik/repositories/get_home_page.dart';

void main() {
  test('data', () async {
    var h = await GetHomePage().getUsers();
    print(h[0]);
  });
}
