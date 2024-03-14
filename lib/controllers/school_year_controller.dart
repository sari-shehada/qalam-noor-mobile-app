import 'package:fpdart/fpdart.dart';
import 'package:qalam_noor_parents/models/educational/school_year.dart';

import '../helpers/typedefs/type_definitions.dart';
import '../tools/logic_tools/network_service.dart';

class SchoolYearController {
  const SchoolYearController();
  static const SchoolYearController instance = SchoolYearController();

  String get _controllerName => 'SchoolYearController/';

  FutureEither<SchoolYear> getCurrentStudentYear() async {
    try {
      final String endPoint = '${_controllerName}GetCurrentSchoolYear';
      final SchoolYear currentSchoolYear =
          await HttpService.getParsed<SchoolYear, Map<String, dynamic>>(
        url: endPoint,
        dataMapper: (Map<String, dynamic> responseData) {
          return SchoolYear.fromMap(responseData);
        },
      );
      return right(currentSchoolYear);
    } catch (e) {
      print(e);
      return left('حدث خطأ اثناء جلب العام الدراسي الحالي، حاول مرة أخرى');
    }
  }
}
