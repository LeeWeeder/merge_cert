import 'package:flutter/material.dart';
import 'package:merge_cert/ui/home/view_models/home_viewmodel.dart';
import 'package:merge_cert/ui/home/widgets/input_sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: 300,
                child: InputSidebar(
                  schoolYearSelectionState:
                      widget.viewModel.schoolYearSelectionState,
                  onSchoolYearSelectionChanged: widget.viewModel.setSchoolYear,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Card.filled(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    child: Text("data"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
