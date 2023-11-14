import 'package:SerManos/services/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/volunteering_service.dart';

part 'favorites_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  final _userService = UserService();

  Future<List<String>> _getFavorites() async {
    return await _userService.getFavorites();
  }

  // TODO: capaz recibir el volunteering y preguntar si lo tiene prendido el fav
  void toggleFavorite(String volunteeringId) async {
    // TODO: puede fallar esto?
    (state.value!.contains(volunteeringId))
        ? _removeFavorite(volunteeringId)
        : _addFavorite(volunteeringId);
  }

  void _addFavorite(String volunteeringId) async {
    try {
      await _userService.addFavorite(volunteeringId);
      var auxFavs = state.value!;
      auxFavs = [...auxFavs, volunteeringId];
      state = AsyncValue.data(auxFavs);
    } catch (e) {
      print(e);
    }
  }

  void _removeFavorite(String volunteeringId) async {
    try {
      await _userService.removeFavorite(volunteeringId);
      var auxFavs = state.value!;
      auxFavs = [...auxFavs.where((id) => id != volunteeringId)];
      state = AsyncValue.data(auxFavs);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<String>> build() async {
    return await _getFavorites();
  }
}
