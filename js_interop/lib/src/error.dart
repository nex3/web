// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:js_interop';

/// The JavaScript `Error` type.
@JS('Error')
extension type JSError._(JSObject _) implements JSObject {
  /// See [`Error.captureStackTrace()`].
  ///
  /// [`Error.captureStackTrace()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/captureStackTrace
  external static void captureStackTrace(
    JSError error, [
    JSFunction constructor,
  ]);

  /// See [`Error.isError()`].
  ///
  /// Because `isError` isn't universally supported yet, this is polyfilled on
  /// platforms that don't yet support it to do an instanceof check on the
  /// `Error` class.
  ///
  /// [`Error.isError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/isError
  static bool isError(JSAny? value) =>
      _isErrorOrNull == null ? value.isA<JSError>() : _isError(value);

  /// If [value] is a [JSError] according to [isError], returns it.
  ///
  /// Otherwise, returns null.
  static JSError? asError(JSAny? value) =>
      isError(value) ? value as JSError : null;

  @JS('isError')
  external static bool _isError(JSAny? value);

  @JS('isError')
  external static JSFunction? _isErrorOrNull;

  /// See [`new Error()`].
  ///
  /// [`new Error()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/Error
  factory JSError(String message, {JSAny? cause}) => cause == null
      ? JSError.__(message)
      : JSError.__(message, _NewErrorOptions(cause: cause));

  external JSError.__(String message, [_NewErrorOptions options]);

  /// See [`Error.cause`].
  ///
  /// [`Error.cause`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause
  external JSAny? cause;

  /// See [`Error.message`].
  ///
  /// [`Error.message`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message
  external String message;

  /// See [`Error.name`].
  ///
  /// [`Error.name`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name
  external String name;

  /// See [`Error.stack`].
  ///
  /// [`Error.stack`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/stack
  external String stack;
}

extension type _NewErrorOptions._(JSObject _) implements JSObject {
  external _NewErrorOptions({JSAny? cause});

  external JSAny? cause;
}

/// The JavaScript `EvalError` type.
@JS('EvalError')
extension type JSEvalError._(JSError _) implements JSError {
  /// See [`new EvalError()`].
  ///
  /// [`new EvalError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/EvalError/EvalError
  factory JSEvalError(String message, {JSAny? cause}) => cause == null
      ? JSEvalError.__(message)
      : JSEvalError.__(message, _NewErrorOptions(cause: cause));

  external JSEvalError.__(String message, [_NewErrorOptions options]);
}

/// The JavaScript `RangeError` type.
@JS('RangeError')
extension type JSRangeError._(JSError _) implements JSError {
  /// See [`new RangeError()`].
  ///
  /// [`new RangeError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RangeError/RangeError
  factory JSRangeError(String message, {JSAny? cause}) => cause == null
      ? JSRangeError.__(message)
      : JSRangeError.__(message, _NewErrorOptions(cause: cause));

  external JSRangeError.__(String message, [_NewErrorOptions options]);
}

/// The JavaScript `ReferenceError` type.
@JS('ReferenceError')
extension type JSReferenceError._(JSError _) implements JSError {
  /// See [`new ReferenceError()`].
  ///
  /// [`new ReferenceError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError/ReferenceError
  factory JSReferenceError(String message, {JSAny? cause}) => cause == null
      ? JSReferenceError.__(message)
      : JSReferenceError.__(message, _NewErrorOptions(cause: cause));

  external JSReferenceError.__(String message, [_NewErrorOptions options]);
}

/// The JavaScript `SyntaxError` type.
@JS('SyntaxError')
extension type JSSyntaxError._(JSError _) implements JSError {
  /// See [`new SyntaxError()`].
  ///
  /// [`new SyntaxError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SyntaxError/SyntaxError
  factory JSSyntaxError(String message, {JSAny? cause}) => cause == null
      ? JSSyntaxError.__(message)
      : JSSyntaxError.__(message, _NewErrorOptions(cause: cause));

  external JSSyntaxError.__(String message, [_NewErrorOptions options]);
}

/// The JavaScript `TypeError` type.
@JS('TypeError')
extension type JSTypeError._(JSError _) implements JSError {
  /// See [`new TypeError()`].
  ///
  /// [`new TypeError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError/TypeError
  factory JSTypeError(String message, {JSAny? cause}) => cause == null
      ? JSTypeError.__(message)
      : JSTypeError.__(message, _NewErrorOptions(cause: cause));

  external JSTypeError.__(String message, [_NewErrorOptions options]);
}

/// The JavaScript `URIError` type.
@JS('URIError')
extension type JSURIError._(JSError _) implements JSError {
  /// See [`new URIError()`].
  ///
  /// [`new URIError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/URIError/URIError
  factory JSURIError(String message, {JSAny? cause}) => cause == null
      ? JSURIError.__(message)
      : JSURIError.__(message, _NewErrorOptions(cause: cause));

  external JSURIError.__(String message, [_NewErrorOptions options]);
}

/// The JavaScript `AggregateError` type.
@JS('AggregateError')
extension type JSAggregateError._(JSError _) implements JSError {
  /// See [`new AggregateError()`].
  ///
  /// [`new AggregateError()`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/AggregateError/AggregateError
  factory JSAggregateError(
    JSIterableProtocol<JSAny> errors, {
    String? message,
  }) => message == null
      ? JSAggregateError.__(errors)
      : JSAggregateError.__(errors, message);

  external JSAggregateError.__(
    JSIterableProtocol<JSAny> errors, [
    String message,
  ]);
}
