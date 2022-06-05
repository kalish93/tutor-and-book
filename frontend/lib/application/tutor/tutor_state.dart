import 'package:equatable/equatable.dart';
import '../../domain/tutor/tutor.dart';


abstract class TutorState extends Equatable{
  const TutorState();

  @override
  List<Object> get props => [];
}

class TutorLoading extends TutorState{}

class TutorOperationSuccess extends TutorState{
  final Iterable<Tutor> tutors;

  TutorOperationSuccess([this.tutors = const []]);
  @override
  List<Object> get props => [tutors];
}

class TutorOperationFailure extends TutorState{
  final Object error;
  const TutorOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
