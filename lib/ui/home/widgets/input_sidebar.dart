import 'package:flutter/material.dart';
import 'package:merge_cert/domain/model/school_year_range.dart';
import 'package:merge_cert/ui/home/view_models/home_viewmodel.dart';
import 'package:merge_cert/ui/home/widgets/school_year_input.dart';

class InputSidebar extends StatelessWidget {
  const InputSidebar({
    super.key,
    required this.schoolYearSelectionState,
    required this.onSchoolYearSelectionChanged,
  });

  final SchoolYearSelectionState schoolYearSelectionState;
  final ValueChanged<SchoolYearRange> onSchoolYearSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SchoolYearInput(
                state: schoolYearSelectionState,
                onSelectionChanged: onSchoolYearSelectionChanged,
                width: constraints.maxWidth,
              );
            },
          ),
        ),
      ],
    );
  }
}
