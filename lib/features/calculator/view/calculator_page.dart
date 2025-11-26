import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_padding.dart';
import '../view_model/calculator_cubit.dart';
import '../view_model/calculator_state.dart';
import '../view_model/calculator_presenter.dart';
import '../widget/display_widget.dart';
import '../widget/animated_background.dart';
import 'widget/button_grid.dart';

/// Main calculator screen
class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(CalculatorPresenter()),
      child: Scaffold(
        body: Stack(
          children: [
            // Animated background with dots
            Container(
              decoration: const BoxDecoration(
                gradient: AppColor.appBackgroundGradient,
              ),
              child: const AnimatedBackground(),
            ),
            // Main content
            SafeArea(
              child: Column(
                children: [
                  // Display Section
                  Expanded(
                    flex: 2,
                    child: BlocBuilder<CalculatorCubit, CalculatorState>(
                      builder: (context, state) {
                        return DisplayWidget(state: state);
                      },
                    ),
                  ),
                  // Buttons Section
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.l),
                      child: BlocBuilder<CalculatorCubit, CalculatorState>(
                        builder: (context, state) {
                          final cubit = context.read<CalculatorCubit>();
                          return ButtonGrid(cubit: cubit);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

