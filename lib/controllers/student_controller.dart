import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/agendas/student.dart';
import '../models/student_profile/student_semester_score.dart';
import '../shared/global_params.dart';
import '../tools/logic_tools/network_service.dart';

class StudentController {
  const StudentController();
  static const StudentController instance = StudentController();

  String get _controllerName => 'studentController/';

  Future<List<Student>> getStudentsByFamilyId({int? familyId}) async {
    final int pickedFamilyID = familyId ?? GlobalParams.currentUser.id;
    final String endPoint =
        '${_controllerName}GetStudentsByFamilyId?familyId=$pickedFamilyID';

    return HttpService.getParsed<List<Student>, List<dynamic>>(
      url: endPoint,
      dataMapper: (List<dynamic> responseData) {
        return responseData
            .map<Student>((e) => Student.fromMap(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  Future<Student> getStudentById({required int studentId}) async {
    final String endPoint = '${_controllerName}GetStudentById?id=$studentId';

    return HttpService.getParsed<Student, Map<String, dynamic>>(
      url: endPoint,
      dataMapper: (Map<String, dynamic> responseData) {
        return Student.fromMap(responseData);
      },
    );
  }

  Future<StudentSemesterScore?> getStudentScores({
    required int studentId,
    required int schoolYearId,
    required int semesterId,
  }) async {
    final String url =
        '${_controllerName}GetStudentSemesterScoreScoresBySchoolYearIdAndSemesterIdAndStudentId?semesterId=$semesterId&schoolYearId=$schoolYearId&studentId=$studentId';

    // final StudentSemesterScore? semester = await HttpService.getParsed<
    //     StudentSemesterScore?, Map<String, dynamic>>(
    //   url: url,
    //   dataMapper: (responseData) {
    //     print(responseData);
    //     return StudentSemesterScore.fromMap(responseData);
    //   },
    // );
    final http.Response data = await HttpService.getUnparsed(url);
    if (data.body.trim().isEmpty) {
      return null;
    }
    return StudentSemesterScore.fromMap(
      jsonDecode(data.body),
    );
  }
}
