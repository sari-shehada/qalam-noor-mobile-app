import 'package:get/get.dart';

import '../../../controllers/student_controller.dart';
import '../../../helpers/shared_prefs_helper.dart';
import '../../../models/agendas/student.dart';
import '../../../shared/global_params.dart';
import '../../bottom_nav_bar_scaffold_page/bottom_nav_bar_scaffold_page.dart';

class StudentListPageController extends GetxController {
  StudentListPageController() {
    isLoadingData.value = true;
    getMyChildrenList();
  }
  RxBool isLoadingData = false.obs;
  Rx<Student?> selectedStudent = Rx<Student?>(null);
  late RxList<Student> myChildren;

  Future<List<Student>> getMyChildrenList() async {
    isLoadingData.value = true;
    final List<Student> result =
        await StudentController.instance.getStudentsByFamilyId();
    myChildren = RxList<Student>(result);
    await setSelectedStudent();
    isLoadingData.value = false;
    return result;
  }

  Future<Student?> setSelectedStudent({Student? student}) async {
    if (student != null) {
      selectedStudent.value = student;
      return student;
    }
    final int? studentId = SharedPrefsHelper.instance.getCurrentStudentId();
    if (studentId == null) {
      return null;
    }
    final Student studentFromList = myChildren.firstWhere((Student element) {
      return element.id == studentId;
    });
    selectedStudent.value = studentFromList;
    myChildren.refresh();
    refresh();
    return studentFromList;
  }

  Future<bool> writeSelectedStudentIdToSharedPrefs() async {
    if (selectedStudent.value == null) {
      return false;
    }
    final bool result = await SharedPrefsHelper.instance
        .setCurrentUserId(selectedStudent.value!.id);

    GlobalParams.selectedStudent = selectedStudent.value!;
    await Get.offAllNamed<void>(BottomNavBarScaffoldPage.routeName);
    return result;
  }
}
