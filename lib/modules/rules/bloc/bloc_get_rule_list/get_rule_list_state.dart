part of 'get_rule_list_bloc.dart';

@immutable
abstract class GetRuleListState {}

class GetRuleListInitial extends GetRuleListState {}

class GetRuleListProgress extends GetRuleListState {}

class GetRuleListSuccess extends GetRuleListState {
  List<HomeRule> listRules;
  
  GetRuleListSuccess(this.listRules);
}

class GetRuleListFailure extends GetRuleListState {
  String errorMessage;
  GetRuleListFailure(this.errorMessage);
}
