class CsvTable {
  const CsvTable({required this.headers, required this.rows});

  final List<String> headers;
  final List<Map<String, String>> rows;
}

class CsvParsingHelpers {
  const CsvParsingHelpers._();

  static CsvTable parseTable(String csvContent) {
    final lines = csvContent
        .split(RegExp(r'\r?\n'))
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    if (lines.isEmpty) {
      return const CsvTable(headers: [], rows: []);
    }

    final headers = _splitCsvLine(
      lines.first,
    ).map(_normalizeHeader).where((header) => header.isNotEmpty).toList();

    final rows = <Map<String, String>>[];

    for (final line in lines.skip(1)) {
      final values = _splitCsvLine(line);
      final row = <String, String>{};

      for (var index = 0; index < headers.length; index++) {
        final value = index < values.length ? values[index].trim() : '';
        row[headers[index]] = value;
      }

      rows.add(row);
    }

    return CsvTable(headers: headers, rows: rows);
  }

  static void requireColumns({
    required CsvTable table,
    required List<String> requiredColumns,
    required String sourceName,
  }) {
    final missingColumns = requiredColumns
        .where((column) => !table.headers.contains(column))
        .toList();

    if (missingColumns.isNotEmpty) {
      throw FormatException(
        'Missing required columns in $sourceName: ${missingColumns.join(', ')}',
      );
    }
  }

  static String requiredString(Map<String, String> row, String columnName) {
    final value = row[columnName]?.trim();

    if (value == null || value.isEmpty) {
      throw FormatException('Missing required value for column: $columnName');
    }

    return value;
  }

  static int requiredInt(Map<String, String> row, String columnName) {
    final value = requiredString(row, columnName);
    final parsedValue = int.tryParse(value);

    if (parsedValue == null) {
      throw FormatException(
        'Invalid integer value for column $columnName: $value',
      );
    }

    return parsedValue;
  }

  static double requiredDouble(Map<String, String> row, String columnName) {
    final value = requiredString(row, columnName);
    final parsedValue = double.tryParse(value);

    if (parsedValue == null) {
      throw FormatException(
        'Invalid decimal value for column $columnName: $value',
      );
    }

    return parsedValue;
  }

  static DateTime requiredDate(Map<String, String> row, String columnName) {
    final value = requiredString(row, columnName);
    final parsedValue = DateTime.tryParse(value);

    if (parsedValue == null) {
      throw FormatException(
        'Invalid date value for column $columnName: $value',
      );
    }

    return parsedValue;
  }

  static String _normalizeHeader(String header) {
    return header.replaceFirst('\uFEFF', '').trim();
  }

  static List<String> _splitCsvLine(String line) {
    final values = <String>[];
    final buffer = StringBuffer();
    var insideQuotes = false;

    for (var index = 0; index < line.length; index++) {
      final character = line[index];

      if (character == '"') {
        final isEscapedQuote =
            insideQuotes && index + 1 < line.length && line[index + 1] == '"';

        if (isEscapedQuote) {
          buffer.write('"');
          index++;
        } else {
          insideQuotes = !insideQuotes;
        }
      } else if (character == ',' && !insideQuotes) {
        values.add(buffer.toString().trim());
        buffer.clear();
      } else {
        buffer.write(character);
      }
    }

    values.add(buffer.toString().trim());

    return values;
  }
}
