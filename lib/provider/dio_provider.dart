// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asc_portfolio/provider/secure_storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(DioInterceptor(storage: storage));
  dio.interceptors.add(
    PrettyDioLogger(
      // requestHeader: true,
      requestBody: true,
      responseBody: true,
      // responseHeader: true,
      compact: true,
      maxWidth: 90,
    ),
  );

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

    // print(' --------------------------------------------------------------------\n');
    // print('|[Dio] Request: (${options.method.toUpperCase()}) ${options.path}\n');
    // print('|         Params: ${options.queryParameters}\n');
    // print('|         Body: ${options.data}\n');
    // print('--------------------------------------------------------------------\n');
    super.onRequest(options, handler);
  }
}
