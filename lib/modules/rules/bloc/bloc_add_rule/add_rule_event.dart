part of 'add_rule_bloc.dart';

@immutable
abstract class AddRuleEvent {}

class AddRuleStart extends AddRuleEvent {
  HomeRule homeRulle;
  AddRuleStart(this.homeRulle);
}
