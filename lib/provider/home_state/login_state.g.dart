// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$LoginStateNotifierHash() =>
    r'529bb8a5d235abce75deda67cfc7638820bc95ac';

/// See also [LoginStateNotifier].
final loginStateNotifierProvider =
    AutoDisposeNotifierProvider<LoginStateNotifier, LoginState>(
  LoginStateNotifier.new,
  name: r'loginStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$LoginStateNotifierHash,
);
typedef LoginStateNotifierRef = AutoDisposeNotifierProviderRef<LoginState>;

abstract class _$LoginStateNotifier extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build();
}

String _$checkUserLoginHash() => r'9bcd86f07e1c8e5635d7c49ad3b15f36d8c987ff';

/// See also [checkUserLogin].
final checkUserLoginProvider = AutoDisposeFutureProvider<bool>(
  checkUserLogin,
  name: r'checkUserLoginProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkUserLoginHash,
);
typedef CheckUserLoginRef = AutoDisposeFutureProviderRef<bool>;
