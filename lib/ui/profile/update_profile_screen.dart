import 'dart:io';


// class UpdateProfileScreen extends StatefulWidget {
//   const UpdateProfileScreen({Key key}) : super(key: key);

//   @override
//   _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
// }

// class _UpdateProfileScreenState extends State<UpdateProfileScreen>
//     with ValidationMixin {
//   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
//   double _width = 0, _height = 0;
//   String _userName, _userEmail, _userPhone, _userOldPassword, _userNewPassword;
//   AuthProvider _authProvider;
//   ApiProvider _apiProvider = ApiProvider();
//   final _formKey = GlobalKey<FormState>();
//   final _picker = ImagePicker();
//   File _imageFile;
//   String fileName;
//   bool _isLoading = false;

//   bool _initalRun = true;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_initalRun) {
//       _authProvider = Provider.of<AuthProvider>(context);
//       _userName = _authProvider.currentUser.name;
//       _userEmail = _authProvider.currentUser.email;
//       _userPhone = _authProvider.currentUser.phone;

//       _initalRun = false;
//     }
//   }

//   void _uploadImage(ImageSource source, BuildContext context) async {
//     try {
//       final pickedFile = await _picker.getImage(source: source);

//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });

//       if (_imageFile != null) {
//         fileName = Path.basename(_imageFile.path);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Widget _buildBody() {
//     return Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: GestureDetector(
//                   onTap: () {
//                     _uploadImage(ImageSource.gallery, context);
//                     print('upload');
//                   },
//                   child: _imageFile == null
//                       ? Stack(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.transparent,
//                                 backgroundImage:
//                                     _authProvider.currentUser.avatar == null
//                                         ? AssetImage(
//                                             'assets/images/camerared.png',
//                                           )
//                                         : NetworkImage(
//                                             _authProvider.currentUser.avatar,
//                                             scale: 1,
//                                           ),
//                               ),
//                             ),
//                             Positioned(
//                                 bottom: 0,
//                                 right: 0,
//                                 child:
//                                     Image.asset('assets/images/camerared.png'))
//                           ],
//                         )
//                       : Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: _width * 0.06,
//                               vertical: _height * 0.02),
//                           height: 100,
//                           width: 100,
//                           child: CircleAvatar(
//                               backgroundImage:
//                                   FileImage(File(_imageFile.path))),
//                         )),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   vertical: _height * 0.01, horizontal: _width * 0.04),
//               child: Text(
//                 'اسم المستخدم',
//                 style: TextStyle(
//                     color: secondryMainColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             CustomTextFormField(
//               enableBorder: false,
//               hasHorizontalMargin: true,
//               prefixIconIsImage: true,
//               prefixIconImagePath: "assets/images/username.png",
//               hintTxt: "اسم المستخدم",
//               initialValue: _userName,
//               onChangedFunc: (String text) {
//                 _userName = text;
//               },
//               validationFunc: validateUserName,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   vertical: _height * 0.01, horizontal: _width * 0.04),
//               child: Text(
//                 'البريد الالكتروني',
//                 style: TextStyle(
//                     color: secondryMainColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             CustomTextFormField(
//               enableBorder: false,
//               hasHorizontalMargin: true,
//               prefixIconIsImage: true,
//               prefixIconImagePath: "assets/images/mail.png",
//               hintTxt: "البريد الالكتروني",
//               initialValue: _userEmail,
//               onChangedFunc: (String text) {
//                 _userEmail = text;
//               },
//               validationFunc: validateUserEmail,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   vertical: _height * 0.01, horizontal: _width * 0.04),
//               child: Text(
//                 'رقم الجوال',
//                 style: TextStyle(
//                     color: secondryMainColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             CustomTextFormField(
//               enableBorder: false,
//               hasHorizontalMargin: true,
//               prefixIconIsImage: true,
//               prefixIconImagePath: "assets/images/phonein.png",
//               hintTxt: " رقم الجوال ",
//               // inputData: TextInputType.phone,
//               initialValue: _userPhone,
//               onChangedFunc: (String text) {
//                 _userPhone = text;
//               },
//               validationFunc: validateUserPhone,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   vertical: _height * 0.01, horizontal: _width * 0.04),
//               child: Text(
//                 'كلمة المرور القديمة',
//                 style: TextStyle(
//                     color: secondryMainColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             CustomTextFormField(
//               enableBorder: false,
//               hasHorizontalMargin: true,
//               prefixIconIsImage: true,
//               prefixIconImagePath: "assets/images/keyin.png",
//               hintTxt: "كلمة المرور القديمة",
//               isPassword: true,
//               onChangedFunc: (String text) {
//                 _userOldPassword = text;
//               },
//               validationFunc:
//                   _userOldPassword != null ? validateOldPassword : null,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   vertical: _height * 0.01, horizontal: _width * 0.04),
//               child: Text(
//                 'كلمة المرور الجديدة',
//                 style: TextStyle(
//                     color: secondryMainColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             CustomTextFormField(
//               hasHorizontalMargin: true,
//               prefixIconIsImage: true,
//               enableBorder: false,
//               prefixIconImagePath: "assets/images/keyin.png",
//               hintTxt: "كلمة المرور الجديدة",
//               isPassword: true,
//               onChangedFunc: (String text) {
//                 _userNewPassword = text;
//               },
//               validationFunc:
//                   _userOldPassword != null ? validatePassword : null,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   vertical: _height * 0.01, horizontal: _width * 0.04),
//               child: Text(
//                 'تأكيد المرور الجديدة',
//                 style: TextStyle(
//                     color: secondryMainColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//             CustomTextFormField(
//               enableBorder: false,
//               hasHorizontalMargin: true,
//               prefixIconIsImage: true,
//               prefixIconImagePath: "assets/images/keyin.png",
//               isPassword: true,
//               hintTxt: "تأكيد كلمة المرور",
//               validationFunc:
//                   _userNewPassword != null ? validateConfirmPassword : null,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             _isLoading
//                 ? SpinKitFadingCircle(color: mainAppColor)
//                 : CustomButton(
//                     // enableHorizontalMargin: true,
//                     btnLbl: "حفظ",
//                     height: 50,

//                     onPressedFunction: () {
//                       _updateProfile();
//                     },
//                   )
//           ],
//         ),
//       ),
//     );
//   }

//   _updateProfile() async {
//     print(_userName);
//     Map<String, dynamic> data = Map<String, dynamic>();
//     data['name'] = _userName;
//     data['email'] = _userEmail;
//     data['phone'] = _userPhone;
//     if (_userOldPassword != null) data['old_password'] = _userOldPassword;
//     if (_userNewPassword != null) data['password'] = _userNewPassword;
//     if (_userNewPassword != null)
//       data['password_confirmation'] = _userNewPassword;

//     if (_imageFile != null) {
//       data["avatar"] =
//           await MultipartFile.fromFile(_imageFile.path, filename: fileName);
//     }

//     FormData formData = FormData.fromMap(data);
//     if (_formKey.currentState.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       var result = await _apiProvider.postWithDio(Urls.UPDATE_PROFILE_URL,
//           headers: {
//             "Accept-Language": _authProvider.currentLang,
//             //'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer ${_authProvider.userToken}'
//           },
//           body: formData);
//       setState(() {
//         _isLoading = false;
//       });
//       print(result);
//       if (result['status_code'] == 200) {
//         print(result['response']);
//         _authProvider.setCurrentUser(User.fromJson(result['response']["data"]));
//         SharedPreferencesHelper.save("user", _authProvider.currentUser);
//         Commons.showToast(
//             context: context, message: 'تم تعديل البيانات الشخصية بنجاح');
//         Navigator.pop(context);
//       } else {
//         Commons.showError(
//             context: context, message: result['response']['message']);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _height = MediaQuery.of(context).size.height;
//     return NetworkIndicator(
//       child: PageContainer(
//         child: Scaffold(
//           backgroundColor: whiteColor,
//           key: _scaffoldKey,
//           drawer: DrawerMenu(),
//           appBar: CustomAppbar(
//             hasBackBtn: false,
//             hasnotification: true,
//             hasCenterLogo: false,
//             title: 'تعديل المعلومات الشخصية',
//             leadingWidget: IconButton(
//                 icon: Image(
//                   image: AssetImage(
//                     'assets/images/menu.png',
//                   ),
//                 ),
//                 onPressed: () => _scaffoldKey.currentState.openDrawer()),
//           ),
//           body: _buildBody(),
//         ),
//       ),
//     );
//   }
// }
