import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_search/domain/use_case/get_photos_use_case.dart';
import 'package:flutter_image_search/presentation/home/home_state.dart';
import 'package:flutter_image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  HomeState _state = HomeState([], false);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.getPhotosUseCase);

  get length => _state.photos.length;

  Future<void> fetch(String query) async {
    _state = state.copy(isLoading: true);
    notifyListeners();
    final result = await getPhotosUseCase.execute(query);
    result.when(success: (photos) {
      _state = state.copy(photos: photos);
      notifyListeners();
    }, error: (message) {
      _eventController.add(HomeUiEvent.showSnackBar(message));
    });
    _state = state.copy(isLoading: false);
    notifyListeners();
  }
}
