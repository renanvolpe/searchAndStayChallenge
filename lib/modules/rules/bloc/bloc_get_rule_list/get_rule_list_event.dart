part of 'get_rule_list_bloc.dart';

@immutable
abstract class GetRuleListEvent {}

class GetRuleListStart implements GetRuleListEvent {
  int page;
  GetRuleListStart([this.page = 1]);
}
