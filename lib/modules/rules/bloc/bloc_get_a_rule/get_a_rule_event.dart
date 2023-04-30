part of 'get_a_rule_bloc.dart';

@immutable
abstract class GetARuleEvent {}

class GetARuleStart extends GetARuleEvent {
  int idRule;
  GetARuleStart(this.idRule);
}
