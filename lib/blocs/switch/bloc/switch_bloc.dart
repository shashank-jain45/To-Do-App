import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState(switchValue: false)) {
    on<SwitchEvent>(
      (event, emit) {
        emit(SwitchState(switchValue: event.newValue));
      },
    );
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
