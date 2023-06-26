import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/controllers/conversation_controller.dart';
import 'package:qalam_noor_parents/controllers/school_year_controller.dart';
import 'package:qalam_noor_parents/controllers/semester_controller.dart';
import 'package:qalam_noor_parents/controllers/student_controller.dart';
import 'package:qalam_noor_parents/models/educational/school_year.dart';
import 'package:qalam_noor_parents/views/home_page/views/grades_details_page.dart';

import '../../../models/educational/semester.dart';
import '../../../models/student_profile/student_semester_score.dart';
import '../../../shared/global_params.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';
import '../views/controllers/grades_details_page_controller.dart';

class HomePageController extends GetxController {
  HomePageController() {
    initData();
  }
  late List<Semester> semesters;
  late SchoolYear schoolYear;
  late StudentSemesterScore? studentSemesterScore;
  RxBool isLoading = true.obs;

  Future<void> initData() async {
    isLoading.value = true;

    await getCurrentSchoolYear();
    await getSemesters(schoolYearId: schoolYear.id);
    await getStudentScores(
        schoolYearId: schoolYear.id,
        semesterId: semesters.last.id,
        studentId: GlobalParams.selectedStudent.id);
    isLoading.value = false;
  }

  FutureEither<SchoolYear> getCurrentSchoolYear() async {
    final Either<String, SchoolYear> currentSchoolYearResult =
        await SchoolYearController.instance.getCurrentStudentYear();

    currentSchoolYearResult.fold(
      (String errorMessage) {
        SnackbarService.showErrorSnackBar(
          title: 'حدث خطأ',
          message: errorMessage,
        );
      },
      (SchoolYear result) {
        schoolYear = result;
      },
    );
    return currentSchoolYearResult;
  }

  Future<List<Semester>> getSemesters({required int schoolYearId}) async {
    return semesters =
        await SemestersDBHelper.instance.getSemestersInSchoolYear(schoolYearId);
  }

  Future<StudentSemesterScore?> getStudentScores({
    required int studentId,
    required int schoolYearId,
    required int semesterId,
  }) async {
    log(semesterId.toString());
    return studentSemesterScore =
        await StudentController.instance.getStudentScores(
      studentId: studentId,
      schoolYearId: schoolYearId,
      semesterId: semesterId,
    );
  }

  Future<void> goToDetailsPage() async {
    if (studentSemesterScore == null) return;
    await Get.to<void>(
      () => const GradesDetailsPage(),
      binding: BindingsBuilder<GradesDetailsPageController>(
        () {
          Get.put(
            GradesDetailsPageController(
              studentSemesterScore: studentSemesterScore!,
            ),
          );
        },
      ),
    );
  }
}
