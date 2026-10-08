// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.p

import 'dart:js_interop';

import 'package:test/test.dart';

import 'package:js_interop/js_interop.dart';

const isJSBackend = const bool.fromEnvironment('dart.library.html');

void main() {
  group('constructor', () {
    test('sets message', () => expect(JSError('foo').message, equals('foo')));

    test(
      'sets cause',
      () => expect(JSError('foo', cause: 'bar'.toJS).cause, equals('bar'.toJS)),
    );

    test('default cause', () {
      var defaultCause = JSError('foo').cause;
      expect(
        isJSBackend ? defaultCause.isUndefined : defaultCause.isUndefinedOrNull,
        isTrue,
      );
    });
  });

  group('isError', () {
    test(
      'is true for a JSError',
      () => expect(JSError.isError(JSError('foo')), isTrue),
    );

    test(
      'is true for a JSError subtype',
      () => expect(JSError.isError(JSEvalError('foo')), isTrue),
    );

    test(
      'is false for another JSObject',
      () => expect(JSError.isError(JSObject()), isFalse),
    );
  });

  group('asError', () {
    test('returns a JSError', () {
      var error = JSError('foo');
      expect(JSError.asError(error), equals(error));
    });

    test('returns a JSError subtype', () {
      var error = JSEvalError('foo');
      expect(JSError.asError(error), equals(error));
    });

    test(
      'returns null for another JSObject',
      () => expect(JSError.asError(JSObject()), isNull),
    );
  });

  test('name', () => expect(JSError('foo').name, equals('Error')));

  test('stack', () => expect(JSError('foo').stack, isNotEmpty));
}
