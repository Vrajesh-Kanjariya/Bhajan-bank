import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constant/color_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/profile_controller.dart';
import '../../model/city_response.dart';
import '../../model/country_response.dart';
import '../../model/member_response.dart';
import '../../model/sign_up_response.dart';
import '../../model/state_response.dart';
import '../../pages/profile/profile_page.dart';
import '../../routes/app_navigation.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';
import '../../utils/validation_utils.dart';

class ProfileViewModel {
  late ProfilePage profilePage;
  ProfileController? profileController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController sureNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController plotNoController = TextEditingController();
  TextEditingController societyNameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<CountryInfoResponse> countryList = [];
  List<StateInfoResponse> stateList = [];
  List<CityInfoResponse> cityList = [];
  List<CountryInfoResponse> searchCountryList = [];
  List<StateInfoResponse> searchStateList = [];
  List<CityInfoResponse> searchCity = [];
  List<String> searchAge = [];
  CountryInfoResponse? selectedCountry;
  StateInfoResponse? selectedState = StateInfoResponse(stateId: 0, stateName: '');
  CityInfoResponse? selectedCity = CityInfoResponse(cityId: 0, cityName: '');
  SignUpResponse? signUpResponse;
  MemberInfoResponse? memberInfoResponse;
  XFile? imageFile;
  String imagePath = '';
  bool status = true;
  int value = 0;
  String surNameError = '',
      nameError = '',
      fatherNameError = '',
      dobError = '',
      emailError = '',
      plotNoError = '',
      socNameError = '',
      areaError = '',
      pinCodeError = '',
      countryError = '',
      stateError = '',
      ageError = '',
      cityError = '';
  List stepsNameList = ['Personal Info', 'Other Info'];
  int currentStep = 0;
  int totalSteps = 2;
  String? selectedAge;
  bool isUpdate = false;
  String memberId = '';
  String? fullName;
  String? mobileNo;
  bool profileStatus = false;
  bool isUserLogin = false;
  bool isReadOnly = false;

  List<String> ageList = [
    ("5-15"),
    ('15-25'),
    ('25-35'),
    ('35-45'),
    ('45-55'),
    ('55-65'),
    ('65-75'),
    ('75-85'),
    ('85-95'),
    ('95 above')
  ];

  ProfileViewModel(this.profilePage) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      profileController = Get.find<ProfileController>();
      memberId = await getPrefStringValue(memberIdKey) ?? '';
      profileStatus = await getPrefBoolValue(profileStatusKey);
      isUserLogin = await getPrefBoolValue(isUserLoginKey);
      mobileNo = await getPrefStringValue(mobileNoKey);
      await getArguments();
      getCountry();
      searchAge = ageList;
      getMemberData();
    });
  }

  getArguments() {
    isUpdate = Get.arguments['isUpdate'];
    memberInfoResponse = Get.arguments['memberInfoResponse'];
    isReadOnly = Get.arguments['isReadOnly'];
    logs('isUpdate --> $isUpdate');
    logs('isReadable --> $isReadOnly');
  }

  void getMemberData() {
    if (memberInfoResponse != null && isUpdate) {
      // for (var element in memberController!.memInfoList) {
      //   if (element.memberId == memberId) {
      //     memberInfoResponse = element;
      //     profileController!.update();
      //   }
      // }

      imagePath = memberInfoResponse!.profileImage;
      sureNameController.text = memberInfoResponse!.firstName;
      nameController.text = memberInfoResponse!.middleName;
      fatherNameController.text = memberInfoResponse!.lastName;
      selectedAge = memberInfoResponse!.age;
      emailAddressController.text = memberInfoResponse!.emailId;
      plotNoController.text = memberInfoResponse!.houseNo;
      societyNameController.text = memberInfoResponse!.address;
      areaController.text = memberInfoResponse!.mainArea;
      pinCodeController.text = memberInfoResponse!.pincode;
      selectedCountry = CountryInfoResponse(
          countryId: memberInfoResponse!.countryId,
          countyName: memberInfoResponse!.countryName,
          code: memberInfoResponse!.countryCode);
      selectedState = StateInfoResponse(
          stateId: memberInfoResponse!.stateId, stateName: memberInfoResponse!.stateName);
      selectedCity = CityInfoResponse(
          cityId: memberInfoResponse!.cityId, cityName: memberInfoResponse!.cityName);
      fullName = memberInfoResponse!.fullName;
      memberInfoResponse!.gender == 'male' ? value = 0 : value = 1;
      profileController!.refresh();
    } else {
      isUpdate = false;
      profileController!.refresh();
    }
  }

  void changeStepIndicator(int index) {
    if (profileViewModel!.stepsNameList[index] == 'Personal Info') {
      profileViewModel!.currentStep = 0;
    } else {
      checkStepOneValidation();
    }
    profileController!.refresh();
  }

  void selectAge(String val) {
    selectedAge = val;
    profileController!.update();
  }

  void updateAge(String val) {
    searchAge = ageList.where((element) {
      return element.toLowerCase().contains(val.toLowerCase());
    }).toList();
    profileController!.update();
  }

  void updateGender(int val) {
    value = val;
    profileController!.update();
  }

  Future<void> getCountry() async {
    CountryResponse? countryResponse = await profileController!.getCountry();
    countryList = (countryResponse!.info).cast<CountryInfoResponse>();
    searchCountryList = countryList;

    if (countryList.isNotEmpty) {
      setCountry(countryList.where((element) => element.code == '91').first);
    }
    setCountry(selectedCountry!);
    countryController.clear();
    stateController.clear();
    cityController.clear();
    profileController!.update();
  }

  void setCountry(CountryInfoResponse countryInfo) {
    selectedCountry = countryInfo;
    getState();
    searchCountryList = countryList;
    countryController.clear();
    stateController.clear();
    cityController.clear();
    profileController!.update();
  }

  Future<void> getState() async {
    StateResponse? stateResponse =
        await profileController!.getState({'countryId': selectedCountry!.countryId});
    stateList = (stateResponse!.info).cast<StateInfoResponse>();
    searchStateList = stateList;
    profileController!.update();
    if (stateList.isNotEmpty) {
      selectedState = stateList[0];
      setStateList(selectedState!);
      profileController!.update();
    }
    stateController.clear();
    cityController.clear();
  }

  void setStateList(StateInfoResponse stateInfo) {
    selectedState = stateInfo;
    getCity();
    searchStateList = stateList;
    stateController.clear();
    cityController.clear();
    profileController!.update();
  }

  Future<void> getCity() async {
    CityResponse? cityResponse = await profileController!
        .getCity({'countryId': selectedCountry!.countryId, 'stateId': selectedState!.stateId});

    cityList = (cityResponse!.info).cast<CityInfoResponse>();
    searchCity = cityList;
    profileController!.update();

    if (cityList.isNotEmpty) {
      selectedCity = cityList[0];
      setCity(selectedCity!);
      profileController!.update();
    }
    cityController.clear();
  }

  void setCity(CityInfoResponse cityInfo) {
    selectedCity = cityInfo;
    searchCity = cityList;
    cityController.clear();
    profileController!.update();
  }

  void updateCountry(String value) {
    searchCountryList = countryList.where((element) {
      return element.countyName.toLowerCase().contains(value.toLowerCase());
    }).toList();
    profileController!.update();
  }

  void updateState(String value) {
    searchStateList = stateList.where((element) {
      return element.stateName.toLowerCase().contains(value.toLowerCase());
    }).toList();
    profileController!.update();
  }

  void updateCity(String value) {
    searchCity = cityList.where((element) {
      return element.cityName.toLowerCase().contains(value.toLowerCase());
    }).toList();
    profileController!.update();
  }

  void getFromGallery() async {
    String path;
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 18000, maxWidth: 18000);
    if (file != null) {
      logs('File -->   ${file.path}');
      path = file.path;
      imageFile = XFile(file.path);
    } else {
      return;
    }
    if (path.isNotEmpty) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Image Crop',
              backgroundColor: BhajanColorConstant.appScaffold,
              toolbarColor: BhajanColorConstant.primary,
              toolbarWidgetColor: BhajanColorConstant.white,
              initAspectRatio: CropAspectRatioPreset.original,
              statusBarColor: BhajanColorConstant.primary,
              activeControlsWidgetColor: BhajanColorConstant.primary,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Image Crop',
          ),
        ],
      );
      if (croppedFile != null) {
        imagePath = croppedFile.path;
        logs("imagePath --> $imagePath");
        profileController!.refresh();
      }
    }
  }

  pickedDob(DateTime? pickedDate) async {
    if (pickedDate != null) {
      logs('pickedDate --> $pickedDate'); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      logs(
          'formattedDate --> $formattedDate'); //formatted date output using intl package =>  2021-03-16
      dateOfBirthController.text = formattedDate; //set output date to TextField value.
    } else {
      logs("Date is not selected");
    }
    profileController!.update();
  }

  void checkStepOneValidation(){
    if (ValidationUtils.validateEmptyController(sureNameController)) {
      surNameError = AppStringConstants.surnameError.tr;
    } else {
      surNameError = '';
    }
    if (ValidationUtils.validateEmptyController(nameController)) {
      nameError = AppStringConstants.nameError.tr;
    } else {
      nameError = '';
    }
    if (ValidationUtils.validateEmptyController(fatherNameController)) {
      fatherNameError = AppStringConstants.lastNameError.tr;
    } else {
      fatherNameError = '';
    }
    if(selectedAge == null){
      ageError = 'Please select your age';
    } else{
      ageError = '';
    }

    profileController!.update();
    if (surNameError.isEmpty &&
        nameError.isEmpty &&
        fatherNameError.isEmpty &&
        ageError.isEmpty){
      currentStep = 1;
      profileController!.update();
    }
  }

  Future<void> updateProfile() async {
    // if (ValidationUtils.validateEmptyController(plotNoController)) {
    //   plotNoError = AppStringConstants.plotNoError.tr;
    // } else {
    //   plotNoError = '';
    // }
    // if (ValidationUtils.validateEmptyController(societyNameController)) {
    //   socNameError = AppStringConstants.societyError.tr;
    // } else {
    //   socNameError = '';
    // }
    // if (ValidationUtils.validateEmptyController(areaController)) {
    //   areaError = AppStringConstants.areaError.tr;
    // } else {
    //   areaError = '';
    // }
    // if (ValidationUtils.validateEmptyController(pinCodeController)) {
    //   pinCodeError = AppStringConstants.pincodeError.tr;
    // } else {
    //   pinCodeError = '';
    // }
    // if (ValidationUtils.validateEmptyController(emailAddressController)) {
    //   emailError = AppStringConstants.emailError.tr;
    // } else {
    //   emailError = '';
    // }

    if (ValidationUtils.regexValidator(emailAddressController, ValidationUtils.emailRegExp)) {
      emailError = AppStringConstants.validEmail.tr;
    } else {
      emailError = '';
    }

    logs("surNameError --> $surNameError");
    logs("nameError --> $nameError");
    logs("fatherNameError --> $fatherNameError");
    logs("dobError --> $dobError");
    logs("socNameError --> $socNameError");
    logs("pinCodeError --> $pinCodeError");
    logs("emailError --> $emailError");
    logs("imagePath --> $imagePath");

    profileController!.update();
    if (surNameError.isEmpty &&
            nameError.isEmpty &&
            fatherNameError.isEmpty &&
            ageError.isEmpty &&
            emailError.isEmpty
        /* plotNoError.isEmpty &&
        socNameError.isEmpty &&
        pinCodeError.isEmpty &&
        emailError.isEmpty &&*/
        ) {
      Map<String, String> updateProfileMap = {
        'registerId': await getPrefStringValue(registerIdKey) ?? '',
        'memberId': isUpdate ? await getPrefStringValue(memberIdKey) ?? '' : '',
        'firstName': sureNameController.text,
        'middleName': nameController.text,
        'lastName': fatherNameController.text,
        'age': selectedAge!,
        'gender': value == 0 ? 'male' : 'female',
        'emailId': emailAddressController.text,
        'countryName': selectedCountry!.countyName,
        'stateName': selectedState!.stateName,
        'cityName': selectedCity!.cityName,
        'houseNo': plotNoController.text,
        'pincode': pinCodeController.text,
        'address': societyNameController.text,
        'mainArea': areaController.text,
      };

      if (isUpdate && imagePath.contains('http')) {
        updateProfileMap['profileImage'] = imagePath;
      }

      logs('updateProfileMap --> $updateProfileMap');

      signUpResponse = await profileController!.updateProfile(
          updateProfileMap, imagePath.contains('http') ? '' : 'profileImage', imagePath.contains('http') ? '' : imagePath);

      if (signUpResponse != null) {
        currentStep = 0;
        successToast(signUpResponse!.msg);
        disposeValue();
        if (isUpdate) {
          isReadOnly = true;
          profileController!.update();
          goToHome(2);
        } else {
          if (await getPrefBoolValue(isUserLoginKey) && await getPrefBoolValue(profileStatusKey)) {
            goToHome(0);
          } else {
            await setPrefBoolValue(profileStatusKey, true);
            await setPrefStringValue(memberIdKey, signUpResponse!.info);
            gotoWelcome();
          }
        }
      }
    }
  }

  void disposeValue() {
    value = 0;
    imagePath = '';
    imageFile = null;
    // profileViewModel = null;
    sureNameController.clear();
    nameController.clear();
    fatherNameController.clear();
    dateOfBirthController.clear();
    emailAddressController.clear();
    plotNoController.clear();
    societyNameController.clear();
    areaController.clear();
    pinCodeController.clear();
    countryController.clear();
    stateController.clear();
    cityController.clear();
    ageController.clear();
  }
}
