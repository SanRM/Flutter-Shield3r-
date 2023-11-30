import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_state_state.dart';

class ButtonStateCubit extends Cubit<ButtonStateState> {
  ButtonStateCubit() : super(ButtonStateState(missionControlState: false, incidentsControlState: true));

  void setIncidentsControlState(bool newState) {
    emit(ButtonStateState(missionControlState: state.missionControlState, incidentsControlState: newState));
  }

  void setMissionControlState(bool newState) {
    emit(ButtonStateState(missionControlState: newState, incidentsControlState: state.incidentsControlState));
  }

}
