import 'dart:async';

import 'mainPageRepository.dart';

class MainPageBloc {
  final _mainPageRepository = new MainPageRepository();

  Future<List> loadEvents(pageIndex, pageSize) {
    return _mainPageRepository
        .getEvents(pageIndex, pageSize)
        .catchError((error) {
      print(error);
    });
  }
}
