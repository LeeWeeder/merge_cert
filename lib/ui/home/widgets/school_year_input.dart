import 'package:flutter/material.dart';
import 'package:merge_cert/domain/model/school_year_range.dart';
import 'package:merge_cert/ui/home/view_models/home_viewmodel.dart';

class SchoolYearInput extends StatelessWidget {
  const SchoolYearInput({
    super.key,
    required this.state,
    required this.onSelectionChanged,
  });

  final SchoolYearSelectionState state;

  final ValueChanged<SchoolYearRange> onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<SchoolYearRange>(
      segments: state.possibleSchoolYears
          .map(
            (schoolYearRange) => ButtonSegment(
              value: schoolYearRange,
              label: Text(schoolYearRange.toString()),
            ),
          )
          .toList(),
      selected: <SchoolYearRange>{state.schoolYear},
      onSelectionChanged: (selection) {
        if (selection.isNotEmpty) {
          onSelectionChanged(selection.first);
        }
      },
    );
  }
}
