import 'package:api_master_app/data/services/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'shared_test.mocks.dart';

@GenerateMocks([SharedPreferencesService])
Future<void> main() async {
  test("Validate SHARED PREFRENCES", () async {
    final sharedTest = MockSharedPreferencesService();
    when(sharedTest.getData(StorageTypes.STRING, 'token'))
        .thenAnswer((_) async => 'token123');
    var response = await sharedTest.getData(StorageTypes.STRING, 'token');
    expect(response, 'token123');
  });
}
