import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/tutor/tutor_state.dart';
import '../../application/tutor/tutor_events.dart';
import '../../infrastructure/tutor/tutor_repository.dart';




class TutorBloc extends Bloc<TutorEvent,TutorState>{
  final TutorRepository tutorRepository;

  TutorBloc({required this.tutorRepository}):super(TutorLoading()){
    on<TutorLoad>(((event, emit) async{
      emit(TutorLoading());
      try{
        final tutors = await tutorRepository.fetchAll();
       
        emit(TutorOperationSuccess(tutors));
      }catch(error){
        emit(TutorOperationFailure(error));
      }
      
    }));

  }
}