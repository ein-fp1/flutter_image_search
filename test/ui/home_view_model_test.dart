import 'package:flutter_image_search/data/data_source/result.dart';
import 'package:flutter_image_search/domain/model/photo.dart';
import 'package:flutter_image_search/domain/repository/photo_api_repository.dart';
import 'package:flutter_image_search/domain/use_case/get_photos_use_case.dart';
import 'package:flutter_image_search/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Stream Check', () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));
    await viewModel.fetch('flower');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    final viewModelPhotos = [];
    for (int i = 0; i < viewModel.length; i++) {
      viewModelPhotos.add(viewModel.state.photo(i));
    }
    ;
    expect(viewModelPhotos, result);
  });
}

class FakePhotoApiRepository implements PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 276014,
    "pageURL":
        "https://pixabay.com/photos/tree-flowers-meadow-tree-trunk-276014/",
    "type": "photo",
    "tags": "tree, flowers, meadow",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/g59f84c14a7c78f39c73e44c5892320a62be29f19470fff7d7927c2a7e43966a4f4fd71af0f9ade2185485c61c6b7d8aa_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 407,
    "largeImageURL":
        "https://pixabay.com/get/g8748074acdf25f371d3cd12ff2b8cbc3d25ed8876b4c39cbc0a72cbfa2d6db5f450db84032fde2667510cd8ec5457612254624f94839aac70abfe14c9f819ed6_1280.jpg",
    "imageWidth": 4090,
    "imageHeight": 2602,
    "imageSize": 2134495,
    "views": 2747574,
    "downloads": 1088659,
    "collections": 4056,
    "likes": 5268,
    "comments": 1561,
    "user_id": 1107275,
    "user": "Larisa-K",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/06/13/06-38-56-116_250x250.jpg"
  },
  {
    "id": 324175,
    "pageURL":
        "https://pixabay.com/photos/pink-cherry-blossoms-flowers-branch-324175/",
    "type": "photo",
    "tags": "pink, cherry blossoms, flowers",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g1fed9d9c8b79674e9522ca6530da0ac52c75be5fdf307bcf50615e6247e47eea14c12abadf17b444708e79ad3f749cc5_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g9145c678986509019eab6715fa74f6fe66837c317b9a29965caf3c530b1db36aa6e49c21a73cc89accd7a3be15b1371b0e3824a28b24adc2c2ecbcaf0fb3fe66_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 2613829,
    "views": 3505044,
    "downloads": 1731386,
    "collections": 3861,
    "likes": 4878,
    "comments": 1190,
    "user_id": 2,
    "user": "Hans",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/01/29/15-01-52-802_250x250.jpg"
  },
  {
    "id": 19830,
    "pageURL": "https://pixabay.com/photos/garden-flowers-butterfly-19830/",
    "type": "photo",
    "tags": "garden, flowers, butterfly",
    "previewURL":
        "https://cdn.pixabay.com/photo/2012/03/01/00/55/garden-19830_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gc48bdc041287a35afcefebed7cd278e587e7a9e99cdcdb1216e908f82585b854218a336c5da8b4bbe9d85b5fd31458bf_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 425,
    "largeImageURL":
        "https://pixabay.com/get/g3bd60244985fa85a48f3163b3c496818fded34a722a13f26b1ffcb17bb034616913de0a9437ba320e1c9bb804e97b97c_1280.jpg",
    "imageWidth": 2144,
    "imageHeight": 1424,
    "imageSize": 668020,
    "views": 1871340,
    "downloads": 547665,
    "collections": 3083,
    "likes": 3832,
    "comments": 762,
    "user_id": 1107275,
    "user": "Larisa-K",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/06/13/06-38-56-116_250x250.jpg"
  }
];
