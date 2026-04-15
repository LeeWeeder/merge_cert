class SchoolYearRange {
  final int start;
  int get end => start + 1;

  const SchoolYearRange(this.start);

  @override
  String toString() {
    return '$start-$end';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolYearRange && start == other.start;

  @override
  int get hashCode => start.hashCode;
}
