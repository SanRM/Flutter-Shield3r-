import 'package:bloc/bloc.dart';


class PageChangeManagerCubit extends Cubit<bool> {
  PageChangeManagerCubit() : super(false);

  void changePage() {
    emit(!state);
  }

  void setPage(bool page) {
    emit(page);
  }

}
