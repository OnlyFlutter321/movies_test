import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/business_logic/bottom_navigation/bottom_navigation_event.dart';
import 'package:movies_test/presentation/screen/foods/foods.dart';
import 'package:movies_test/presentation/screen/home_screen/home_screen.dart';

import 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc({this.firstPageRepository, this.secondPageRepository})
      : assert(firstPageRepository != null),
        assert(secondPageRepository != null),
        super(PageLoading());

  final HomeScreen? firstPageRepository;
  final Foods? secondPageRepository;
  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      // if (this.currentIndex == 0) {
      //   String data = await _getFirstPageData();
      //   yield FirstPageLoaded(text: data);
      // }
      // if (this.currentIndex == 1) {
      //   int data = await _getSecondPageData();
      //   yield SecondPageLoaded(number: data);
      // }
    }
  }

  // Future<String> _getFirstPageData() async {
  //   String data = firstPageRepository.data;
  //   if (data == null) {
  //     await firstPageRepository.fetchData();
  //     data = firstPageRepository.data;
  //   }
  //   return data;
}

  // Future<int> _getSecondPageData() async {
  //   int data = secondPageRepository.data;
  //   if (data == null) {
  //     await secondPageRepository.fetchData();
  //     data = secondPageRepository.data;
  //   }
  //   return data;
  // }
