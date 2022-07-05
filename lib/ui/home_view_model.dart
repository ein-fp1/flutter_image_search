import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search/domain/model/photo.dart';
import 'package:flutter_image_search/domain/repository/photo_api_repository.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);

  Photo photo(index) {
    return _photos[index];
  }

  get length => _photos.length;

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
