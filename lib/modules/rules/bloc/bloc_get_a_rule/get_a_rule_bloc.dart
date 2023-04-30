import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:search_and_stay/services/rule/rule_repository.dart';

part 'get_a_rule_event.dart';
part 'get_a_rule_state.dart';

class GetARuleBloc extends Bloc<GetARuleEvent, GetARuleState> {
  GetARuleBloc() : super(GetARuleInitial()) {
    RuleService ruleService;
    on<GetARuleStart>((event, emit) async {
      emit(GetARuleProgress());
      ruleService = RuleService();
      var response = await ruleService.getARule(event.idRule);
      response.fold(
          (success) => emit(GetARuleSuccess(success)),
          (failure) => emit(GetARuleFailure(failure)));
    });
  }
}
