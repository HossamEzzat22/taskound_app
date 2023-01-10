import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/components/my_text_formField.dart';
import 'package:task_app/components/reusable_features/validate_button.dart';
import 'package:task_app/services/sp_helper/sp_helper.dart';
import 'package:task_app/services/sp_helper/sp_keys.dart';
import 'package:task_app/src/app_colors.dart';
import 'package:task_app/utils/app_navigator.dart';
import 'package:task_app/views/register_screen.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is TaskLoginSuccessState){
          AppNavigator(context, true, HomeScreen());
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.KMainColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mic_none_rounded,
                          size: 45.sp, color: Colors.white,),
                        Text(
                          'Taskound',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 590.5.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Welcome Back ',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),),
                            SizedBox(height: 30.h,),
                            MyTextFormField(name: 'Email', controller: cubit.EmailController, isPassword: false,),
                            SizedBox(height: 20.h,),
                            MyTextFormField(name: 'Password', controller: cubit.PasswordController, isPassword: true,),
                            SizedBox(height: 20.h,),
                            MyRaisedButton(function: ()
                            {
                              cubit.login();
                            },
                              text: 'Login',),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account?  ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                  //if(state is TaskLoginLoadingState)
                                  //const LinearProgressIndicator(color: AppColors.KMainColor,),
                                GestureDetector(
                                    onTap: (){
                                      AppNavigator(context, false, RegisterScreen());
                                    },
                                    child: Container(
                                        child:
                                        const Text('Register Now',
                                          style: TextStyle(
                                              color: AppColors.KMainColor
                                          ),
                                        )
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
);
  }
}

