part of 'switch_bloc.dart';

class SwitchEvent extends Equatable {
  final bool switchValue;
  final bool newValue;
   const SwitchEvent({
    required this.switchValue,
    required this.newValue,
  });

  @override
  List<Object> get props => [];
}
