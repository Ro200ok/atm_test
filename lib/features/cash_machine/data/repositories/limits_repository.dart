import 'package:atm_test/features/cash_machine/data/model/cash_result_dto.dart';
import 'package:atm_test/features/cash_machine/domain/repositories/limits_repository_port.dart';

class LimitsRepository implements LimitsRepositoryPort {
  LimitsRepository([List<int>? initialLimits]) {
    if (initialLimits != null) _limits = List<int>.from(initialLimits);
  }

  List<int> _limits = [];
  static const List<int> _denominations = [100, 200, 500, 1000, 2000, 5000];

  @override
  List<int> get denominations => List.from(_denominations);

  @override
  List<int> get limits => List.from(_limits);

  @override
  set limits(List<int> newLimits) => _limits = List.from(newLimits);

  CashResultDto get cashResultDto =>
      CashResultDto(limits: _limits, denominations: _denominations, taken: []);
}
