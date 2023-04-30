part of 'edit_rule_bloc.dart';

@immutable
abstract class EditRuleEvent {}

class EditRuleStart extends EditRuleEvent {
  HomeRule homeRule;
  EditRuleStart(this.homeRule);
}
