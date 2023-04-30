import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_and_stay/services/rule/rule_repository.dart';

part 'delete_rule_event.dart';
part 'delete_rule_state.dart';

class DeleteRuleBloc extends Bloc<DeleteRuleEvent, DeleteRuleState> {
  DeleteRuleBloc() : super(DeleteRuleInitial()) {
    RuleService ruleService;
    on<DeleteRuleStart>((event, emit) async {
      emit(DeleteRuleProgress());
      ruleService = RuleService();
      var response = await ruleService.deleteRule(event.idRule);
      response.fold((success) => emit(DeleteRuleSucces(success)),
          (error) => emit(DeleteRuleFailure(error)));
    });
  }
}
