class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      print('Empty string, returning 0');
      return 0;
    }

    String delimiter = ',';
    String numberSection = numbers;

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numberSection = parts.sublist(1).join('\n');
    }

    final sanitizedNumbers = numberSection
        .replaceAll('\n', delimiter)
        .split(delimiter)
        .where((num) => num.isNotEmpty)
        .map((num) {
      try {
        return int.parse(num.trim());
      } catch (e) {
        throw FormatException('Invalid radix-10 number: $num');
      }
    }).toList();

    print('Parsed numbers: $sanitizedNumbers');

    final negativeNumbers = sanitizedNumbers.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw Exception(
          "Negative numbers not allowed: ${negativeNumbers.join(", ")}");
    }

    int sum = sanitizedNumbers.fold(0, (sum, num) => sum + num);
    print('Sum of numbers: $sum');
    return sum;
  }
}
