import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/controllers/conversation_controller.dart';
import 'package:qalam_noor_parents/controllers/school_year_controller.dart';
import 'package:qalam_noor_parents/models/educational/school_year.dart';

import '../../../tools/dialogs_services/snack_bar_service.dart';

class HomePageController extends GetxController {
  HomePageController() {
    getCurrentSchoolYear();
  }
  late SchoolYear schoolYear;
  RxBool isLoadingCurrentYear = true.obs;

  FutureEither<SchoolYear> getCurrentSchoolYear() async {
    isLoadingCurrentYear.value = true;
    final Either<String, SchoolYear> currentSchoolYearResult =
        await SchoolYearController.instance.getCurrentStudentYear();

    currentSchoolYearResult.fold(
      (String errorMessage) {
        SnackbarService.showErrorSnackBar(
          title: 'حدث خطأ',
          message: errorMessage,
        );
        isLoadingCurrentYear.value = false;
      },
      (SchoolYear result) {
        schoolYear = result;
        isLoadingCurrentYear.value = false;
      },
    );
    return currentSchoolYearResult;
  }
}
