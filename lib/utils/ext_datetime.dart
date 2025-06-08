bool isDateTimeEqual(DateTime? d1, DateTime? d2) => (d1 == null && d2 == null) ||
    (d1 != null && d2 != null && d1.compareTo(d2) == 0);