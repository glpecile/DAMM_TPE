import 'package:SerManos/services/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/volunteering_service.dart';
part 'favorites_provider.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  final _userService = UserService();
  bool isFetching = false;

  void getFavorites() async {
    isFetching = true;
    var favorites = await _userService.getFavorites();
    isFetching = false;
    state = favorites;
  }

  // TODO: capaz recibir el volunteering y preguntar si lo tiene prendido el fav
  void updateFavorite(String volunteeringId) async {
    if (state.contains(volunteeringId)) {
      _removeFavorite(volunteeringId);
    } else {
      _addFavorite(volunteeringId);
    }
  }

  void _addFavorite(String volunteeringId) async {
    isFetching = true;
    await _userService.addFavorite(volunteeringId);
    isFetching = false;
    state = [...state, volunteeringId];
  }

  void _removeFavorite(String volunteeringId) async {
    isFetching = true;
    await _userService.removeFavorite(volunteeringId);
    isFetching = false;
    state = [...state.where((id) => id != volunteeringId)];
  }

  @override
  List<String> build() {
    state = [];
    getFavorites();
    return state;
  }
}