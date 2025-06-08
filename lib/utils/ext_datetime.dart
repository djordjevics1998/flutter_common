extension DateTimeEquator on DateTime {
  int? nullableCompareTo(DateTime? other) => other == null ? null : compareTo(other);
}