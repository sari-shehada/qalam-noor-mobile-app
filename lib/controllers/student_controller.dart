import '../models/agendas/student.dart';
import '../shared/global_params.dart';
import '../tools/logic_tools/network_service.dart';

class StudentController {
  static StudentController get instance => StudentController();

  String get _controllerName => 'studentController/';

  Future<List<Student>> getStudentsByFamilyId({int? familyId}) async {
    final pickedFamilyID = familyId ?? GlobalParams.currentUser.id;
    String endPoint =
        '${_controllerName}GetStudentsByFamilyId?familyId=$pickedFamilyID';

    return HttpService.getParsed<List<Student>, List<dynamic>>(
      url: endPoint,
      dataMapper: (responseData) {
        return responseData.map((e) => Student.fromMap(e)).toList();
      },
    );
  }

  Future<Student> getStudentById({required int studentId}) async {
    String endPoint = '${_controllerName}GetStudentById?id=$studentId';

    return HttpService.getParsed<Student, Map<String, dynamic>>(
      url: endPoint,
      dataMapper: (responseData) {
        return Student.fromMap(responseData);
      },
    );
  }
}
