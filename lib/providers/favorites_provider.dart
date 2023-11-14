import 'package:SerManos/services/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/volunteering_service.dart';

part 'favorites_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  final _userService = UserService();

  void getFavorites() async {
    var favorites = await _userService.getFavorites();
    state = favorites;
  }

  // TODO: capaz recibir el volunteering y preguntar si lo tiene prendido el fav
  void toggleFavorite(String volunteeringId) async {
    (state.contains(volunteeringId))
        ? _removeFavorite(volunteeringId)
        : _addFavorite(volunteeringId);
  }

  void _addFavorite(String volunteeringId) async {
    await _userService.addFavorite(volunteeringId);
    state = [...state, volunteeringId];
  }

  void _removeFavorite(String volunteeringId) async {
    await _userService.removeFavorite(volunteeringId);
    state = [...state.where((id) => id != volunteeringId)];
  }

  @override
  List<String> build() {
    state = [];
    getFavorites();
    return state;
  }
}
