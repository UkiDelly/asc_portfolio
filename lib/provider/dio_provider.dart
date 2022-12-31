// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(DioInterceptor(storage: storage));

  return dio;
});

class DioInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  DioInterceptor({
    required this.storage,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String auth = 'Bearer';
    String? token = await storage.read(key: 'accessToken');
    options.headers['Authorization'] = '$auth $token';

    print(' --------------------------------------------------------------------\n');
    print('|[Dio] Request: (${options.method.toUpperCase()}) ${options.path}\n');
    print('|         Params: ${options.queryParameters}\n');
    print('|         Body: ${options.data}\n');
    print('--------------------------------------------------------------------\n');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(' --------------------------------------------------------------------\n');
    print('| [Dio] Response: (${response.statusCode}) ${response.requestOptions.path}\n');
    print('|          Data: ${response.data}\n');
    print('--------------------------------------------------------------------\n');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(' --------------------------------------------------------------------\n');
    print('|[Dio] Error: (${err.response?.statusCode}) ${err.requestOptions.path}\n');
    print('|        Message: ${err.message}\n');
    print('--------------------------------------------------------------------\n');
    super.onError(err, handler);
  }
}
