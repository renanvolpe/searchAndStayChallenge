part of 'add_rule_bloc.dart';

@immutable
abstract class AddRuleState {}

class AddRuleInitial extends AddRuleState {}

class AddRuleProgress extends AddRuleState {}

class AddRuleSucces extends AddRuleState {
  String successMessage;
  AddRuleSucces(this.successMessage);
}

class AddRuleFailure extends AddRuleState {
  String errorMessage;
  AddRuleFailure(this.errorMessage);
}
