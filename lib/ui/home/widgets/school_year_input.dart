import 'package:flutter/material.dart';
import 'package:merge_cert/domain/model/school_year_range.dart';
import 'package:merge_cert/ui/home/view_models/home_viewmodel.dart';

class SchoolYearInput extends StatelessWidget {
  const SchoolYearInput({
    super.key,
    required this.state,
    required this.onSelectionChanged,
    this.width,
  });

  final SchoolYearSelectionState state;

  final ValueChanged<SchoolYearRange> onSelectionChanged;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: state.possibleSchoolYears
          .map(
            (schoolYearRange) => DropdownMenuEntry(
              value: schoolYearRange,
              label: schoolYearRange.toString(),
            ),
          )
          .toList(),
      onSelected: (value) {
        if (value != null) {
          onSelectionChanged(value);
        }
      },
      initialSelection: state.schoolYear,
      selectOnly: true,
      width: width,
      label: Text("School year"),
    );
  }
}
