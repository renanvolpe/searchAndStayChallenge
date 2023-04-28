import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:search_and_stay/services/rule/rule_repository.dart';

part 'get_rule_list_event.dart';
part 'get_rule_list_state.dart';

class GetRuleListBloc extends Bloc<GetRuleListEvent, GetRuleListState> {
  GetRuleListBloc() : super(GetRuleListInitial()) {
    RuleService ruleService;
    on<GetRuleListStart>((event, emit) async {
      emit(GetRuleListProgress());
      ruleService = RuleService();

      var response = await ruleService.getListRule();

      response.fold((success) => emit(GetRuleListSuccess(success)),
          (failure) => emit(GetRuleListFailure(failure)));
    });
  }
}
