import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'incident_buttons_state.dart';

class IncidentButtonsCubit extends Cubit<IncidentButtonsState> {
  IncidentButtonsCubit() : super(IncidentButtonsState(container1Pressed: false, cointainer1Finished: false, container1Checkbox: false, container2Checkbox: false, container3Checkbox: false, container4Checkbox: false, container5Checkbox: false));


  void setContainer1Pressed(bool pressed) {
    emit(IncidentButtonsState(container1Pressed: pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

  void changeContainer1Pressed() {
    emit(IncidentButtonsState(container1Pressed: !state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

  void setContainer1Finished(bool finished) {
    emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

    void toggleContainerFinished(){
    emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: !state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

  void toggleContainerCheckbox(container){
    switch (container) {
      case 1:
        emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: !state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 2:
        emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: !state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 3:
        emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: !state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 4: 
        emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: !state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 5: 
        emit(IncidentButtonsState(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: !state.container5Checkbox));
        break;
    }
  }

}
