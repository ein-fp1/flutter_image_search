import 'package:flutter_image_search/data/data_source/result.dart';
import 'package:flutter_image_search/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
