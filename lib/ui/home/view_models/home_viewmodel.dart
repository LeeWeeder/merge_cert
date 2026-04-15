import 'package:flutter/foundation.dart';
import 'package:merge_cert/domain/model/school_year_range.dart';

class HomeViewModel extends ChangeNotifier {
  // TODO: Fetch from history and calculate the default school year.
  final now = DateTime.now();

  int get currentYear => now.year;

  int get startYear {
    int quarter = ((now.month - 1) ~/ 3) + 1;
    int start = currentYear;
    if (quarter <= 2) {
      start -= 1;
    }

    return start;
  }

  late final List<SchoolYearRange> _possibleStartYears = [
    currentYear - 1,
    currentYear,
  ].map((year) => SchoolYearRange(year)).toList();

  late SchoolYearRange _schoolYear = SchoolYearRange(startYear);

  SchoolYearSelectionState get schoolYearSelectionState =>
      SchoolYearSelectionState(
        schoolYear: _schoolYear,
        possibleSchoolYears: _possibleStartYears,
      );

  void setSchoolYear(SchoolYearRange newValue) {
    _schoolYear = newValue;
    notifyListeners();
  }
}

class SchoolYearSelectionState {
  final SchoolYearRange schoolYear;
  final List<SchoolYearRange> possibleSchoolYears;

  SchoolYearSelectionState({
    required this.schoolYear,
    required this.possibleSchoolYears,
  });
}
