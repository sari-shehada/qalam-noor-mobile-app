import 'package:fpdart/fpdart.dart';

import '../helpers/typedefs/type_definitions.dart';
import '../models/student_profile/student_profile.dart';
import '../shared/global_params.dart';
import '../tools/logic_tools/network_service.dart';

class StudentProfileController {
  const StudentProfileController();
  static const StudentProfileController instance = StudentProfileController();

  String get _controllerName => 'StudnetProfileViewController/';

  FutureEither<StudentProfileView> getProfileByStudentId(
      {int? studentId}) async {
    try {
      final int pickedStudentID = studentId ?? GlobalParams.selectedStudent.id;
      final String endPoint =
          '${_controllerName}GetStudentProfileViewByStudentId?studentId=$pickedStudentID';
      final StudentProfileView studentProfileView =
          await HttpService.getParsed<StudentProfileView, Map<String, dynamic>>(
        url: endPoint,
        dataMapper: (Map<String, dynamic> responseData) {
          return StudentProfileView.fromMap(responseData);
        },
      );
      return right(studentProfileView);
    } catch (e) {
      print(e);
      return left('حدث خطأ اثناء جلب المحادثات، حاول مرة أخرى');
    }
  }
}
