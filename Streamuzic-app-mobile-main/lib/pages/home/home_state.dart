import 'package:musik/models/loading_enum.dart';
import 'package:musik/models/song_model.dart';
import 'package:musik/models/user.dart';

class HomeState {
  final LoadPage status;
  final List<User> users;
  final List<SongModel> songs;
  HomeState({
    required this.status,
    required this.users,
    required this.songs,
  });
  factory HomeState.initial() {
    return HomeState(
      songs: [],
      status: LoadPage.initial,
      users: [],
    );
  }

  HomeState copyWith({
    LoadPage? status,
    List<User>? users,
    List<SongModel>? songs,
  }) {
    return HomeState(
      status: status ?? this.status,
      users: users ?? this.users,
      songs: songs ?? this.songs,
    );
  }
}
