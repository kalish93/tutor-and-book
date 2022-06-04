import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/tutor/repository/tutor_repository.dart';
import '../bloc/bloc.dart';


class TutorBloc extends Bloc<TutorEvent,TutorState>{
  final TutorRepository tutorRepository;

  TutorBloc({required this.tutorRepository}):super(TutorLoading()){
    on<TutorLoad>(((event, emit) async{
      emit(TutorLoading());
      try{
        final tutors = await tutorRepository.fetchAll();
        print('iuhiojjjjjjjjjjjjjj');
        emit(TutorOperationSuccess(tutors));
      }catch(error){
        emit(TutorOperationFailure(error));
      }
      
    }));

  }
}