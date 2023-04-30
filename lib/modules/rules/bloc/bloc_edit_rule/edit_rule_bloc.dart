import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:search_and_stay/services/rule/rule_repository.dart';

part 'edit_rule_event.dart';
part 'edit_rule_state.dart';

class EditRuleBloc extends Bloc<EditRuleEvent, EditRuleState> {
  EditRuleBloc() : super(EditRuleInitial()) {
    RuleService ruleService;
    on<EditRuleStart>((event, emit) async {
      emit(EditRuleProgress());
      ruleService = RuleService();
      var response = await ruleService.editRule(event.homeRule);
      response.fold(
          (success) => emit(EditRuleSuccess(success)),
          (failure) => emit(EditRuleFailure(failure)));
    });
  }
}
