import 'package:atm_test/features/cash_machine/bloc/cash_machine_bloc.dart';
import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';
import 'package:atm_test/features/cash_machine/presentation/components/cash_machine_state_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const sectionHeight = 200.0;
  final testResult = CashResultDto(
    limits: [2, 1, 3, 3, 4, 2],
    denominations: [100, 200, 500, 1000, 2000, 5000],
    taken: [0, 0, 0, 0, 0, 1],
  );

  Widget pump(Widget child) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }

  group('CashMachineStateSection', () {
    testWidgets('initial state builds content via contentBuilder', (tester) async {
      await tester.pumpWidget(
        pump(
          CashMachineStateSection(
            state: CashMachineState.initial(testResult),
            sectionHeight: sectionHeight,
            contentBuilder: (result) => Text('content: ${result.limits.length}'),
          ),
        ),
      );

      expect(find.text('content: 6'), findsOneWidget);
    });

    testWidgets('loading state shows CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(
        pump(
          CashMachineStateSection(
            state: const CashMachineState.loading(),
            sectionHeight: sectionHeight,
            contentBuilder: (_) => const Text('content'),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('content'), findsNothing);
    });

    testWidgets('success state builds content via contentBuilder', (tester) async {
      await tester.pumpWidget(
        pump(
          CashMachineStateSection(
            state: CashMachineState.success(testResult),
            sectionHeight: sectionHeight,
            contentBuilder: (result) => Text('success: ${result.taken}'),
          ),
        ),
      );

      expect(find.text('success: [0, 0, 0, 0, 0, 1]'), findsOneWidget);
    });

    testWidgets('failure state without failureBuilder uses contentBuilder', (tester) async {
      await tester.pumpWidget(
        pump(
          CashMachineStateSection(
            state: CashMachineState.failure(testResult),
            sectionHeight: sectionHeight,
            contentBuilder: (result) => Text('content limits=${result.limits}'),
          ),
        ),
      );

      expect(find.text('content limits=[2, 1, 3, 3, 4, 2]'), findsOneWidget);
    });

    testWidgets('failure state with failureBuilder uses failureBuilder', (tester) async {
      await tester.pumpWidget(
        pump(
          CashMachineStateSection(
            state: CashMachineState.failure(testResult),
            sectionHeight: sectionHeight,
            contentBuilder: (_) => const Text('content'),
            failureBuilder: (result) => Text('error: ${result.taken}'),
          ),
        ),
      );

      expect(find.text('error: [0, 0, 0, 0, 0, 1]'), findsOneWidget);
      expect(find.text('content'), findsNothing);
    });
  });
}
