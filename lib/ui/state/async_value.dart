import 'package:meta/meta.dart';

/// A utility for safely manipulating asynchronous data.
///
/// By using [AsyncValue], you ensure that you handle the loading, error,
/// and data states of an asynchronous operation.
///
/// It also provides utilities to convert an [AsyncValue] into different
/// representations. For example, in a Flutter widget, you can use [when]
/// to handle different states:
///
/// ```dart
/// Widget build(BuildContext context) {
///   final asyncValue = // get your AsyncValue instance
///
///   return asyncValue.when(
///     loading: () => CircularProgressIndicator(),
///     error: (error, stack) => Text('An error occurred'),
///     data: (data) => Text('Data: $data'),
///   );
/// }
/// ```
///
/// If you only care about the data and not the loading/error states,
/// you can use [value] or [valueOrNull]:
///
/// ```dart
/// final data = asyncValue.value; // May throw if in error state
/// final dataOrNull = asyncValue.valueOrNull; // Returns null if loading or error
/// ```
@sealed
@immutable
abstract class AsyncValue<T> {
  const AsyncValue._();

  /// Creates an [AsyncValue] with data.
  const factory AsyncValue.data(T value) = AsyncData<T>;

  /// Creates an [AsyncValue] in a loading state.
  const factory AsyncValue.loading() = AsyncLoading<T>;

  /// Creates an [AsyncValue] in an error state.
  const factory AsyncValue.error(Object error, [StackTrace? stackTrace]) =
      AsyncError<T>;

  /// Transforms a [Future] into an [AsyncValue], capturing errors.
  static Future<AsyncValue<T>> guard<T>(
    Future<T> Function() future, [
    bool Function(Object)? test,
  ]) async {
    try {
      return AsyncValue.data(await future());
    } catch (err, stack) {
      if (test == null || test(err)) {
        return AsyncValue.error(err, stack);
      }
      Error.throwWithStackTrace(err, stack);
    }
  }

  /// Indicates if the value is currently loading.
  bool get isLoading;

  /// Indicates if a value is available.
  bool get hasValue;

  /// The current value, if available. May rethrow if in error state.
  T? get value;

  /// The error, if any.
  Object? get error;

  /// The stack trace associated with the error.
  StackTrace? get stackTrace;

  /// Casts the [AsyncValue] to a different type.
  AsyncValue<R> _cast<R>();

  /// Maps the [AsyncValue] to a new value based on its state.
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  });

  /// Unwraps the [AsyncValue], removing any previous state information.
  AsyncValue<T> unwrapPrevious() {
    return map(
      data: (d) => d.isLoading ? AsyncLoading<T>() : AsyncData(d.value),
      error: (e) =>
          e.isLoading ? AsyncLoading<T>() : AsyncError(e.error, e.stackTrace),
      loading: (_) => AsyncLoading<T>(),
    );
  }

  @override
  String toString() {
    final content = [
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      if (hasValue) 'value: $value',
      if (error != null) 'error: $error, stackTrace: $stackTrace',
    ].join(', ');

    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return other is AsyncValue<T> &&
        other.isLoading == isLoading &&
        other.hasValue == hasValue &&
        other.error == error &&
        other.stackTrace == stackTrace &&
        other.valueOrNull == valueOrNull;
  }

  @override
  int get hashCode => Object.hash(
        isLoading,
        hasValue,
        valueOrNull,
        error,
        stackTrace,
      );
}

/// Represents an [AsyncValue] containing data.
class AsyncData<T> extends AsyncValue<T> {
  /// Creates an [AsyncValue] with data.
  const AsyncData(T value)
      : this._(
          value,
          isLoading: false,
          error: null,
          stackTrace: null,
        );

  const AsyncData._(
    this.value, {
    required this.isLoading,
    required this.error,
    required this.stackTrace,
  }) : super._();

  @override
  final T value;

  @override
  bool get hasValue => true;

  @override
  final bool isLoading;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      data(this);

  @override
  AsyncValue<R> _cast<R>() {
    return AsyncData<R>._(
      value as R,
      isLoading: isLoading,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// Represents an [AsyncValue] in a loading state.
class AsyncLoading<T> extends AsyncValue<T> {
  /// Creates an [AsyncValue] in a loading state.
  const AsyncLoading()
      : hasValue = false,
        value = null,
        error = null,
        stackTrace = null,
        super._();

  const AsyncLoading._({
    required this.hasValue,
    required this.value,
    required this.error,
    required this.stackTrace,
  }) : super._();

  @override
  bool get isLoading => true;

  @override
  final bool hasValue;

  @override
  final T? value;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      loading(this);

  @override
  AsyncValue<R> _cast<R>() {
    return AsyncLoading<R>._(
      hasValue: hasValue,
      value: value as R?,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// Represents an [AsyncValue] in an error state.
class AsyncError<T> extends AsyncValue<T> {
  /// Creates an [AsyncValue] in an error state.
  const AsyncError(Object error, [StackTrace? stackTrace])
      : this._(
          error,
          stackTrace: stackTrace,
          isLoading: false,
          hasValue: false,
          value: null,
        );

  const AsyncError._(
    this.error, {
    required this.stackTrace,
    required T? value,
    required this.hasValue,
    required this.isLoading,
  })  : _value = value,
        super._();

  @override
  final bool isLoading;

  @override
  final bool hasValue;

  final T? _value;

  @override
  T? get value {
    if (!hasValue) {
      if (stackTrace != null) {
        Error.throwWithStackTrace(error, stackTrace!);
      } else {
        throw error;
      }
    }
    return _value;
  }

  @override
  final Object error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required R Function(AsyncData<T> data) data,
    required R Function(AsyncError<T> error) error,
    required R Function(AsyncLoading<T> loading) loading,
  }) =>
      error(this);

  @override
  AsyncValue<R> _cast<R>() {
    return AsyncError<R>._(
      error,
      stackTrace: stackTrace,
      isLoading: isLoading,
      value: _value as R?,
      hasValue: hasValue,
    );
  }
}

/// Extension methods for [AsyncValue] to add utility functions.
extension AsyncValueX<T> on AsyncValue<T> {
  /// Returns the value if available, otherwise throws an error.
  T get requireValue {
    if (hasValue) return value as T;
    if (error != null) {
      if (stackTrace != null) {
        Error.throwWithStackTrace(error!, stackTrace!);
      } else {
        throw error!;
      }
    }
    throw StateError('No value available');
  }

  /// Returns the value if available, or null if not.
  T? get valueOrNull => hasValue ? value : null;

  /// Indicates if there is an error.
  bool get hasError => error != null;

  /// Converts the [AsyncValue] to an [AsyncData] if possible.
  AsyncData<T>? get asData =>
      this is AsyncData<T> ? this as AsyncData<T> : null;

  /// Converts the [AsyncValue] to an [AsyncError] if possible.
  AsyncError<T>? get asError =>
      this is AsyncError<T> ? this as AsyncError<T> : null;

  /// Applies a function to the data if available.
  AsyncValue<R> whenData<R>(R Function(T value) cb) {
    return map(
      data: (d) {
        try {
          return AsyncData<R>._(
            cb(d.value),
            isLoading: d.isLoading,
            error: d.error,
            stackTrace: d.stackTrace,
          );
        } catch (err, stack) {
          return AsyncError<R>(err, stack);
        }
      },
      error: (e) => AsyncError<R>(e.error, e.stackTrace),
      loading: (_) => AsyncLoading<R>(),
    );
  }

  /// Conditionally handles the [AsyncValue] based on its state.
  R maybeWhen<R>({
    R Function(T data)? data,
    R Function(Object error, StackTrace? stackTrace)? error,
    R Function()? loading,
    required R Function() orElse,
  }) {
    return when(
      data: data ?? (_) => orElse(),
      error: error ?? (_, __) => orElse(),
      loading: loading ?? () => orElse(),
    );
  }

  /// Handles all states of the [AsyncValue].
  R when<R>({
    required R Function(T data) data,
    required R Function(Object error, StackTrace? stackTrace) error,
    required R Function() loading,
  }) {
    if (isLoading) return loading();
    if (hasError) return error(this.error!, stackTrace);
    return data(requireValue);
  }

  /// Optionally maps the [AsyncValue] to a new value based on its state.
  R? whenOrNull<R>({
    R? Function(T data)? data,
    R? Function(Object error, StackTrace? stackTrace)? error,
    R? Function()? loading,
  }) {
    return maybeWhen(
      data: data,
      error: error,
      loading: loading,
      orElse: () => null,
    );
  }

  /// Maps the [AsyncValue] to a new value based on its state or calls [orElse].
  R maybeMap<R>({
    R Function(AsyncData<T> data)? data,
    R Function(AsyncError<T> error)? error,
    R Function(AsyncLoading<T> loading)? loading,
    required R Function() orElse,
  }) {
    return map(
      data: data ?? (_) => orElse(),
      error: error ?? (_) => orElse(),
      loading: loading ?? (_) => orElse(),
    );
  }

  /// Optionally maps the [AsyncValue] to a new value based on its state.
  R? mapOrNull<R>({
    R? Function(AsyncData<T> data)? data,
    R? Function(AsyncError<T> error)? error,
    R? Function(AsyncLoading<T> loading)? loading,
  }) {
    return maybeMap(
      data: data,
      error: error,
      loading: loading,
      orElse: () => null,
    );
  }
}
