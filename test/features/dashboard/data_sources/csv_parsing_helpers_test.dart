import 'package:flutter_test/flutter_test.dart';
import 'package:small_business_dashboard_flutter/features/dashboard/data_sources/csv_parsing_helpers.dart';

void main() {
  group('CsvParsingHelpers', () {
    test('parses CSV headers and rows', () {
      const csvContent = '''
name,quantity,price
Rice,10,9.5
Oil,5,6.0
''';

      final table = CsvParsingHelpers.parseTable(csvContent);

      expect(table.headers, ['name', 'quantity', 'price']);
      expect(table.rows.length, 2);
      expect(table.rows.first['name'], 'Rice');
      expect(table.rows.first['quantity'], '10');
      expect(table.rows.first['price'], '9.5');
      expect(table.rows[1]['name'], 'Oil');
    });

    test('ignores empty lines', () {
      const csvContent = '''

name,quantity

Rice,10

Oil,5

''';

      final table = CsvParsingHelpers.parseTable(csvContent);

      expect(table.headers, ['name', 'quantity']);
      expect(table.rows.length, 2);
    });

    test('handles quoted CSV values with commas', () {
      const csvContent = '''
product_name,category,quantity
"Rice, Premium 5kg",Food,10
''';

      final table = CsvParsingHelpers.parseTable(csvContent);

      expect(table.rows.length, 1);
      expect(table.rows.first['product_name'], 'Rice, Premium 5kg');
      expect(table.rows.first['category'], 'Food');
      expect(table.rows.first['quantity'], '10');
    });

    test('requires expected columns', () {
      const csvContent = '''
name,quantity
Rice,10
''';

      final table = CsvParsingHelpers.parseTable(csvContent);

      expect(
        () => CsvParsingHelpers.requireColumns(
          table: table,
          requiredColumns: ['name', 'quantity'],
          sourceName: 'test.csv',
        ),
        returnsNormally,
      );
    });

    test('throws FormatException when required columns are missing', () {
      const csvContent = '''
name
Rice
''';

      final table = CsvParsingHelpers.parseTable(csvContent);

      expect(
        () => CsvParsingHelpers.requireColumns(
          table: table,
          requiredColumns: ['name', 'quantity'],
          sourceName: 'test.csv',
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('parses required string, int, double, and date values', () {
      final row = {
        'name': 'Rice',
        'quantity': '10',
        'price': '9.5',
        'date': '2026-05-01',
      };

      expect(CsvParsingHelpers.requiredString(row, 'name'), 'Rice');
      expect(CsvParsingHelpers.requiredInt(row, 'quantity'), 10);
      expect(CsvParsingHelpers.requiredDouble(row, 'price'), 9.5);
      expect(
        CsvParsingHelpers.requiredDate(row, 'date'),
        DateTime.parse('2026-05-01'),
      );
    });

    test('throws FormatException for missing required string value', () {
      final row = {'name': ''};

      expect(
        () => CsvParsingHelpers.requiredString(row, 'name'),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException for invalid int value', () {
      final row = {'quantity': 'ten'};

      expect(
        () => CsvParsingHelpers.requiredInt(row, 'quantity'),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException for invalid double value', () {
      final row = {'price': 'nine'};

      expect(
        () => CsvParsingHelpers.requiredDouble(row, 'price'),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException for invalid date value', () {
      final row = {'date': 'not-a-date'};

      expect(
        () => CsvParsingHelpers.requiredDate(row, 'date'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
