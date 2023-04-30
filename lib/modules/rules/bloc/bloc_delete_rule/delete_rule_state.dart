part of 'delete_rule_bloc.dart';

@immutable
abstract class DeleteRuleState {}

class DeleteRuleInitial extends DeleteRuleState {}

class DeleteRuleProgress extends DeleteRuleState {}

class DeleteRuleSucces extends DeleteRuleState {
  String successMessage;
  DeleteRuleSucces(this.successMessage);
}

class DeleteRuleFailure extends DeleteRuleState {
  String erroMessage;
  DeleteRuleFailure(this.erroMessage);
}
