// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  final calculator = StringCalculator();

  test('Empty string returns 0', () {
    expect(calculator.add(''), 0);
  });

  test('Single number returns the number itself', () {
    expect(calculator.add('1'), 1);
  });

  test('Two comma-separated numbers return their sum', () {
    expect(calculator.add('1,5'), 6);
  });

  test('Multiple comma-separated numbers return their sum', () {
    expect(calculator.add('1,2,3,4,5'), 15);
  });

  test('Handle newlines between numbers', () {
    expect(calculator.add('1\n2,3'), 6);
  });

  test('Support custom delimiters', () {
    expect(calculator.add('//;\n1;2'), 3);
  });

  test('Throw exception for negative numbers', () {
    expect(
        () => calculator.add('1,-2,3,-4'),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains('Negative numbers not allowed: -2, -4'))));
  });
}
