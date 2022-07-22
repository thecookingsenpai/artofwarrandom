import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RandomQuoteCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'RandomQuote',
      apiUrl: 'http://solted.app:5000/quote',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic jSONPath1(dynamic response) => getJsonField(
        response,
        r'''$.quote''',
      );
}
