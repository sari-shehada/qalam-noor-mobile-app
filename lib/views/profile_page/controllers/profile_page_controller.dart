import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/controllers/conversation_controller.dart';

import '../../../controllers/student_profile_controller.dart';
import '../../../models/student_profile/student_profile.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';

class ProfilePageController extends GetxController {
  ProfilePageController() {
    getStudentProfileView();
  }
  RxBool isLoading = true.obs;
  late StudentProfileView profileView;

  FutureEither<StudentProfileView> getStudentProfileView() async {
    isLoading.value = true;
    final Either<String, StudentProfileView> result =
        await StudentProfileController.instance.getProfileByStudentId();
    result.fold(
      (String errorMessage) {
        SnackbarService.showErrorSnackBar(
          title: 'حدث خطأ',
          message: errorMessage,
        );
      },
      (StudentProfileView data) {
        profileView = data;
      },
    );
    isLoading.value = false;
    return result;
  }
}
