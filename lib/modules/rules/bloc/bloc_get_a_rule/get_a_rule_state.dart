part of 'get_a_rule_bloc.dart';

@immutable
abstract class GetARuleState {}

class GetARuleInitial extends GetARuleState {}

class GetARuleProgress extends GetARuleState {}

class GetARuleSuccess extends GetARuleState {
  HomeRule homeRule;
  GetARuleSuccess(this.homeRule);
}

class GetARuleFailure extends GetARuleState {
  String errorMessage;
  GetARuleFailure(this.errorMessage);
}
