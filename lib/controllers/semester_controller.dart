import '../../../tools/logic_tools/network_service.dart';
import '../models/educational/semester.dart';

class SemestersDBHelper {
  String get _controllerName => 'SemesterController/';
  static SemestersDBHelper get instance => SemestersDBHelper();

  Future<List<Semester>> getAll() async {
    final String url = '${_controllerName}GetSemesters';
    final List<Semester> allSemesters =
        await HttpService.getParsed<List<Semester>, List<dynamic>>(
      url: url,
      dataMapper: (parsedData) {
        return parsedData.map(
          (e) {
            return Semester.fromMap(e);
          },
        ).toList();
      },
    );
    return allSemesters;
  }

  Future<Semester> getById(int id) async {
    final String url = '${_controllerName}GetSemesterById?id=$id';
    final Semester semester =
        await HttpService.getParsed<Semester, Map<String, dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return Semester.fromMap(responseData);
      },
    );
    return semester;
  }

  Future<List<Semester>> getSemestersInSchoolYear(int schoolYearId) async {
    final String url =
        '${_controllerName}GetSemestersBySchoolYearId?schoolYearId=$schoolYearId';
    final List<Semester> semesters =
        await HttpService.getParsed<List<Semester>, List<dynamic>>(
      url: url,
      dataMapper: (responseData) {
        return responseData
            .map(
              (e) => Semester.fromMap(e as Map<String, dynamic>),
            )
            .toList();
      },
    );
    return semesters;
  }
}
