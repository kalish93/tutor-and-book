import 'package:meta/meta.dart';
import '/tutor/models/tutor.dart';
import '../data_provider/tutor_provider.dart';


class TutorRepository {
  final TutorDataProvider dataProvider;
  TutorRepository(this.dataProvider);

  Future<List<Tutor>> fetchAll() async{
    return dataProvider.fetchAll();
  }
}