import 'dart:io';

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:hosta_user/core/resource/common_state_widget/unAuth_state_widget.dart';
import 'package:hosta_user/features/profile_page/presentation/bloc/delete_account_bloc.dart';
import 'package:hosta_user/features/profile_page/presentation/widgets/city_field.dart';
import 'package:hosta_user/features/profile_page/presentation/widgets/country_field.dart';
import 'package:hosta_user/features/profile_page/presentation/widgets/delete_account_widget.dart';
import '../../../../config/app/app_preferences.dart';
import '../../../../config/route/routes_manager.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/font_constants.dart';
import '../../../../core/dependencies_injection.dart';
import '../../../../core/resource/common_state_widget/error_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_data_state_widget.dart';
import '../../../../core/resource/common_state_widget/no_internet_state_widget.dart';
import '../../../../core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import '../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import '../../../../core/resource/image_widget.dart';
import '../../../../core/resource/main_page/main_page.dart';
import '../../../../core/resource/validator.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../login_page/domain/entities/login_state_entity.dart';
import '../../data/models/language_model.dart';
import '../../data/models/profile_model.dart';
import '../../data/models/set_profile_model.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/working_hours_entity.dart';
import '../bloc/get_profile_bloc.dart';

import '../widgets/account_info_row_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import 'package:image_picker/image_picker.dart';

import '../../../signup_page/data/models/city_model.dart';
import '../../../signup_page/domain/entities/city_entity.dart';
import '../../../signup_page/presentation/bloc/get_cities_bloc.dart';

class AccountPagePage extends StatefulWidget {
  const AccountPagePage({super.key});

  @override
  State<AccountPagePage> createState() => _AccountPagePageState();
}

class _AccountPagePageState extends State<AccountPagePage> {
  ProfileModel profileModel = ProfileModel();
  SetProfileModel setProfileModel = SetProfileModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<WorkingHoursEntity?>? workingHours = [];
  bool? workingTimeWidgetCanEdit = false;
  LanguageModel languageModel = LanguageModel();
  String? birthDate;
  bool languagesCanEdit = false;
  bool isArabicLanguageSelected = false;
  bool isEnglishLanguageSelected = false;
  bool isKurdishLanguageSelected = false;
  bool isAvatarChanged = false;
  bool isDobChanged = false;
  bool isPhoneChanged = false;
  bool isEmailChanged = false;
  bool isNameChanged = false;
  bool isCityChanged = false;
  bool isAddressChanged = false;
  bool isCityEnabled = false;
  bool isCountryChanged = false;
  bool isLocationChanged = false;
  int? countryId;
  String? lat;
  String? lng;
  String? country;

  String? city;
  String? acceptLanguage;
  List<CityEntity?>? governmentList = [];
  String? initialCity;
  String? initialCountry;
  String? initialLat;
  String? initialLng;
  String? initialAvatar;
  String? avatarUrl;
  bool animationDone = false;
  String? password;
  GlobalKey<FormState> deleteAccountFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    profileModel = profileModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
      profile: setProfileModel,
    );
    languageModel = languageModel.copyWith(
      acceptLanguage: Helper.getCountryCode(context),
    );
    acceptLanguage = Helper.getCountryCode(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      onAnimationComplete: (value) => setState(() {
        animationDone = value;
      }),
      title: LocaleKeys.profilePage_account.tr(),
      body: BlocProvider<GetProfileBloc>(
        create: (context) =>
            getItInstance<GetProfileBloc>()
              ..add(GetProfileEvent.getProfile(profileModel: profileModel)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Text(
                LocaleKeys.profilePage_myAccount.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontFamily: FontConstants.fontFamily(context.locale),
                ),
              ),
            ),
            BlocListener<GetProfileBloc, GetProfileState>(
              listener: (context, state) {
                if (state is GetProfileStateUpdateError) {
                  showMessage(
                    context: context,
                    message:
                        state.message ??
                        LocaleKeys.common_anErrorHasOccurs.tr(),
                  );
                  context.read<GetProfileBloc>().add(
                    GetProfileEvent.getProfile(profileModel: profileModel),
                  );
                  setState(() {
                    isAddressChanged = false;
                    isCityChanged = false;
                    isPhoneChanged = false;
                    isEmailChanged = false;
                    isDobChanged = false;
                    isNameChanged = false;
                    isAvatarChanged = false;
                    isCountryChanged = false;
                    isLocationChanged = false;
                    country = initialCountry;
                    lat = initialLat;
                    lng = initialLng;
                    city = initialCity;
                    avatarUrl = null;
                    setProfileModel = SetProfileModel();
                    profileModel = profileModel.copyWith(
                      profile: setProfileModel,
                    );
                  });
                } else if (state is GetProfileStateUpdated) {
                  showMessage(
                    context: context,
                    message: LocaleKeys.common_success.tr(),
                  );
                  context.read<GetProfileBloc>().add(
                    GetProfileEvent.getProfile(profileModel: profileModel),
                  );
                  setState(() {
                    isAddressChanged = false;
                    isCityChanged = false;
                    isPhoneChanged = false;
                    isEmailChanged = false;
                    isDobChanged = false;
                    isNameChanged = false;
                    isAvatarChanged = false;
                    isCountryChanged = false;
                    isLocationChanged = false;
                    country =
                        state
                            .profileEntity
                            ?.addresses
                            ?.first?["country"]?["name"] ??
                        initialCountry;
                    lat =
                        state.profileEntity?.addresses?.first?["lat"] ??
                        initialLat;
                    lng =
                        state.profileEntity?.addresses?.first?["lng"] ??
                        initialLng;
                    city =
                        state
                            .profileEntity
                            ?.addresses
                            ?.first?["city"]?["name"] ??
                        initialCity;
                    avatarUrl = null;
                    setProfileModel = SetProfileModel();
                    profileModel = profileModel.copyWith(
                      profile: setProfileModel,
                    );
                  });
                } else if (state is GetProfileStateNoInternet) {
                  showMessage(
                    context: context,
                    message: LocaleKeys.common_noInternetPullDown.tr(),
                  );
                  context.read<GetProfileBloc>().add(
                    GetProfileEvent.getProfile(profileModel: profileModel),
                  );
                  setState(() {
                    isAddressChanged = false;
                    isCityChanged = false;
                    isPhoneChanged = false;
                    isEmailChanged = false;
                    isDobChanged = false;
                    isNameChanged = false;
                    isAvatarChanged = false;
                    isCountryChanged = false;
                    isLocationChanged = false;
                    country = initialCountry;
                    lat = initialLat;
                    lng = initialLng;
                    city = initialCity;
                    avatarUrl = null;
                    setProfileModel = SetProfileModel();
                    profileModel = profileModel.copyWith(
                      profile: setProfileModel,
                    );
                  });
                } else if (state is GetProfileStateUnauthorized) {
                  getItInstance<AppPreferences>().setUserInfo(
                    loginStateEntity: LoginStateEntity(),
                  );
                  setState(() {
                    isAddressChanged = false;
                    isCityChanged = false;
                    isPhoneChanged = false;
                    isEmailChanged = false;
                    isDobChanged = false;
                    isNameChanged = false;
                    isAvatarChanged = false;
                    isCountryChanged = false;
                    isLocationChanged = false;
                    city = initialCity;
                    country = initialCountry;
                    lat = initialLat;
                    lng = initialLng;
                    avatarUrl = null;
                    setProfileModel = SetProfileModel();
                    profileModel = profileModel.copyWith(
                      profile: setProfileModel,
                    );
                  });
                  context.pushNamed(RoutesName.loginPage);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child:
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: BlocBuilder<GetProfileBloc, GetProfileState>(
                        key: ValueKey(animationDone),
                        buildWhen: (prev, curr) => animationDone,
                        builder: (context, state) {
                          return state.when(
                            initial: () =>
                                Center(child: CircularProgressIndicator()),
                            loading: () =>
                                Center(child: CircularProgressIndicator()),
                            loaded: (data) {
                              final LoginStateEntity? userInfo =
                                  getItInstance<AppPreferences>().getUserInfo();
                              Map<String, dynamic>? userMap = {
                                "name": data?.name,
                                "email": data?.email,
                                "phone": data?.phone,
                                "dob": data?.dob,
                                "avatar": data?.avatar,
                              };

                              getItInstance<AppPreferences>().setUserInfo(
                                loginStateEntity: userInfo?.copyWith(
                                  user: userMap,
                                ),
                              );
                              initialAvatar =
                                  avatarUrl ??
                                  data?.avatar ??
                                  "https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png";
                              initialCity =
                                  data?.addresses?.first?["city"]?["name"] ??
                                  "";
                              initialCountry =
                                  data?.addresses?.first?["country"]?["name"] ??
                                  "";
                              initialLat =
                                  data?.addresses?.first?["lat"]?.toString() ??
                                  "";
                              initialLng =
                                  data?.addresses?.first?["lng"]?.toString() ??
                                  "";
                              return Form(
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        key: ValueKey(avatarUrl),
                                        radius: 50.r,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: ClipOval(
                                                child:
                                                    (isAvatarChanged &&
                                                        avatarUrl != null)
                                                    ? Image.file(
                                                        errorBuilder:
                                                            (
                                                              context,
                                                              error,
                                                              stackTrace,
                                                            ) {
                                                              return ImageWidget(
                                                                imageUrl:
                                                                    data?.avatar ??
                                                                    "https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png",
                                                              );
                                                            },
                                                        key: ValueKey(
                                                          avatarUrl,
                                                        ),
                                                        File(avatarUrl ?? ""),
                                                        width: 100.r,
                                                        height: 100.r,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : ImageWidget(
                                                        boxFit: BoxFit.cover,
                                                        imageUrl:
                                                            data?.avatar ??
                                                            "https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png",
                                                      ),
                                              ),
                                            ),
                                            PositionedDirectional(
                                              top: 0,
                                              start: 0,

                                              child: SizedBox(
                                                width: 30.w,
                                                height: 30.h,
                                                child: ElevatedButton(
                                                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                          Colors.transparent,
                                                        ),
                                                    shadowColor:
                                                        WidgetStatePropertyAll(
                                                          Colors.transparent,
                                                        ),
                                                    padding:
                                                        WidgetStatePropertyAll(
                                                          EdgeInsets.zero,
                                                        ),
                                                    shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                        side: Theme.of(context)
                                                            .defaultBorderSide
                                                            .copyWith(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primary,
                                                            ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12.r,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      isAvatarChanged = true;
                                                    });
                                                    final ImagePicker picker =
                                                        ImagePicker();
                                                    final XFile? image =
                                                        await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          imageQuality: 60,
                                                        );

                                                    final File? imageFile =
                                                        image != null
                                                        ? File(image.path)
                                                        : null;
                                                    profileModel = profileModel
                                                        .copyWith(
                                                          profile: setProfileModel
                                                              .copyWith(
                                                                avatar:
                                                                    imageFile,
                                                              ),
                                                        );
                                                    setState(() {
                                                      avatarUrl = image?.path;
                                                    });
                                                  },
                                                  child:
                                                      Container(
                                                        height: 30.h,
                                                        width: 30.w,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 4.w,
                                                              vertical: 4.h,
                                                            ),
                                                        child: Icon(
                                                          Icons.edit_outlined,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge
                                                                  ?.color,
                                                          size: 20.sp,
                                                        ),
                                                      ).asGlass(
                                                        frosted: true,
                                                        blurX: 8,
                                                        blurY: 8,
                                                        tintColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                                .withValues(
                                                                  alpha: 0.9,
                                                                ),
                                                        clipBorderRadius:
                                                            BorderRadius.circular(
                                                              12.r,
                                                            ),
                                                        border: Theme.of(context)
                                                            .defaultBorderSide
                                                            .copyWith(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .primary,
                                                            ),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //name
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: AccountInfoRowWidget(
                                        key: ValueKey(isNameChanged),
                                        onEdit: () {
                                          setState(() {
                                            isNameChanged = true;
                                          });
                                        },
                                        onChanged: (value) {
                                          setProfileModel = setProfileModel
                                              .copyWith(name: value);
                                          profileModel = profileModel.copyWith(
                                            profile: setProfileModel,
                                          );
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.toString().trim().isEmpty) {
                                            return LocaleKeys
                                                .loginPage_nameIsRequired
                                                .tr();
                                          }
                                          return null;
                                        },
                                        profileEntity:
                                            (profileModel.profile?.name
                                                    ?.toString()
                                                    .trim()
                                                    .isNotEmpty ??
                                                false)
                                            ? profileModel.profile?.name
                                            : data?.name,
                                        iconData: Icons.person_outline_outlined,
                                        label: LocaleKeys.profilePage_name.tr(),
                                      ),
                                    ),
                                    //dob
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      key: ValueKey(isDobChanged),
                                      child: AccountInfoRowWidget(
                                        key: ValueKey(birthDate),
                                        onChanged: (value) {
                                          setState(() {
                                            isDobChanged = true;
                                            setProfileModel = setProfileModel
                                                .copyWith(dob: value);
                                            profileModel = profileModel
                                                .copyWith(
                                                  profile: setProfileModel,
                                                );
                                          });
                                        },
                                        onEdit: () {
                                          setState(() {
                                            isDobChanged = !isDobChanged;
                                          });
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime(
                                              DateTime.now().year - 18,
                                            ),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(
                                              DateTime.now().year - 18,
                                            ),
                                          ).then((selectedDate) {
                                            if (selectedDate != null) {
                                              setState(() {
                                                birthDate = DateFormat(
                                                  'yyyy-MM-dd',
                                                ).format(selectedDate);

                                                setProfileModel =
                                                    setProfileModel.copyWith(
                                                      dob: birthDate,
                                                    );
                                                profileModel = profileModel
                                                    .copyWith(
                                                      profile: setProfileModel,
                                                    );
                                              });
                                            }
                                          });
                                          formKey.currentState?.reset();
                                          isDobChanged = true;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.toString().trim().isEmpty) {
                                            return LocaleKeys
                                                .loginPage_dateOfBirthIsRequired
                                                .tr();
                                          }
                                          return null;
                                        },
                                        profileEntity:
                                            (profileModel.profile?.dob
                                                    ?.toString()
                                                    .trim()
                                                    .isNotEmpty ??
                                                false)
                                            ? profileModel.profile?.dob
                                            : data?.dob,
                                        iconData: Icons.cake_outlined,
                                        label: LocaleKeys.profilePage_dob.tr(),
                                      ),
                                    ),
                                    //email
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: AccountInfoRowWidget(
                                        key: ValueKey(isEmailChanged),
                                        onEdit: () {
                                          setState(() {
                                            isEmailChanged = true;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            isEmailChanged = true;
                                          });
                                          setProfileModel = setProfileModel
                                              .copyWith(email: value);
                                          profileModel = profileModel.copyWith(
                                            profile: setProfileModel,
                                          );
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.toString().trim().isEmpty) {
                                            return LocaleKeys
                                                .loginPage_emailIsRequired
                                                .tr();
                                          }
                                          if (!RegExp(
                                            Validator.emailRegex,
                                          ).hasMatch(value)) {
                                            return Validator.emailExample;
                                          }
                                          return null;
                                        },
                                        profileEntity: data?.email,
                                        iconData: Icons.email_outlined,
                                        label: LocaleKeys.profilePage_email
                                            .tr(),
                                      ),
                                    ),
                                    //phone
                                    AccountInfoRowWidget(
                                      onEdit: () {
                                        setState(() {
                                          isPhoneChanged = true;
                                        });
                                      },
                                      onChanged: (value) {
                                        setProfileModel = setProfileModel
                                            .copyWith(phone: value);
                                        profileModel = profileModel.copyWith(
                                          profile: setProfileModel,
                                        );
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value.toString().trim().length <
                                                10) {
                                          return LocaleKeys
                                              .loginPage_mobileIsRequired
                                              .tr();
                                        }
                                        return null;
                                      },
                                      profileEntity: data?.phone,
                                      iconData: Icons.phone_outlined,
                                      label: LocaleKeys.profilePage_phone.tr(),
                                    ),
                                    //country
                                    CountryField(
                                      onCountryIdChanged: (value) {
                                        setState(() {
                                          isCountryChanged = true;
                                          countryId = int.parse(value ?? "0");
                                        });
                                        setProfileModel = setProfileModel
                                            .copyWith(
                                              country_id: int.parse(
                                                value ?? "0",
                                              ),
                                            );
                                        profileModel = profileModel.copyWith(
                                          profile: setProfileModel,
                                        );
                                      },
                                      initialCountryName:
                                          country ?? initialCountry,
                                    ),
                                    //city
                                    Padding(
                                      padding: EdgeInsets.symmetric(),
                                      child: CityField(
                                        key: ValueKey(countryId),
                                        selectedCountryId: countryId,
                                        initialCityName: city ?? initialCity,
                                        onCityIdChanged: (value) {
                                          setState(() {
                                            isCityChanged = true;
                                          });
                                          setProfileModel = setProfileModel
                                              .copyWith(
                                                city_id: int.parse(
                                                  value ?? "0",
                                                ),
                                              );
                                          profileModel = profileModel.copyWith(
                                            profile: setProfileModel,
                                          );
                                        },
                                      ),
                                    ),
                                    //address
                                    SizedBox(
                                      child: AccountInfoRowWidget(
                                        key: ValueKey(setProfileModel.address),
                                        onEdit: () {
                                          setState(() {
                                            isAddressChanged = true;
                                          });
                                        },
                                        onChanged: (value) {
                                          setProfileModel = setProfileModel
                                              .copyWith(address: value);
                                          profileModel = profileModel.copyWith(
                                            profile: setProfileModel,
                                          );
                                        },
                                        validator: (value) => null,
                                        profileEntity:
                                            (profileModel.profile?.address
                                                    ?.toString()
                                                    .trim()
                                                    .isNotEmpty ??
                                                false)
                                            ? profileModel.profile?.address
                                            : data
                                                  ?.addresses
                                                  ?.first?["address"],
                                        iconData: Icons.home_outlined,
                                        label: LocaleKeys.profilePage_address
                                            .tr(),
                                      ),
                                    ),
                                    if (isAddressChanged ||
                                        isCountryChanged ||
                                        isCityChanged ||
                                        isPhoneChanged ||
                                        isEmailChanged ||
                                        isDobChanged ||
                                        isAvatarChanged ||
                                        isNameChanged)
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: SizedBox(
                                          width: double.maxFinite,
                                          height: 40.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  return SizedBox(
                                                    width: 100.w,
                                                    child: ElevatedButton(
                                                      style: Theme.of(context)
                                                          .elevatedButtonTheme
                                                          .style
                                                          ?.copyWith(
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                  Colors
                                                                      .transparent,
                                                                ),
                                                            shadowColor:
                                                                WidgetStatePropertyAll(
                                                                  Colors
                                                                      .transparent,
                                                                ),
                                                            padding:
                                                                WidgetStatePropertyAll(
                                                                  EdgeInsets
                                                                      .zero,
                                                                ),
                                                          ),
                                                      onPressed: () {
                                                        if (formKey.currentState
                                                                ?.validate() ??
                                                            false) {
                                                          context
                                                              .read<
                                                                GetProfileBloc
                                                              >()
                                                              .add(
                                                                GetProfileEvent.updateProfile(
                                                                  profileModel:
                                                                      profileModel,
                                                                ),
                                                              );
                                                        }
                                                      },
                                                      child:
                                                          Container(
                                                            width: 100.w,
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      4.w,
                                                                  vertical: 4.h,
                                                                ),
                                                            child: Center(
                                                              child: Text(
                                                                LocaleKeys
                                                                    .common_save
                                                                    .tr(),
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .labelLarge
                                                                    ?.copyWith(
                                                                      fontFamily:
                                                                          FontConstants.fontFamily(
                                                                            context.locale,
                                                                          ),
                                                                    ),
                                                              ),
                                                            ),
                                                          ).asGlass(
                                                            frosted: true,
                                                            blurX: 38,
                                                            blurY: 38,
                                                            tintColor:
                                                                Theme.of(
                                                                      context,
                                                                    )
                                                                    .colorScheme
                                                                    .primary
                                                                    .withValues(
                                                                      alpha:
                                                                          0.9,
                                                                    ),
                                                            clipBorderRadius:
                                                                BorderRadius.circular(
                                                                  12.r,
                                                                ),
                                                            border: Theme.of(
                                                              context,
                                                            ).defaultBorderSide,
                                                          ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: ElevatedButton(
                                                  style: Theme.of(context)
                                                      .elevatedButtonTheme
                                                      .style
                                                      ?.copyWith(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                        shadowColor:
                                                            WidgetStatePropertyAll(
                                                              Colors
                                                                  .transparent,
                                                            ),
                                                        padding:
                                                            WidgetStatePropertyAll(
                                                              EdgeInsets.zero,
                                                            ),
                                                      ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isAddressChanged = false;
                                                      isCityChanged = false;
                                                      isPhoneChanged = false;
                                                      isEmailChanged = false;
                                                      isDobChanged = false;
                                                      isNameChanged = false;
                                                      isAvatarChanged = false;
                                                      city = initialCity;
                                                      avatarUrl = null;
                                                      setProfileModel =
                                                          SetProfileModel();
                                                      profileModel =
                                                          profileModel.copyWith(
                                                            profile:
                                                                setProfileModel,
                                                          );
                                                    });
                                                  },
                                                  child:
                                                      Container(
                                                        width: 100.w,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 4.w,
                                                              vertical: 4.h,
                                                            ),
                                                        child: Center(
                                                          child: Text(
                                                            LocaleKeys
                                                                .common_cancel
                                                                .tr(),
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .labelLarge
                                                                ?.copyWith(
                                                                  fontFamily:
                                                                      FontConstants.fontFamily(
                                                                        context
                                                                            .locale,
                                                                      ),
                                                                ),
                                                          ),
                                                        ),
                                                      ).asGlass(
                                                        frosted: true,
                                                        blurX: 8,
                                                        blurY: 8,
                                                        tintColor: Theme.of(
                                                          context,
                                                        ).colorScheme.error,
                                                        clipBorderRadius:
                                                            BorderRadius.circular(
                                                              12.r,
                                                            ),
                                                        border: Theme.of(
                                                          context,
                                                        ).defaultBorderSide,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                            error: (error) => SizedBox(
                              height: 200.h,
                              child: ErrorStateWidget(),
                            ),
                            noInternet: () => SizedBox(
                              height: 200.h,
                              child: NoInternetStateWidget(),
                            ),
                            noData: () => SizedBox(
                              height: 200.h,
                              child: NodataStateWidget(),
                            ),
                            unauthorized: () => SizedBox(
                              height: 200.h,
                              child: UnauthStateWidget(),
                            ),
                            loggedOut: () => SizedBox(),
                            logoutError: (String? message) => SizedBox(),
                            updated: (ProfileEntity? profileEntity) => SizedBox(
                              height: 200.h,
                              child: NodataStateWidget(),
                            ),
                            updateError: (String? message) => SizedBox(
                              height: 200.h,
                              child: ErrorStateWidget(),
                            ),
                          );
                        },
                      ),
                    ).asGlass(
                      frosted: true,
                      blurX: 38,
                      blurY: 38,
                      tintColor: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.9),
                      clipBorderRadius: BorderRadius.circular(12.r),
                      border: Theme.of(context).defaultBorderSide,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child:
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: BlocProvider(
                      create: (context) =>
                          getItInstance<DeleteAccountBloc>()
                            ..add(DeleteAccountEvent.started()),
                      child: BlocListener<DeleteAccountBloc, DeleteAccountState>(
                        listener: (context, state) async {
                          if (state is DeleteAccountStateSuccess) {
                            showMessage(
                              message: LocaleKeys.common_success.tr(),
                              context: context,
                            );
                            setState(() {
                              password = null;
                            });
                            context.pop();
                          } else if (state is DeleteAccountStateFailure) {
                            showMessage(
                              message: LocaleKeys.common_error.tr(),
                              context: context,
                            );
                            setState(() {
                              password = null;
                            });
                          } else if (state
                              is DeleteAccountStateUnauthenticated) {
                            await getItInstance<AppPreferences>().setUserInfo(
                              loginStateEntity: LoginStateEntity(),
                            );
                            setState(() {
                              password = null;
                            });
                          }
                        },
                        child: BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                          buildWhen: (previous, current) => animationDone,
                          builder: (bContext, state) => state.when(
                            initial: () => Builder(
                              builder: (context) {
                                return DeleteAccountWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: bContext,

                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor
                                              .withValues(alpha: 0.7),
                                          title: Text(
                                            LocaleKeys.profilePage_areYouSure
                                                .tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  fontFamily:
                                                      FontConstants.fontFamily(
                                                        context.locale,
                                                      ),
                                                ),
                                          ),
                                          content: SizedBox(
                                            height: 200.h,
                                            child: Form(
                                              key: deleteAccountFormKey,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    LocaleKeys
                                                        .profilePage_deleteAccountWarning
                                                        .tr(),

                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge
                                                        ?.copyWith(
                                                          fontFamily:
                                                              FontConstants.fontFamily(
                                                                context.locale,
                                                              ),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 12.h,
                                                        ),
                                                    child: CustomInputField(
                                                      label: LocaleKeys
                                                          .loginPage_password
                                                          .tr(),
                                                      obscureText: true,
                                                      onChanged: (value) {
                                                        password = value
                                                            .toString();
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value
                                                                .toString()
                                                                .trim()
                                                                .isEmpty) {
                                                          return LocaleKeys
                                                              .loginPage_passwordIsRequired
                                                              .tr();
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                LocaleKeys.common_cancel.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed:
                                                  deleteAccountFormKey
                                                          .currentState
                                                          ?.validate() ??
                                                      false
                                                  ? () {
                                                      print(
                                                        "pressed ok:$password",
                                                      );
                                                      bContext
                                                          .read<
                                                            DeleteAccountBloc
                                                          >()
                                                          .add(
                                                            DeleteAccountEvent.deleteAccount(
                                                              profileModel:
                                                                  ProfileModel(
                                                                    password:
                                                                        password,
                                                                  ),
                                                            ),
                                                          );
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    }
                                                  : () {
                                                      showMessage(
                                                        message: LocaleKeys
                                                            .loginPage_passwordIsRequired
                                                            .tr(),
                                                        context: context,
                                                      );
                                                    },
                                              child: Text(
                                                LocaleKeys.common_ok.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            loading: () => ElevatedButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            success: () => Builder(
                              builder: (context) {
                                return DeleteAccountWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor
                                              .withValues(alpha: 0.7),
                                          title: Text(
                                            LocaleKeys.profilePage_areYouSure
                                                .tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  fontFamily:
                                                      FontConstants.fontFamily(
                                                        context.locale,
                                                      ),
                                                ),
                                          ),
                                          content: SizedBox(
                                            height: 200.h,
                                            child: Form(
                                              key: deleteAccountFormKey,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    LocaleKeys
                                                        .profilePage_deleteAccountWarning
                                                        .tr(),

                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge
                                                        ?.copyWith(
                                                          fontFamily:
                                                              FontConstants.fontFamily(
                                                                context.locale,
                                                              ),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 12.h,
                                                        ),
                                                    child: CustomInputField(
                                                      label: LocaleKeys
                                                          .loginPage_password
                                                          .tr(),
                                                      obscureText: true,
                                                      onChanged: (value) {
                                                        password = value
                                                            .toString();
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value
                                                                .toString()
                                                                .trim()
                                                                .isEmpty) {
                                                          return LocaleKeys
                                                              .loginPage_passwordIsRequired
                                                              .tr();
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                LocaleKeys.common_cancel.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed:
                                                  deleteAccountFormKey
                                                          .currentState
                                                          ?.validate() ??
                                                      false
                                                  ? () {
                                                      print(
                                                        "pressed ok:$password",
                                                      );
                                                      bContext
                                                          .read<
                                                            DeleteAccountBloc
                                                          >()
                                                          .add(
                                                            DeleteAccountEvent.deleteAccount(
                                                              profileModel:
                                                                  ProfileModel(
                                                                    password:
                                                                        password,
                                                                  ),
                                                            ),
                                                          );
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    }
                                                  : () {
                                                      showMessage(
                                                        message: LocaleKeys
                                                            .loginPage_passwordIsRequired
                                                            .tr(),
                                                        context: context,
                                                      );
                                                    },
                                              child: Text(
                                                LocaleKeys.common_ok.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            failure: (e) => Builder(
                              builder: (context) {
                                return DeleteAccountWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor
                                              .withValues(alpha: 0.7),
                                          title: Text(
                                            LocaleKeys.profilePage_areYouSure
                                                .tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  fontFamily:
                                                      FontConstants.fontFamily(
                                                        context.locale,
                                                      ),
                                                ),
                                          ),
                                          content: SizedBox(
                                            height: 200.h,
                                            child: Form(
                                              key: deleteAccountFormKey,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    LocaleKeys
                                                        .profilePage_deleteAccountWarning
                                                        .tr(),

                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge
                                                        ?.copyWith(
                                                          fontFamily:
                                                              FontConstants.fontFamily(
                                                                context.locale,
                                                              ),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 12.h,
                                                        ),
                                                    child: CustomInputField(
                                                      label: LocaleKeys
                                                          .loginPage_password
                                                          .tr(),
                                                      obscureText: true,
                                                      onChanged: (value) {
                                                        password = value
                                                            .toString();
                                                      },
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value
                                                                .toString()
                                                                .trim()
                                                                .isEmpty) {
                                                          return LocaleKeys
                                                              .loginPage_passwordIsRequired
                                                              .tr();
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                LocaleKeys.common_cancel.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed:
                                                  deleteAccountFormKey
                                                          .currentState
                                                          ?.validate() ??
                                                      false
                                                  ? () {
                                                      print(
                                                        "pressed ok:$password",
                                                      );
                                                      bContext
                                                          .read<
                                                            DeleteAccountBloc
                                                          >()
                                                          .add(
                                                            DeleteAccountEvent.deleteAccount(
                                                              profileModel:
                                                                  ProfileModel(
                                                                    password:
                                                                        password,
                                                                  ),
                                                            ),
                                                          );
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    }
                                                  : () {
                                                      showMessage(
                                                        message: LocaleKeys
                                                            .loginPage_passwordIsRequired
                                                            .tr(),
                                                        context: context,
                                                      );
                                                    },
                                              child: Text(
                                                LocaleKeys.common_ok.tr(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontFamily:
                                                          FontConstants.fontFamily(
                                                            context.locale,
                                                          ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            unauthenticated: (e) => UnauthStateWidget(),
                            noInternet: () => NoInternetStateWidget(),
                          ),
                        ),
                      ),
                    ),
                  ).asGlass(
                    frosted: true,
                    blurX: 38,
                    blurY: 38,
                    tintColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.9),
                    clipBorderRadius: BorderRadius.circular(12.r),
                    border: Theme.of(context).defaultBorderSide,
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h, right: 20.w, left: 20.w),
              child:
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(RoutesPath.resetPasswordPage);
                      },
                      child: Text(
                        LocaleKeys.profilePage_resetPassword.tr(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                        ),
                      ),
                    ),
                  ).asGlass(
                    frosted: true,
                    blurX: 38,
                    blurY: 38,
                    tintColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.9),
                    clipBorderRadius: BorderRadius.circular(12.r),
                    border: Theme.of(context).defaultBorderSide,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
