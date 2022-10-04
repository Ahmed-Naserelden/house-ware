import 'package:shopping/models/login_model.dart';

import '../../../models/change_favorite_model.dart';
import '../../../models/profile_model.dart';

abstract class ShopStatus{}

class ShopInitialStatus extends ShopStatus{}

class ChangeBottomNavStatus extends ShopStatus{}

class ShopLoadingDataStatus extends ShopStatus{}

class ShopLoadingDataSuccessStatus extends ShopStatus{}

class ShopLoadingDataErrorStatus extends ShopStatus{}

class ShopLoadingCategoriesStatus extends ShopStatus{}

class ShopSuccessCategoriesStatus extends ShopStatus{}

class ShopErrorCategoriesStatus extends ShopStatus{}

class ChangeFavoriteProductState extends ShopStatus{}

class GetFavoriteProductSuccessState extends ShopStatus{}

class GetFavoriteProductErrorState extends ShopStatus{}

class ChangeFavoriteProductSuccessState extends ShopStatus{
  final ChangeFavoriteModel model;
  ChangeFavoriteProductSuccessState(this.model);
}

class ChangeFavoriteProductErrorState extends ShopStatus{
  // final ChangeFavoriteModel model;
  // ChangeFavoriteProductErrorState(this.model);
}

class LoadingGetProfileState extends ShopStatus{}

class GetProfileSuccessState extends ShopStatus{}

class GetProfileErrorState extends ShopStatus{}

class RegisterSuccessState extends ShopStatus{}

class RegisterErrorState extends ShopStatus{}






