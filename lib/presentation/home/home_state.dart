import 'package:flutter_image_search/domain/model/photo.dart';

class HomeState {
  final List<Photo> photos;
  final bool isLoading;
  Photo photo(index) {
    return photos[index];
  }

  HomeState(this.photos, this.isLoading);

  HomeState copy({List<Photo>? photos, bool? isLoading}) {
    return HomeState(
      photos ??= this.photos,
      isLoading ??= this.isLoading,
    );
  }
}
