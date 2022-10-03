import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/layout/home_layout/cubit/shop_cubit.dart';
import 'package:shopping/layout/home_layout/cubit/shop_status.dart';
import 'package:shopping/modules/cart/Cart.dart';
import 'package:shopping/modules/login/login_screen.dart';
import 'package:shopping/modules/search/search_screen.dart';
import 'package:shopping/shared/components/components.dart';
import 'package:shopping/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sella',style: TextStyle(),),
            actions: [
              IconButton(
                onPressed: (){
                  navigatTo(context, const SearchScreen());
                },
                icon: const Icon(
                    Icons.search,
                ),
              ),
              IconButton(
                onPressed: (){
                  navigatTo(context, const CartScreen());
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
              IconButton(
                onPressed: (){
                  logoutFunction(context);
                },
                icon: const Icon(
                  Icons.logout_rounded,
                ),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(

            items:  const [
              BottomNavigationBarItem(
                  icon:  Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.apps),
                  label: 'Categories'
              ),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.favorite),
                  label: 'Favorites'
              ),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.settings),
                  label: 'Settings'
              ),
            ],
            onTap: (index){
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,

          ),
        );
      },
    );
  }

  void logoutFunction(context){
    CachHelper.removeKey(key: 'token').then((value) {
      navigateAndFinish(context, const LoginScreen());
    });
  }
}
