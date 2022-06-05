import 'package:meta/meta.dart';
import '../../infrastructure/tutor/tutor_provider.dart';
import '../../domain/tutor/tutor.dart';



class TutorRepository {
  final TutorDataProvider dataProvider;
  TutorRepository(this.dataProvider);

  Future<List<Tutor>> fetchAll() async{
    return dataProvider.fetchAll();
  }
}