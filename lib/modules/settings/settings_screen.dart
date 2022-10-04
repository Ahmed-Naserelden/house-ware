// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/layout/home_layout/cubit/shop_cubit.dart';
import 'package:shopping/layout/home_layout/cubit/shop_status.dart';
import 'package:shopping/models/profile_model.dart';
import 'package:shopping/shared/components/components.dart';

import '../login/cubit/states.dart';


var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStatus>(
        builder: (context, state){
          ProfileModel model = ShopCubit.get(context).profileModel!;
          nameController.text = model.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
          return ConditionalBuilder(
              condition: ShopCubit.get(context).profileModel != null,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextFormField(
                        textInputType: TextInputType.name,
                        prefixIcon: Icon(Icons.person),
                        controller: nameController,
                        text: 'Name',
                        validate: (value){
                          if(value.isEmpty){
                            return 'name must not Empty';
                          }
                          return null;
                        }

                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Icon(Icons.email),
                        controller: emailController,
                        text: 'Email',
                        validate: (value){
                          if(value.isEmpty){
                            return 'email must not Empty';
                          }
                          return null;
                        }

                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                        textInputType: TextInputType.phone,
                        prefixIcon: Icon(Icons.phone),
                        controller: phoneController,
                        text: 'Phone',
                        validate: (value){
                          if(value.isEmpty){
                            return 'Phone must not Empty';
                          }
                          return null;
                        }

                    ),
                  ],
                ),
              ),
             fallback: (context) => Center(child: CircularProgressIndicator()),

          );

        },
        listener: (context, state){

        }
    );
  }
}
