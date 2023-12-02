import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'incident_buttons_container2_state.dart';

class IncidentButtonsContainer2Cubit extends Cubit<IncidentButtonsContainer2State> {
  IncidentButtonsContainer2Cubit() : super(IncidentButtonsContainer2State(container1Pressed: false, cointainer1Finished: false, container1Checkbox: false, container2Checkbox: false, container3Checkbox: false, container4Checkbox: false, container5Checkbox: false));

  void setContainer1Pressed(bool pressed) {
    emit(IncidentButtonsContainer2State(container1Pressed: pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

  void changeContainer1Pressed() {
    emit(IncidentButtonsContainer2State(container1Pressed: !state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

  void setContainer1Finished(bool finished) {
    emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

    void toggleContainerFinished(){
    emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: !state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
  }

  void toggleContainerCheckbox(container){
    switch (container) {
      case 1:
        emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: !state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 2:
        emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: !state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 3:
        emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: !state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 4: 
        emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: !state.container4Checkbox, container5Checkbox: state.container5Checkbox));
        break;
      case 5: 
        emit(IncidentButtonsContainer2State(container1Pressed: state.container1Pressed, cointainer1Finished: state.cointainer1Finished, container1Checkbox: state.container1Checkbox, container2Checkbox: state.container2Checkbox, container3Checkbox: state.container3Checkbox, container4Checkbox: state.container4Checkbox, container5Checkbox: !state.container5Checkbox));
        break;
    }
  }

}
