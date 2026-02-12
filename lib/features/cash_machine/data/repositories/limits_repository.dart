import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';

class LimitsRepository {
  List<int> _limits = [];

  LimitsRepository([List<int>? initialLimits]) {
    if (initialLimits != null) _limits = List<int>.from(initialLimits);
  }

  static const List<int> _denominations = [100, 200, 500, 1000, 2000, 5000];

  List<int> get denominations => List.from(_denominations);

  List<int> get limits => List.from(_limits);

  set limits(List<int> newLimits) => _limits = List.from(newLimits);

  CashResultDto get cashResultDto => CashResultDto(limits: _limits, denominations: _denominations, taken: []);
}
