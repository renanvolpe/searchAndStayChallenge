import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:search_and_stay/services/rule/rule_repository.dart';

part 'add_rule_event.dart';
part 'add_rule_state.dart';

class AddRuleBloc extends Bloc<AddRuleEvent, AddRuleState> {
  AddRuleBloc() : super(AddRuleInitial()) {
    RuleService ruleService;
    on<AddRuleStart>((event, emit) async {
      emit(AddRuleProgress());
      ruleService = RuleService();
      var response = await ruleService.insertRule(event.homeRulle);
      response.fold((success) => emit(AddRuleSucces(success)),
          (failure) => emit(AddRuleFailure(failure)));
    });
  }
}
