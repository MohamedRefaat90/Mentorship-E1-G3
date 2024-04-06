
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/launches_screen.dart';
import '../../pages/rockets_screen.dart';
import '../../pages/upcoming_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
   static HomeCubit get(context)=>BlocProvider.of(context);

   ///bottom navigation bar
    int currentIndex = 0;

    ////change bottom nav current index
    void changeBottomNavBar(int index){
     currentIndex=index;
     emit(ChangeBottomNavBar());
   }

   /// home screens
   List<Widget>homeScreens=const[
    UpcomingScreen(),
    LaunchesScreen(),
    RocketScreen(),
   ];



}