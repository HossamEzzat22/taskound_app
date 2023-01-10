import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/src/app_colors.dart';
import 'package:task_app/utils/app_navigator.dart';
import 'package:task_app/views/register_screen.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0.h,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF7B51D3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                AppColors.KMainColor,
                Color(0xFF3dc3fd),
                Color(0xFF00c0ff),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 580.h,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 175.h,
                              width: 220.w,
                              child: Text(
                                'Welcome To Taskound',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.mic_none_rounded,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                  Icon(Icons.image,
                                    color: Colors.white,
                                    size: 100,
                                  ),

                                ],
                              )
                              // Image(
                              //   image: AssetImage(
                              //     'https://e7.pngegg.com/pngimages/894/712/png-clipart-task-management-project-management-performance-management-business-text-service.png',
                              //   ),
                              //   height: 300.0,
                              //   width: 300.0,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              child:
                              Column(
                                children: [
                                  const Text(
                                    'Taskound',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'is the first task management app that lets you attach voice notes & images with your tasks',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    ),
                                  ),
                                  SizedBox(height: 40.h,),
                                ],
                              ),
                            ),
                            Center(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: const [
                                   Icon(Icons.mic_none_rounded,
                                     color: Colors.white,
                                     size: 100,
                                   ),
                                   Icon(Icons.image,
                                     color: Colors.white,
                                     size: 100,
                                   ),
                                 ],
                               )
                              // Image(
                              //   image: AssetImage(
                              //     'https://cdn-icons-png.flaticon.com/512/619/619607.png',
                              //   ),
                              //   height: 300.0,
                              //   width: 300.0,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                             Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.mic_none_rounded,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                  Icon(Icons.image,
                                    color: Colors.white,
                                    size: 100,
                                  ),

                                ],
                              )
                              // Image(
                              //   image: AssetImage(
                              //     'https://img.freepik.com/free-vector/podcast-content-abstract-concept-illustration_335657-1870.jpg',
                              //   ),
                              //   height: 300.0,
                              //   width: 300.0,
                              // ),
                            ),
                            SizedBox(height: 70.h,),
                            Container(
                              height: 175.h,
                              width: double.infinity,
                              child:  Column(
                                children: const [
                                  Text(
                                    'Now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40
                                    ),
                                  ),
                                  Text(
                                    'with taskound your tasks can hear their sound',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    ),
                                  ),

                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0.sp,
                            ),
                          ),
                          SizedBox(width: 10.0.w),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        color:const Color(0xFF5B16D0),
        height: 50.0.h,
        width: double.infinity,
        child: FlatButton(
          onPressed: (){
            AppNavigator(context, true, RegisterScreen());
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Get started',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      )
          : const Text(''),
    );
  }
}