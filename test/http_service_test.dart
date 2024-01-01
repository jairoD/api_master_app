import 'package:api_master_app/data/services/http_services.dart';
import 'package:api_master_app/models/request_model.dart';
import 'package:api_master_app/models/response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_service_test.mocks.dart';

@GenerateMocks([MyHttpClient])
Future<void> main() async {
  test("Validate POST", () async {
    final mockMyHttpClient = MockMyHttpClient();
    var responseModel = ResponseModel(
        data: {}, statusCode: 400, message: 'Error', succes: false);
    when(mockMyHttpClient.post(any)).thenAnswer((_) async => responseModel);
    var requestModel = RequestModel(method: HTTPMethods.POST, path: '/test');
    var response = await mockMyHttpClient.post(requestModel);
    expect(response, isA<ResponseModel>());
    expect(response?.statusCode, 400);
  });
}
