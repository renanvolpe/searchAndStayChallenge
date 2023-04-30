part of 'edit_rule_bloc.dart';

@immutable
abstract class EditRuleState {}

class EditRuleInitial extends EditRuleState {}

class EditRuleProgress extends EditRuleState {}

class EditRuleSuccess extends EditRuleState {
  String successMessage;
  EditRuleSuccess(this.successMessage);
}

class EditRuleFailure extends EditRuleState {
  String errorMessage;
  EditRuleFailure(this.errorMessage);
}
