import 'package:SerManos/services/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  final _userService = UserService();

  Future<List<String>> _getFavorites() async {
    return await _userService.getFavorites();
  }

  void toggleFavorite(String volunteeringId) async {
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
