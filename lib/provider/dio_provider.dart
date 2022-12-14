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
    options.headers['Authorization'] = storage.read(key: 'accessToken');
    super.onRequest(options, handler);
  }
}
