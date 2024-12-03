// course_controller.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ulearning_app/common/models/lesson_entities.dart';

import 'package:ulearning_app/pages/lesson_detail/repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';

import '../../../common/utils/constants.dart';



part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(
    LessonDetailControllerRef ref, {required int index}) async {

  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;

  // Call the courseLessonList method with the correct parameter type
  final response = await LessonRepo.courseLessonDetail(params: lessonRequestEntity);

  // Check if the response is successful
  if (response.code == 200) {
    var url = "${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url}";
  videoPlayerController = VideoPlayerController.network(url);
  var initializeVideoPlayerFuture = videoPlayerController?.initialize();

  LessonVideo vidInstance =  LessonVideo(
    lessonItem: response.data!,
    isPlay: false,
    initializeVideoPlayer: initializeVideoPlayerFuture,
    url: url
  );
  ref.read(lessonDataControllerProvider.notifier).updateLessonData(vidInstance);
   
  } else {
    print('Request failed with status code: ${response.code}');

  }
}

@riverpod
class LessonDataController extends _$LessonDataController{
  @override
  Future<LessonVideo> build()async{
    return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons){
    update((data)=>data.copyWith(
      url:lessons.url,
      initializeVideoPlayer: lessons.initializeVideoPlayer,
      lessonItem: lessons.lessonItem,

    ));
  }

}