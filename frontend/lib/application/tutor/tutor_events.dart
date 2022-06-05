
import 'package:equatable/equatable.dart';



abstract class TutorEvent extends Equatable{
 const TutorEvent();
}

class TutorLoad extends TutorEvent{
  const TutorLoad();

  @override
  List<Object> get props => [];
}