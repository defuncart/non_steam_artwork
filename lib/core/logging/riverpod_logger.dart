import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class RiverpodLogger extends ProviderObserver {
  const RiverpodLogger();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    debugPrint('Provider ${context.provider} was initialized with $value');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    debugPrint('Provider ${context.provider} was disposed');
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    debugPrint('Provider ${context.provider} updated from $previousValue to $newValue');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    debugPrint('Provider ${context.provider} threw $error at $stackTrace');
  }
}
