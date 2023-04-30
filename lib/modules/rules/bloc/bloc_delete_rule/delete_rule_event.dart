part of 'delete_rule_bloc.dart';

@immutable
abstract class DeleteRuleEvent {}

class DeleteRuleStart extends DeleteRuleEvent {
  int idRule;
  DeleteRuleStart(this.idRule);
}
