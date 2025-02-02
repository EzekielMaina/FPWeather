import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/theme/store.dart';
import 'package:weather_app/theme/theme_service.dart';

enum TonalPalettes {
  primary,
  secondary,
  tertiary,
  error,
  neutral,
  neutralVariant,
}

class ThemeController with ChangeNotifier {
  ThemeController(this._themeService);

  final ThemeService _themeService;

  /// Load all ThemeController settings from the ThemeService. It may load from
  /// app coded defaults, a local database or the internet. The controller only
  /// knows it can load all the setting default values from the service.
  Future<void> loadAll() async {
    //
    // GENERAL SETTINGS.
    // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
    _themeMode =
        await _themeService.load(Store.keyThemeMode, Store.defaultThemeMode);
    _useFlexColorScheme = await _themeService.load(
        Store.keyUseFlexColorScheme, Store.defaultUseFlexColorScheme);
    _useSubThemes = await _themeService.load(
        Store.keyUseSubThemes, Store.defaultUseSubThemes);
    _useFlutterDefaults = await _themeService.load(
        Store.keyUseFlutterDefaults, Store.defaultUseFlutterDefaults);
    _isLargeGridView = await _themeService.load(
        Store.keyIsLargeGridView, Store.defaultIsLargeGridView);
    _viewIndex =
        await _themeService.load(Store.keyViewIndex, Store.defaultViewIndex);
    _useTextTheme = await _themeService.load(
        Store.keyUseTextTheme, Store.defaultUseTextTheme);
    _useAppFont =
        await _themeService.load(Store.keyUseAppFont, Store.defaultUseAppFont);
    _usedScheme =
        await _themeService.load(Store.keyUsedScheme, Store.defaultUsedScheme);
    _schemeIndex = await _themeService.load(
        Store.keySchemeIndex, Store.defaultSchemeIndex);
    _interactionEffects = await _themeService.load(
        Store.keyInteractionEffects, Store.defaultInteractionEffects);
    _defaultRadius = await _themeService.load(
      Store.keyDefaultRadius,
      Store.defaultDefaultRadius,
    );
    _defaultRadius = await _themeService.load(
      Store.keyDefaultRadius,
      Store.defaultDefaultRadius,
    );
    _thinBorderWidth = await _themeService.load(
      Store.keyThinBorderWidth,
      Store.defaultThinBorderWidth,
    );
    _thickBorderWidth = await _themeService.load(
      Store.keyThickBorderWidth,
      Store.defaultThickBorderWidth,
    );
    _tooltipsMatchBackground = await _themeService.load(
        Store.keyTooltipsMatchBackground, Store.defaultTooltipsMatchBackground);
    //
    // Surface and blend SETTINGS.
    _surfaceModeLight = await _themeService.load(
        Store.keySurfaceModeLight, Store.defaultSurfaceModeLight);
    _surfaceModeDark = await _themeService.load(
        Store.keySurfaceModeDark, Store.defaultSurfaceModeDark);
    _blendLevel =
        await _themeService.load(Store.keyBlendLevel, Store.defaultBlendLevel);
    _blendLevelDark = await _themeService.load(
        Store.keyBlendLevelDark, Store.defaultBlendLevelDark);
    _blendOnLevel = await _themeService.load(
        Store.keyOnBlendLevel, Store.defaultBlendOnLevel);
    _blendOnLevelDark = await _themeService.load(
        Store.keyBlendOnLevelDark, Store.defaultBlendOnLevelDark);
    _usedColors =
        await _themeService.load(Store.keyUsedColors, Store.defaultUsedColors);
    _swapLegacyColors = await _themeService.load(
        Store.keySwapLegacyColors, Store.defaultSwapLegacyColors);
    _swapLightColors = await _themeService.load(
        Store.keySwapLightColors, Store.defaultSwapLightColors);
    _swapDarkColors = await _themeService.load(
        Store.keySwapDarkColors, Store.defaultSwapDarkColors);
    _lightIsWhite = await _themeService.load(
        Store.keyLightIsWhite, Store.defaultLightIsWhite);
    _darkIsTrueBlack = await _themeService.load(
        Store.keyDarkIsTrueBlack, Store.defaultDarkIsTrueBlack);
    _useDarkColorsForSeed = await _themeService.load(
        Store.keyUseDarkColorsForSeed, Store.defaultUseDarkColorsForSeed);
    _useToDarkMethod = await _themeService.load(
        Store.keyUseToDarkMethod, Store.defaultUseToDarkMethod);
    _toDarkSwapPrimaryAndContainer = await _themeService.load(
        Store.keyToDarkSwapPrimaryAndContainer,
        Store.defaultToDarkSwapPrimaryAndContainer);
    _darkMethodLevel = await _themeService.load(
        Store.keyDarkMethodLevel, Store.defaultDarkMethodLevel);
    _blendLightOnColors = await _themeService.load(
        Store.keyBlendLightOnColors, Store.defaultBlendLightOnColors);
    _blendDarkOnColors = await _themeService.load(
        Store.keyBlendDarkOnColors, Store.defaultBlendDarkOnColors);
    _blendLightTextTheme = await _themeService.load(
        Store.keyBlendLightTextTheme, Store.defaultBlendLightTextTheme);
    _blendDarkTextTheme = await _themeService.load(
        Store.keyBlendDarkTextTheme, Store.defaultBlendDarkTextTheme);
    //
    // Material 3 and Seed ColorScheme SETTINGS.
    _useMaterial3 = await _themeService.load(
        Store.keyUseMaterial3, Store.defaultUseMaterial3);
    _useKeyColors = await _themeService.load(
        Store.keyUseKeyColors, Store.defaultUseKeyColors);
    _useSecondary = await _themeService.load(
        Store.keyUseSecondary, Store.defaultUseSecondary);
    _useTertiary = await _themeService.load(
        Store.keyUseTertiary, Store.defaultUseTertiary);
    _keepPrimary = await _themeService.load(
        Store.keyKeepPrimary, Store.defaultKeepPrimary);
    _keepSecondary = await _themeService.load(
        Store.keyKeepSecondary, Store.defaultKeepSecondary);
    _keepTertiary = await _themeService.load(
        Store.keyKeepTertiary, Store.defaultKeepTertiary);
    _keepPrimaryContainer = await _themeService.load(
        Store.keyKeepPrimaryContainer, Store.defaultKeepPrimaryContainer);
    _keepSecondaryContainer = await _themeService.load(
        Store.keyKeepSecondaryContainer, Store.defaultKeepSecondaryContainer);
    _keepTertiaryContainer = await _themeService.load(
        Store.keyKeepTertiaryContainer, Store.defaultKeepTertiaryContainer);
    _keepDarkPrimary = await _themeService.load(
        Store.keyKeepDarkPrimary, Store.defaultKeepDarkPrimary);
    _keepDarkSecondary = await _themeService.load(
        Store.keyKeepDarkSecondary, Store.defaultKeepDarkSecondary);
    _keepDarkTertiary = await _themeService.load(
        Store.keyKeepDarkTertiary, Store.defaultKeepDarkTertiary);
    _keepDarkPrimaryContainer = await _themeService.load(
        Store.keyKeepDarkPrimaryContainer,
        Store.defaultKeepDarkPrimaryContainer);
    _keepDarkSecondaryContainer = await _themeService.load(
        Store.keyKeepDarkSecondaryContainer,
        Store.defaultKeepDarkSecondaryContainer);
    _keepDarkTertiaryContainer = await _themeService.load(
        Store.keyKeepDarkTertiaryContainer,
        Store.defaultKeepDarkTertiaryContainer);
    _usedFlexToneSetup = await _themeService.load(
        Store.keyUsedFlexToneSetup, Store.defaultUsedFlexToneSetup);
    _useM3ErrorColors = await _themeService.load(
        Store.keyUseM3ErrorColors, Store.defaultUseM3ErrorColors);
    //
    _onMainsUseBWLight = await _themeService.load(
        Store.keyOnMainsUseBWLight, Store.defaultOnMainsUseBWLight);
    _onMainsUseBWDark = await _themeService.load(
        Store.keyOnMainsUseBWDark, Store.defaultOnMainsUseBWDark);
    _onSurfacesUseBWLight = await _themeService.load(
        Store.keyOnSurfacesUseBWLight, Store.defaultOnSurfacesUseBWLight);
    _onSurfacesUseBWDark = await _themeService.load(
        Store.keyOnSurfacesUseBWDark, Store.defaultOnSurfacesUseBWDark);
    //
    // InputDecorator SETTINGS.
    _inputDecoratorSchemeColorLight = await _themeService.load(
        Store.keyInputDecoratorSchemeColorLight,
        Store.defaultInputDecoratorSchemeColorLight);
    _inputDecoratorSchemeColorDark = await _themeService.load(
        Store.keyInputDecoratorSchemeColorDark,
        Store.defaultInputDecoratorSchemeColorDark);
    _inputDecoratorIsFilled = await _themeService.load(
        Store.keyInputDecoratorIsFilled, Store.defaultInputDecoratorIsFilled);
    _inputDecoratorBorderType = await _themeService.load(
        Store.keyInputDecoratorBorderType,
        Store.defaultInputDecoratorBorderType);
    _inputDecoratorBorderRadius = await _themeService.load(
        Store.keyInputDecoratorBorderRadius,
        Store.defaultInputDecoratorBorderRadius);
    _inputDecoratorUnfocusedHasBorder = await _themeService.load(
        Store.keyInputDecoratorUnfocusedHasBorder,
        Store.defaultInputDecoratorUnfocusedHasBorder);
    _inputDecoratorUnfocusedBorderIsColored = await _themeService.load(
        Store.keyInputDecoratorUnfocusedBorderIsColored,
        Store.defaultInputDecoratorUnfocusedBorderIsColored);
    _inputDecoratorBorderWidth = await _themeService.load(
        Store.keyInputDecoratorBorderWidth,
        Store.defaultInputDecoratorBorderWidth);
    _inputDecoratorFocusedBorderWidth = await _themeService.load(
        Store.keyInputDecoratorFocusedBorderWidth,
        Store.defaultInputDecoratorFocusedBorderWidth);
    //
    // AppBar SETTINGS.
    _appBarStyleLight = await _themeService.load(
        Store.keyAppBarStyleLight, Store.defaultAppBarStyleLight);
    _appBarStyleDark = await _themeService.load(
        Store.keyAppBarStyleDark, Store.defaultAppBarStyleDark);
    _appBarOpacityLight = await _themeService.load(
        Store.keyAppBarOpacityLight, Store.defaultAppBarOpacityLight);
    _appBarOpacityDark = await _themeService.load(
        Store.keyAppBarOpacityDark, Store.defaultAppBarOpacityDark);
    _appBarElevationLight = await _themeService.load(
        Store.keyAppBarElevationLight, Store.defaultAppBarElevationLight);
    _appBarElevationDark = await _themeService.load(
        Store.keyAppBarElevationDark, Store.defaultAppBarElevationDark);
    _transparentStatusBar = await _themeService.load(
        Store.keyTransparentStatusBar, Store.defaultTransparentStatusBar);
    _appBarBackgroundSchemeColorLight = await _themeService.load(
        Store.keyAppBarBackgroundSchemeColorLight,
        Store.defaultAppBarBackgroundSchemeColorLight);
    _appBarBackgroundSchemeColorDark = await _themeService.load(
        Store.keyAppBarBackgroundSchemeColorDark,
        Store.defaultAppBarBackgroundSchemeColorDark);
    //
    // TabBar SETTINGS.
    _tabBarStyle = await _themeService.load(
        Store.keyTabBarStyle, Store.defaultTabBarStyle);
    _tabBarIndicatorLight = await _themeService.load(
        Store.keyTabBarIndicatorLight, Store.defaultTabBarIndicatorLight);
    _tabBarIndicatorDark = await _themeService.load(
        Store.keyTabBarIndicatorDark, Store.defaultTabBarIndicatorDark);
    _tabBarItemSchemeColorLight = await _themeService.load(
        Store.keyTabBarItemSchemeColorLight,
        Store.defaultTabBarItemSchemeColorLight);
    _tabBarItemSchemeColorDark = await _themeService.load(
        Store.keyTabBarItemSchemeColorDark,
        Store.defaultTabBarItemSchemeColorDark);
    //
    // BottomSheet SETTINGS.
    //
    _bottomSheetSchemeColor = await _themeService.load(
        Store.keyBottomSheetSchemeColor, Store.defaultBottomSheetSchemeColor);
    _bottomSheetElevation = await _themeService.load(
        Store.keyBottomSheetElevation, Store.defaultBottomSheetElevation);
    _bottomSheetBorderRadius = await _themeService.load(
        Store.keyBottomSheetBorderRadius, Store.defaultBottomSheetBorderRadius);
    //
    // Android System Navigator bar SETTINGS.
    _sysNavBarStyle = await _themeService.load(
        Store.keySysNavBarStyle, Store.defaultSysNavBarStyle);
    _sysNavBarOpacity = await _themeService.load(
        Store.keySysNavBarOpacity, Store.defaultSysBarOpacity);
    _useSysNavDivider = await _themeService.load(
        Store.keyUseSysNavDivider, Store.defaultUseSysNavDivider);
    //
    // BottomNavigationBar SETTINGS.
    _bottomNavBarBackgroundSchemeColor = await _themeService.load(
        Store.keyBottomNavBarBackgroundSchemeColor,
        Store.defaultBottomNavBarBackgroundSchemeColor);
    _bottomNavigationBarOpacity = await _themeService.load(
        Store.keyBottomNavigationBarOpacity,
        Store.defaultBottomNavigationBarOpacity);
    _bottomNavigationBarElevation = await _themeService.load(
        Store.keyBottomNavigationBarElevation,
        Store.defaultBottomNavigationBarElevation);
    _bottomNavBarSelectedSchemeColor = await _themeService.load(
        Store.keyBottomNavBarSelectedItemSchemeColor,
        Store.defaultBottomNavBarSelectedItemSchemeColor);
    _bottomNavBarUnselectedSchemeColor = await _themeService.load(
        Store.keyBottomNavBarUnselectedSchemeColor,
        Store.defaultBottomNavBarUnselectedSchemeColor);
    _bottomNavBarMuteUnselected = await _themeService.load(
        Store.keyBottomNavBarMuteUnselected,
        Store.defaultBottomNavBarMuteUnselected);
    _bottomNavShowSelectedLabels = await _themeService.load(
        Store.keyBottomNavShowSelectedLabels,
        Store.defaultBottomNavShowSelectedLabels);
    _bottomNavShowUnselectedLabels = await _themeService.load(
        Store.keyBottomNavShowUnselectedLabels,
        Store.defaultBottomNavShowUnselectedLabels);
    //
    // NavigationBar SETTINGS.
    _navBarBackgroundSchemeColor = await _themeService.load(
        Store.keyNavBarBackgroundSchemeColor,
        Store.defaultNavBarBackgroundSchemeColor);
    _navBarOpacity = await _themeService.load(
        Store.keyNavBarOpacity, Store.defaultNavBarOpacity);
    _navigationBarElevation = await _themeService.load(
        Store.keyNavigationBarElevation, Store.defaultNavigationBarElevation);
    _navBarHeight = await _themeService.load(
        Store.keyNavBarHeight, Store.defaultNavBarHeight);
    _navBarSelectedSchemeColor = await _themeService.load(
        Store.keyNavBarSelectedItemSchemeColor,
        Store.defaultNavBarSelectedItemSchemeColor);
    _navBarUnselectedSchemeColor = await _themeService.load(
        Store.keyNavBarUnselectedSchemeColor,
        Store.defaultNavBarUnselectedSchemeColor);
    _navBarMuteUnselected = await _themeService.load(
        Store.keyNavBarMuteUnselected, Store.defaultNavBarMuteUnselected);
    _navBarIndicatorSchemeColor = await _themeService.load(
        Store.keyNavBarIndicatorSchemeColor,
        Store.defaultNavBarIndicatorSchemeColor);
    _navBarIndicatorOpacity = await _themeService.load(
        Store.keyNavBarIndicatorOpacity, Store.defaultNavBarIndicatorOpacity);
    _navBarLabelBehavior = await _themeService.load(
        Store.keyNavBarLabelBehavior, Store.defaultNavBarLabelBehavior);
    //
    // NavigationRail SETTINGS.
    _navRailBackgroundSchemeColor = await _themeService.load(
        Store.keyNavRailBackgroundSchemeColor,
        Store.defaultNavRailBackgroundSchemeColor);
    _navRailOpacity = await _themeService.load(
        Store.keyNavRailOpacity, Store.defaultNavRailOpacity);
    _navigationRailElevation = await _themeService.load(
        Store.keyNavigationRailElevation, Store.defaultNavigationRailElevation);
    _navRailSelectedSchemeColor = await _themeService.load(
        Store.keyNavRailSelectedItemSchemeColor,
        Store.defaultNavRailSelectedItemSchemeColor);
    _navRailUnselectedSchemeColor = await _themeService.load(
        Store.keyNavRailUnselectedSchemeColor,
        Store.defaultNavRailUnselectedSchemeColor);
    _navRailMuteUnselected = await _themeService.load(
        Store.keyNavRailMuteUnselected, Store.defaultNavRailMuteUnselected);
    _navRailLabelType = await _themeService.load(
        Store.keyNavRailLabelType, Store.defaultNavRailLabelType);
    _navRailUseIndicator = await _themeService.load(
        Store.keyNavRailUseIndicator, Store.defaultNavRailUseIndicator);
    _navRailIndicatorSchemeColor = await _themeService.load(
        Store.keyNavRailIndicatorSchemeColor,
        Store.defaultNavRailIndicatorSchemeColor);
    _navRailIndicatorOpacity = await _themeService.load(
        Store.keyNavRailIndicatorOpacity, Store.defaultNavRailIndicatorOpacity);
    //
    // Button SETTINGS.
    _textButtonSchemeColor = await _themeService.load(
        Store.keyTextButtonSchemeColor, Store.defaultTextButtonSchemeColor);
    _textButtonBorderRadius = await _themeService.load(
        Store.keyTextButtonBorderRadius, Store.defaultTextButtonBorderRadius);
    //
    _elevatedButtonSchemeColor = await _themeService.load(
        Store.keyElevatedButtonSchemeColor,
        Store.defaultElevatedButtonSchemeColor);
    _elevatedButtonSecondarySchemeColor = await _themeService.load(
        Store.keyElevatedButtonSecondarySchemeColor,
        Store.defaultElevatedButtonSecondarySchemeColor);
    _elevatedButtonBorderRadius = await _themeService.load(
        Store.keyElevatedButtonBorderRadius,
        Store.defaultElevatedButtonBorderRadius);
    //
    _outlinedButtonSchemeColor = await _themeService.load(
        Store.keyOutlinedButtonSchemeColor,
        Store.defaultOutlinedButtonSchemeColor);
    _outlinedButtonOutlineSchemeColor = await _themeService.load(
        Store.keyOutlinedButtonOutlineSchemeColor,
        Store.defaultOutlinedButtonOutlineSchemeColor);
    _outlinedButtonBorderRadius = await _themeService.load(
        Store.keyOutlinedButtonBorderRadius,
        Store.defaultOutlinedButtonBorderRadius);
    _outlinedButtonBorderWidth = await _themeService.load(
        Store.keyOutlinedButtonBorderWidth,
        Store.defaultOutlinedButtonBorderWidth);
    _outlinedButtonPressedBorderWidth = await _themeService.load(
        Store.keyOutlinedButtonPressedBorderWidth,
        Store.defaultOutlinedButtonPressedBorderWidth);
    //
    _toggleButtonsSchemeColor = await _themeService.load(
        Store.keyToggleButtonsSchemeColor,
        Store.defaultToggleButtonsSchemeColor);
    _toggleButtonsBorderRadius = await _themeService.load(
        Store.keyToggleButtonsBorderRadius,
        Store.defaultToggleButtonsBorderRadius);
    _toggleButtonsBorderWidth = await _themeService.load(
        Store.keyToggleButtonsBorderWidth,
        Store.defaultToggleButtonsBorderWidth);
    //
    // Switch, CheckBox and Radio SETTINGS.
    _unselectedToggleIsColored = await _themeService.load(
        Store.keyUnselectedToggleIsColored,
        Store.defaultUnselectedToggleIsColored);
    _switchSchemeColor = await _themeService.load(
        Store.keySwitchSchemeColor, Store.defaultSwitchSchemeColor);
    _switchThumbSchemeColor = await _themeService.load(
        Store.keySwitchThumbSchemeColor, Store.defaultSwitchThumbSchemeColor);
    _checkboxSchemeColor = await _themeService.load(
        Store.keyCheckboxSchemeColor, Store.defaultCheckboxSchemeColor);
    _radioSchemeColor = await _themeService.load(
        Store.keySliderBaseSchemeColor, Store.defaultRadioSchemeColor);
    //
    // Slider SETTINGS.
    _sliderBaseSchemeColor = await _themeService.load(
        Store.keySliderBaseSchemeColor, Store.defaultSliderBaseSchemeColor);
    _sliderValueTinted = await _themeService.load(
        Store.keySliderValueTinted, Store.defaultSliderValueTinted);
    _sliderTrackHeight = await _themeService.load(
        Store.keySliderTrackHeight, Store.defaultSliderTrackHeight);
    //
    // Fab SETTINGS.
    _fabUseShape = await _themeService.load(
        Store.keyFabUseShape, Store.defaultFabUseShape);
    _fabAlwaysCircular = await _themeService.load(
        Store.keyFabAlwaysCircular, Store.defaultFabAlwaysCircular);
    _fabBorderRadius = await _themeService.load(
        Store.keyFabBorderRadius, Store.defaultFabBorderRadius);
    _fabSchemeColor = await _themeService.load(
        Store.keyFabSchemeColor, Store.defaultFabSchemeColor);
    //
    // Chip Settings
    _chipSchemeColor = await _themeService.load(
        Store.keyChipSchemeColor, Store.defaultChipSchemeColor);
    _chipSelectedSchemeColor = await _themeService.load(
        Store.keyChipSelectedSchemeColor, Store.defaultChipSelectedSchemeColor);
    _chipDeleteIconSchemeColor = await _themeService.load(
        Store.keyChipDeleteIconSchemeColor,
        Store.defaultChipDeleteIconSchemeColor);
    _chipBorderRadius = await _themeService.load(
        Store.keyChipBorderRadius, Store.defaultChipBorderRadius);
    //
    // SnackBar SETTINGS.
    _snackBarSchemeColor = await _themeService.load(
        Store.keySnackBarSchemeColor, Store.defaultSnackBarSchemeColor);
    //
    // PopupMenuButton SETTINGS.
    _popupMenuSchemeColor = await _themeService.load(
        Store.keyPopupMenuSchemeColor, Store.defaultPopupMenuSchemeColor);
    _popupMenuOpacity = await _themeService.load(
        Store.keyPopupMenuOpacity, Store.defaultPopupMenuOpacity);
    _popupMenuElevation = await _themeService.load(
        Store.keyPopupMenuElevation, Store.defaultPopupMenuElevation);
    _popupMenuBorderRadius = await _themeService.load(
        Store.keyPopupMenuBorderRadius, Store.defaultPopupMenuBorderRadius);
    //
    // Card SETTINGS.
    _cardBorderRadius = await _themeService.load(
        Store.keyCardBorderRadius, Store.defaultCardBorderRadius);
    _dialogBackgroundSchemeColor = await _themeService.load(
        Store.keyDialogBackgroundSchemeColor,
        Store.defaultDialogBackgroundSchemeColor);
    _dialogBorderRadius = await _themeService.load(
        Store.keyDialogBorderRadius, Store.defaultDialogBorderRadius);
    _dialogElevation = await _themeService.load(
        Store.keyDialogElevation, Store.defaultDialogElevation);
    //
    // Tooltip SETTINGS.
    _tooltipRadius = await _themeService.load(
        Store.keyTooltipRadius, Store.defaultTooltipRadius);
    _tooltipWaitDuration = await _themeService.load(
        Store.keyTooltipWaitDuration, Store.defaultTooltipWaitDuration);
    _tooltipShowDuration = await _themeService.load(
        Store.keyTooltipShowDuration, Store.defaultTooltipShowDuration);
    _tooltipSchemeColor = await _themeService.load(
        Store.keyTooltipSchemeColor, Store.defaultTooltipSchemeColor);
    _tooltipOpacity = await _themeService.load(
        Store.keyTooltipOpacity, Store.defaultTooltipOpacity);
    //
    // Custom surface tint color SETTINGS.
    _surfaceTintLight = await _themeService.load(
        Store.keySurfaceTintLight, Store.defaultSurfaceTintLight);
    _surfaceTintDark = await _themeService.load(
        Store.keySurfaceTintDark, Store.defaultSurfaceTintDark);
    //
    // Custom color SETTINGS.
    _primaryLight = await _themeService.load(
        Store.keyPrimaryLight, Store.defaultPrimaryLight);
    _primaryContainerLight = await _themeService.load(
        Store.keyPrimaryContainerLight, Store.defaultPrimaryContainerLight);
    _secondaryLight = await _themeService.load(
        Store.keySecondaryLight, Store.defaultSecondaryLight);
    _secondaryContainerLight = await _themeService.load(
        Store.keySecondaryContainerLight, Store.defaultSecondaryContainerLight);
    _tertiaryLight = await _themeService.load(
        Store.keyTertiaryLight, Store.defaultTertiaryLight);
    _tertiaryContainerLight = await _themeService.load(
        Store.keyTertiaryContainerLight, Store.defaultTertiaryContainerLight);
    _primaryDark = await _themeService.load(
        Store.keyPrimaryDark, Store.defaultPrimaryDark);
    _primaryContainerDark = await _themeService.load(
        Store.keyPrimaryContainerDark, Store.defaultPrimaryContainerDark);
    _secondaryDark = await _themeService.load(
        Store.keySecondaryDark, Store.defaultSecondaryDark);
    _secondaryContainerDark = await _themeService.load(
        Store.keySecondaryContainerDark, Store.defaultSecondaryContainerDark);
    _tertiaryDark = await _themeService.load(
        Store.keyTertiaryDark, Store.defaultTertiaryDark);
    _tertiaryContainerDark = await _themeService.load(
        Store.keyTertiaryContainerDark, Store.defaultTertiaryContainerDark);

    // Not persisted, locally controlled popup selection for ThemeService,
    // resets to actual used platform when settings are reset or app loaded.
    _platform = defaultTargetPlatform;

    notifyListeners();
  }

  /// Reset all values to default values and save as current settings.
  ///
  /// Calls setters with notify = false, and calls notifyListeners once
  /// after all values have been reset and persisted.
  ///
  /// The reset to default actually, sets and persist all property values that
  /// deviates from its defined default value. Only values that actually
  /// deviate from their default value are changed. The property setters manage
  /// this. They are all set with no notification and notifyListeners() is
  /// only called once, after all updates have been made.
  ///
  /// Does not reset the custom colors to their default, only theme settings.
  /// We keep the custom colors at their specified values even if theme settings
  /// are reset. There is a separate function to reset the custom colors.
  Future<void> resetAllToDefaults() async {
    //
    // GENERAL SETTINGS.
    // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
    setThemeMode(Store.defaultThemeMode, false);
    setUseFlexColorScheme(Store.defaultUseFlexColorScheme, false);
    setUseSubThemes(Store.defaultUseSubThemes, false);
    setUseFlutterDefaults(Store.defaultUseFlutterDefaults, false);
    // The IsLargeGridView and ViewIndex settings are never reset to default in
    // a reset, we always keep the current screen and panel on page/panel view.
    setUseTextTheme(Store.defaultUseTextTheme, false);
    setUseAppFont(Store.defaultUseAppFont, false);
    setUsedScheme(Store.defaultUsedScheme, false);
    setSchemeIndex(Store.defaultSchemeIndex, false);
    setInteractionEffects(Store.defaultInteractionEffects, false);
    setDefaultRadius(Store.defaultDefaultRadius, false);
    setThinBorderWidth(Store.defaultThinBorderWidth, false);
    setThickBorderWidth(Store.defaultThickBorderWidth, false);
    setTooltipsMatchBackground(Store.defaultTooltipsMatchBackground, false);
    //
    // Surface and blend SETTINGS.
    setSurfaceModeLight(Store.defaultSurfaceModeLight, false);
    setSurfaceModeDark(Store.defaultSurfaceModeDark, false);
    setBlendLevel(Store.defaultBlendLevel, false);
    setBlendLevelDark(Store.defaultBlendLevelDark, false);
    setBlendOnLevel(Store.defaultBlendOnLevel, false);
    setBlendOnLevelDark(Store.defaultBlendOnLevelDark, false);
    setUsedColors(Store.defaultUsedColors, false);
    setSwapLegacyColors(Store.defaultSwapLegacyColors, false);
    setSwapLightColors(Store.defaultSwapLightColors, false);
    setSwapDarkColors(Store.defaultSwapDarkColors, false);
    setLightIsWhite(Store.defaultLightIsWhite, false);
    setDarkIsTrueBlack(Store.defaultDarkIsTrueBlack, false);
    setUseDarkColorsForSeed(Store.defaultUseDarkColorsForSeed, false);
    setUseToDarkMethod(Store.defaultUseToDarkMethod, false);
    setToDarkSwapPrimaryAndContainer(
        Store.defaultToDarkSwapPrimaryAndContainer, false);
    setDarkMethodLevel(Store.defaultDarkMethodLevel, false);
    setBlendLightOnColors(Store.defaultBlendLightOnColors, false);
    setBlendDarkOnColors(Store.defaultBlendDarkOnColors, false);
    setBlendLightTextTheme(Store.defaultBlendLightTextTheme, false);
    setBlendDarkTextTheme(Store.defaultBlendDarkTextTheme, false);
    //
    // Material 3 and Seed ColorScheme SETTINGS.
    setUseMaterial3(Store.defaultUseMaterial3, false);
    setUseKeyColors(Store.defaultUseKeyColors, false);
    setUseSecondary(Store.defaultUseSecondary, false);
    setUseTertiary(Store.defaultUseTertiary, false);
    setKeepPrimary(Store.defaultKeepPrimary, false);
    setKeepSecondary(Store.defaultKeepSecondary, false);
    setKeepTertiary(Store.defaultKeepTertiary, false);
    setKeepPrimaryContainer(Store.defaultKeepPrimaryContainer, false);
    setKeepSecondaryContainer(Store.defaultKeepSecondaryContainer, false);
    setKeepTertiaryContainer(Store.defaultKeepTertiaryContainer, false);
    setKeepDarkPrimary(Store.defaultKeepDarkPrimary, false);
    setKeepDarkSecondary(Store.defaultKeepDarkSecondary, false);
    setKeepDarkTertiary(Store.defaultKeepDarkTertiary, false);
    setKeepDarkPrimaryContainer(Store.defaultKeepDarkPrimaryContainer, false);
    setKeepDarkSecondaryContainer(
        Store.defaultKeepDarkSecondaryContainer, false);
    setKeepDarkTertiaryContainer(Store.defaultKeepDarkTertiaryContainer, false);
    setUsedFlexToneSetup(Store.defaultUsedFlexToneSetup, false);
    setUseM3ErrorColors(Store.defaultUseM3ErrorColors, false);
    //
    setOnMainsUseBWLight(Store.defaultOnMainsUseBWLight, false);
    setOnMainsUseBWDark(Store.defaultOnMainsUseBWDark, false);
    setOnSurfacesUseBWLight(Store.defaultOnSurfacesUseBWLight, false);
    setOnSurfacesUseBWDark(Store.defaultOnSurfacesUseBWDark, false);
    //
    // InputDecorator SETTINGS.
    setInputDecoratorSchemeColorLight(
        Store.defaultInputDecoratorSchemeColorLight, false);
    setInputDecoratorSchemeColorDark(
        Store.defaultInputDecoratorSchemeColorDark, false);
    setInputDecoratorIsFilled(Store.defaultInputDecoratorIsFilled, false);
    setInputDecoratorBorderType(Store.defaultInputDecoratorBorderType, false);
    setInputDecoratorBorderRadius(
        Store.defaultInputDecoratorBorderRadius, false);
    setInputDecoratorUnfocusedHasBorder(
        Store.defaultInputDecoratorUnfocusedHasBorder, false);
    setInputDecoratorUnfocusedBorderIsColored(
        Store.defaultInputDecoratorUnfocusedBorderIsColored, false);
    setInputDecoratorBorderWidth(Store.defaultInputDecoratorBorderWidth, false);
    setInputDecoratorFocusedBorderWidth(
        Store.defaultInputDecoratorFocusedBorderWidth, false);
    //
    // AppBar SETTINGS.
    setAppBarStyleLight(Store.defaultAppBarStyleLight, false);
    setAppBarStyleDark(Store.defaultAppBarStyleDark, false);
    setAppBarOpacityLight(Store.defaultAppBarOpacityLight, false);
    setAppBarOpacityDark(Store.defaultAppBarOpacityDark, false);
    setAppBarElevationLight(Store.defaultAppBarElevationLight, false);
    setAppBarElevationDark(Store.defaultAppBarElevationDark, false);
    setTransparentStatusBar(Store.defaultTransparentStatusBar, false);
    setAppBarBackgroundSchemeColorLight(
        Store.defaultAppBarBackgroundSchemeColorLight, false);
    setAppBarBackgroundSchemeColorDark(
        Store.defaultAppBarBackgroundSchemeColorDark, false);
    //
    // TabBar SETTINGS.
    setTabBarStyle(Store.defaultTabBarStyle, false);
    setTabBarIndicatorLight(Store.defaultTabBarIndicatorLight, false);
    setTabBarIndicatorDark(Store.defaultTabBarIndicatorDark, false);
    setTabBarItemSchemeColorLight(
        Store.defaultTabBarItemSchemeColorLight, false);
    setTabBarItemSchemeColorDark(Store.defaultTabBarItemSchemeColorDark, false);
    //
    // BottomSheet SETTINGS.
    setBottomSheetSchemeColor(Store.defaultBottomSheetSchemeColor, false);
    setBottomSheetElevation(Store.defaultBottomSheetElevation, false);
    setBottomSheetBorderRadius(Store.defaultBottomSheetBorderRadius, false);
    //
    // Android System Navigator bar SETTINGS.
    setSysNavBarStyle(Store.defaultSysNavBarStyle, false);
    setSysBarOpacity(Store.defaultSysBarOpacity, false);
    setUseSysNavDivider(Store.defaultUseSysNavDivider, false);
    //
    // BottomNavigationBar SETTINGS.
    setBottomNavBarBackgroundSchemeColor(
        Store.defaultBottomNavBarBackgroundSchemeColor, false);
    setBottomNavigationBarOpacity(
        Store.defaultBottomNavigationBarOpacity, false);
    setBottomNavigationBarElevation(
        Store.defaultBottomNavigationBarElevation, false);
    setBottomNavBarSelectedSchemeColor(
        Store.defaultBottomNavBarSelectedItemSchemeColor, false);
    setBottomNavBarUnselectedSchemeColor(
        Store.defaultBottomNavBarUnselectedSchemeColor, false);
    setBottomNavBarMuteUnselected(
        Store.defaultBottomNavBarMuteUnselected, false);
    setBottomNavShowSelectedLabels(
        Store.defaultBottomNavShowSelectedLabels, false);
    setBottomNavShowUnselectedLabels(
        Store.defaultBottomNavShowUnselectedLabels, false);
    //
    // NavigationBar SETTINGS.
    setNavBarBackgroundSchemeColor(
        Store.defaultNavBarBackgroundSchemeColor, false);
    setNavBarOpacity(Store.defaultNavBarOpacity, false);
    setNavigationBarElevation(Store.defaultNavigationBarElevation, false);
    setNavBarHeight(Store.defaultNavBarHeight, false);
    setNavBarSelectedSchemeColor(
        Store.defaultNavBarSelectedItemSchemeColor, false);
    setNavBarUnselectedSchemeColor(
        Store.defaultNavBarUnselectedSchemeColor, false);
    setNavBarMuteUnselected(Store.defaultNavBarMuteUnselected, false);
    setNavBarIndicatorSchemeColor(
        Store.defaultNavBarIndicatorSchemeColor, false);
    setNavBarIndicatorOpacity(Store.defaultNavBarIndicatorOpacity, false);
    setNavBarLabelBehavior(Store.defaultNavBarLabelBehavior, false);
    //
    // NavigationRail SETTINGS.
    setNavRailBackgroundSchemeColor(
        Store.defaultNavRailBackgroundSchemeColor, false);
    setNavRailOpacity(Store.defaultNavRailOpacity, false);
    setNavigationRailElevation(Store.defaultNavigationRailElevation, false);
    setNavRailSelectedSchemeColor(
        Store.defaultNavRailSelectedItemSchemeColor, false);
    setNavRailUnselectedSchemeColor(
        Store.defaultNavRailUnselectedSchemeColor, false);
    setNavRailMuteUnselected(Store.defaultNavRailMuteUnselected, false);
    setNavRailLabelType(Store.defaultNavRailLabelType, false);
    setNavRailUseIndicator(Store.defaultNavRailUseIndicator, false);
    setNavRailIndicatorSchemeColor(
        Store.defaultNavRailIndicatorSchemeColor, false);
    setNavRailIndicatorOpacity(Store.defaultNavRailIndicatorOpacity, false);
    //
    // Button SETTINGS.
    setTextButtonSchemeColor(Store.defaultTextButtonSchemeColor, false);
    setTextButtonBorderRadius(Store.defaultTextButtonBorderRadius, false);
    //
    setElevatedButtonSchemeColor(Store.defaultElevatedButtonSchemeColor, false);
    setElevatedButtonSecondarySchemeColor(
        Store.defaultElevatedButtonSecondarySchemeColor, false);
    setElevatedButtonBorderRadius(
        Store.defaultElevatedButtonBorderRadius, false);
    //
    setOutlinedButtonSchemeColor(Store.defaultOutlinedButtonSchemeColor, false);
    setOutlinedButtonOutlineSchemeColor(
        Store.defaultOutlinedButtonOutlineSchemeColor, false);
    setOutlinedButtonBorderRadius(
        Store.defaultOutlinedButtonBorderRadius, false);
    setOutlinedButtonBorderWidth(Store.defaultOutlinedButtonBorderWidth, false);
    setOutlinedButtonPressedBorderWidth(
        Store.defaultOutlinedButtonPressedBorderWidth, false);
    //
    setToggleButtonsSchemeColor(Store.defaultToggleButtonsSchemeColor, false);
    setToggleButtonsBorderRadius(Store.defaultToggleButtonsBorderRadius, false);
    setToggleButtonsBorderWidth(Store.defaultToggleButtonsBorderWidth, false);
    //
    // Switch, CheckBox and Radio SETTINGS.
    setUnselectedToggleIsColored(Store.defaultUnselectedToggleIsColored, false);
    setSwitchSchemeColor(Store.defaultSwitchSchemeColor, false);
    setSwitchThumbSchemeColor(Store.defaultSwitchThumbSchemeColor, false);
    setCheckboxSchemeColor(Store.defaultCheckboxSchemeColor, false);
    setRadioSchemeColor(Store.defaultRadioSchemeColor, false);
    //
    // Slider SETTINGS.
    setSliderBaseSchemeColor(Store.defaultSliderBaseSchemeColor, false);
    setSliderValueTinted(Store.defaultSliderValueTinted, false);
    setSliderTrackHeight(Store.defaultSliderTrackHeight, false);
    //
    // Fab SETTINGS.
    setFabUseShape(Store.defaultFabUseShape, false);
    setFabAlwaysCircular(Store.defaultFabAlwaysCircular, false);
    setFabBorderRadius(Store.defaultFabBorderRadius, false);
    setFabSchemeColor(Store.defaultFabSchemeColor, false);
    //
    // Chip SETTINGS.
    setChipSchemeColor(Store.defaultChipSchemeColor, false);
    setChipSelectedSchemeColor(Store.defaultChipSelectedSchemeColor, false);
    setChipDeleteIconSchemeColor(Store.defaultChipDeleteIconSchemeColor, false);
    setChipBorderRadius(Store.defaultChipBorderRadius, false);
    //
    // SnackBar SETTINGS.
    setSnackBarSchemeColor(Store.defaultSnackBarSchemeColor, false);
    //
    // PopupMenuButton SETTINGS.
    setPopupMenuSchemeColor(Store.defaultPopupMenuSchemeColor, false);
    setPopupMenuOpacity(Store.defaultPopupMenuOpacity, false);
    setPopupMenuElevation(Store.defaultPopupMenuElevation, false);
    setPopupMenuBorderRadius(Store.defaultPopupMenuBorderRadius, false);
    //
    // Card SETTINGS.
    setCardBorderRadius(Store.defaultCardBorderRadius, false);
    setDialogBackgroundSchemeColor(
        Store.defaultDialogBackgroundSchemeColor, false);
    setDialogBorderRadius(Store.defaultDialogBorderRadius, false);
    setDialogElevation(Store.defaultDialogElevation, false);
    //
    // Tooltip SETTINGS.
    setTooltipRadius(Store.defaultTooltipRadius, false);
    setTooltipWaitDuration(Store.defaultTooltipWaitDuration, false);
    setTooltipShowDuration(Store.defaultTooltipShowDuration, false);
    setTooltipSchemeColor(Store.defaultTooltipSchemeColor, false);
    setTooltipOpacity(Store.defaultTooltipOpacity, false);
    //
    // Surface tint colors.
    setSurfaceTintLight(Store.defaultSurfaceTintLight, false);
    setSurfaceTintDark(Store.defaultSurfaceTintDark, false);
    //
    // Not persisted, locally controlled popup selection for ThemeService,
    // resets to actual used platform when settings are reset or app loaded.
    setPlatform(defaultTargetPlatform, false);
    notifyListeners();
  }

  /// Reset the custom color values to their default values.
  ///
  /// Calls setters with notify = false, and calls notifyListeners once
  /// after all values have been reset and persisted.
  ///
  /// The reset to default actually, sets and persist all property values that
  /// deviates from its defined default value. Only values that actually
  /// deviate from their default value are changed. The property setters manage
  /// this. They are all set with not notification and notifyListeners() is
  /// only called once, weh all updates have been made.
  Future<void> resetCustomColorsToDefaults() async {
    setPrimaryLight(Store.defaultPrimaryLight, false);
    setPrimaryContainerLight(Store.defaultPrimaryContainerLight, false);
    setSecondaryLight(Store.defaultSecondaryLight, false);
    setSecondaryContainerLight(Store.defaultSecondaryContainerLight, false);
    setTertiaryLight(Store.defaultTertiaryLight, false);
    setTertiaryContainerLight(Store.defaultTertiaryContainerLight, false);
    setPrimaryDark(Store.defaultPrimaryDark, false);
    setPrimaryContainerDark(Store.defaultPrimaryContainerDark, false);
    setSecondaryDark(Store.defaultSecondaryDark, false);
    setSecondaryContainerDark(Store.defaultSecondaryContainerDark, false);
    setTertiaryDark(Store.defaultTertiaryDark, false);
    setTertiaryContainerDark(Store.defaultTertiaryContainerDark, false);
    notifyListeners();
  }

  // GENERAL SETTINGS.
  // ThemeMode, use FlexColorScheme and sub-themes, current scheme, view, etc.
  // ===========================================================================

  // Make all ThemeController properties private so they cannot be used
  // directly without also persisting the changes using the ThemeService,
  // by making a setter and getter for each property.

  // Private value, getter and setter for the ThemeMode
  late ThemeMode _themeMode;
  // Getter for the current ThemeMode.
  ThemeMode get themeMode => _themeMode;
  // Set and persist new ThemeMode value.
  void setThemeMode(ThemeMode? value, [bool notify = true]) {
    // No work if null value passed.
    if (value == null) return;
    // Do not perform any work if new and old value are identical.
    if (value == _themeMode) return;
    // Otherwise, assign new value to private property.
    _themeMode = value;
    // Inform all listeners a change has occurred, if notify flag is true.
    if (notify) notifyListeners();
    // Persist the change to whatever storage is used with the ThemeService.
    unawaited(_themeService.save(Store.keyThemeMode, value));
  }

  // Repeat above pattern for all other theme settings. The properties will
  // not be further explained, property names correspond to equivalent
  // FlexColorScheme properties.
  late bool _useFlexColorScheme;
  bool get useFlexColorScheme => _useFlexColorScheme;
  void setUseFlexColorScheme(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useFlexColorScheme) return;
    _useFlexColorScheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseFlexColorScheme, value));
  }

  late bool _useSubThemes;
  bool get useSubThemes => _useSubThemes;
  void setUseSubThemes(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useSubThemes) return;
    _useSubThemes = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseSubThemes, value));
  }

  late bool _useFlutterDefaults;
  bool get useFlutterDefaults => _useFlutterDefaults;
  void setUseFlutterDefaults(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useFlutterDefaults) return;
    _useFlutterDefaults = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseFlutterDefaults, value));
  }

  late bool _isLargeGridView;
  bool get isLargeGridView => _isLargeGridView;
  void setAdvancedView(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _isLargeGridView) return;
    _isLargeGridView = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyIsLargeGridView, value));
  }

  late int _viewIndex;
  int get viewIndex => _viewIndex;
  void setViewIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _viewIndex) return;
    _viewIndex = value;
    notifyListeners();
    unawaited(_themeService.save(Store.keyViewIndex, value));
  }

  late bool _useTextTheme;
  bool get useTextTheme => _useTextTheme;
  void setUseTextTheme(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useTextTheme) return;
    _useTextTheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseTextTheme, value));
  }

  late bool _useAppFont;
  bool get useAppFont => _useAppFont;
  void setUseAppFont(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useAppFont) return;
    _useAppFont = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseAppFont, value));
  }

  late FlexScheme _usedScheme;
  FlexScheme get usedScheme => _usedScheme;
  void setUsedScheme(FlexScheme? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _usedScheme) return;
    _usedScheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedScheme, value));
  }

  late int _schemeIndex;
  int get schemeIndex => _schemeIndex;
  void setSchemeIndex(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _schemeIndex) return;
    _schemeIndex = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySchemeIndex, value));
  }

  late bool _interactionEffects;
  bool get interactionEffects => _interactionEffects;
  void setInteractionEffects(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _interactionEffects) return;
    _interactionEffects = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInteractionEffects, value));
  }

  late double? _defaultRadius;
  double? get defaultRadius => _defaultRadius;
  void setDefaultRadius(double? value, [bool notify = true]) {
    if (value == _defaultRadius) return;
    _defaultRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDefaultRadius, value));
  }

  late double? _thinBorderWidth;
  double? get thinBorderWidth => _thinBorderWidth;
  void setThinBorderWidth(double? value, [bool notify = true]) {
    if (value == _thinBorderWidth) return;
    _thinBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyThinBorderWidth, value));
  }

  late double? _thickBorderWidth;
  double? get thickBorderWidth => _thickBorderWidth;
  void setThickBorderWidth(double? value, [bool notify = true]) {
    if (value == _thickBorderWidth) return;
    _thickBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyThickBorderWidth, value));
  }

  late bool _tooltipsMatchBackground;
  bool get tooltipsMatchBackground => _tooltipsMatchBackground;
  void setTooltipsMatchBackground(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tooltipsMatchBackground) return;
    _tooltipsMatchBackground = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipsMatchBackground, value));
  }

  // Surface and blend SETTINGS.
  // ===========================================================================

  late FlexSurfaceMode _surfaceModeLight;
  FlexSurfaceMode get surfaceModeLight => _surfaceModeLight;
  void setSurfaceModeLight(FlexSurfaceMode? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _surfaceModeLight) return;
    _surfaceModeLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceModeLight, value));
  }

  late FlexSurfaceMode _surfaceModeDark;
  FlexSurfaceMode get surfaceModeDark => _surfaceModeDark;
  void setSurfaceModeDark(FlexSurfaceMode? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _surfaceModeDark) return;
    _surfaceModeDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceModeDark, value));
  }

  late int _blendLevel;
  int get blendLevel => _blendLevel;
  void setBlendLevel(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLevel) return;
    _blendLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLevel, value));
  }

  late int _blendLevelDark;
  int get blendLevelDark => _blendLevelDark;
  void setBlendLevelDark(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLevelDark) return;
    _blendLevelDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLevelDark, value));
  }

  late int _blendOnLevel;
  int get blendOnLevel => _blendOnLevel;
  void setBlendOnLevel(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendOnLevel) return;
    _blendOnLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnBlendLevel, value));
  }

  late int _blendOnLevelDark;
  int get blendOnLevelDark => _blendOnLevelDark;
  void setBlendOnLevelDark(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendOnLevelDark) return;
    _blendOnLevelDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendOnLevelDark, value));
  }

  late int _usedColors;
  int get usedColors => _usedColors;
  void setUsedColors(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _usedColors) return;
    _usedColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedColors, value));
  }

  late bool _swapLegacyColors;
  bool get swapLegacyColors => _swapLegacyColors;
  void setSwapLegacyColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _swapLegacyColors) return;
    _swapLegacyColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwapLegacyColors, value));
  }

  late bool _swapLightColors;
  bool get swapLightColors => _swapLightColors;
  void setSwapLightColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _swapLightColors) return;
    _swapLightColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwapLightColors, value));
  }

  late bool _swapDarkColors;
  bool get swapDarkColors => _swapDarkColors;
  void setSwapDarkColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _swapDarkColors) return;
    _swapDarkColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwapDarkColors, value));
  }

  late bool _lightIsWhite;
  bool get lightIsWhite => _lightIsWhite;
  void setLightIsWhite(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _lightIsWhite) return;
    _lightIsWhite = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyLightIsWhite, value));
  }

  late bool _darkIsTrueBlack;
  bool get darkIsTrueBlack => _darkIsTrueBlack;
  void setDarkIsTrueBlack(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _darkIsTrueBlack) return;
    _darkIsTrueBlack = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDarkIsTrueBlack, value));
  }

  late bool _useDarkColorsForSeed;
  bool get useDarkColorsForSeed => _useDarkColorsForSeed;
  void setUseDarkColorsForSeed(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useDarkColorsForSeed) return;
    _useDarkColorsForSeed = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseDarkColorsForSeed, value));
  }

  late bool _useToDarkMethod;
  bool get useToDarkMethod => _useToDarkMethod;
  void setUseToDarkMethod(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useToDarkMethod) return;
    _useToDarkMethod = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseToDarkMethod, value));
  }

  late bool _toDarkSwapPrimaryAndContainer;
  bool get toDarkSwapPrimaryAndContainer => _toDarkSwapPrimaryAndContainer;
  void setToDarkSwapPrimaryAndContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _toDarkSwapPrimaryAndContainer) return;
    _toDarkSwapPrimaryAndContainer = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyToDarkSwapPrimaryAndContainer, value));
  }

  late int _darkMethodLevel;
  int get darkMethodLevel => _darkMethodLevel;
  void setDarkMethodLevel(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _darkMethodLevel) return;
    _darkMethodLevel = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDarkMethodLevel, value));
  }

  // On color blending ON/OFF
  late bool _blendLightOnColors;
  bool get blendLightOnColors => _blendLightOnColors;
  void setBlendLightOnColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLightOnColors) return;
    _blendLightOnColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLightOnColors, value));
  }

  late bool _blendDarkOnColors;
  bool get blendDarkOnColors => _blendDarkOnColors;
  void setBlendDarkOnColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendDarkOnColors) return;
    _blendDarkOnColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendDarkOnColors, value));
  }

  // TextThem blending ON/OFF
  late bool _blendLightTextTheme;
  bool get blendLightTextTheme => _blendLightTextTheme;
  void setBlendLightTextTheme(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendLightTextTheme) return;
    _blendLightTextTheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendLightTextTheme, value));
  }

  late bool _blendDarkTextTheme;
  bool get blendDarkTextTheme => _blendDarkTextTheme;
  void setBlendDarkTextTheme(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _blendDarkTextTheme) return;
    _blendDarkTextTheme = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBlendDarkTextTheme, value));
  }

  // Material 3 and Seed ColorScheme SETTINGS.
  // ===========================================================================

  late bool _useMaterial3;
  bool get useMaterial3 => _useMaterial3;
  void setUseMaterial3(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useMaterial3) return;
    _useMaterial3 = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseMaterial3, value));
  }

  late bool _useKeyColors;
  bool get useKeyColors => _useKeyColors;
  void setUseKeyColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useKeyColors) return;
    _useKeyColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseKeyColors, value));
  }

  late bool _useSecondary;
  bool get useSecondary => _useSecondary;
  void setUseSecondary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useSecondary) return;
    _useSecondary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseSecondary, value));
  }

  late bool _useTertiary;
  bool get useTertiary => _useTertiary;
  void setUseTertiary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useTertiary) return;
    _useTertiary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseTertiary, value));
  }

  late bool _keepPrimary;
  bool get keepPrimary => _keepPrimary;
  void setKeepPrimary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepPrimary) return;
    _keepPrimary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepPrimary, value));
  }

  late bool _keepSecondary;
  bool get keepSecondary => _keepSecondary;
  void setKeepSecondary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepSecondary) return;
    _keepSecondary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepSecondary, value));
  }

  late bool _keepTertiary;
  bool get keepTertiary => _keepTertiary;
  void setKeepTertiary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepTertiary) return;
    _keepTertiary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepTertiary, value));
  }

  late bool _keepPrimaryContainer;
  bool get keepPrimaryContainer => _keepPrimaryContainer;
  void setKeepPrimaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepPrimaryContainer) return;
    _keepPrimaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepPrimaryContainer, value));
  }

  late bool _keepSecondaryContainer;
  bool get keepSecondaryContainer => _keepSecondaryContainer;
  void setKeepSecondaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepSecondaryContainer) return;
    _keepSecondaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepSecondaryContainer, value));
  }

  late bool _keepTertiaryContainer;
  bool get keepTertiaryContainer => _keepTertiaryContainer;
  void setKeepTertiaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepTertiaryContainer) return;
    _keepTertiaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepTertiaryContainer, value));
  }

  late bool _keepDarkPrimary;
  bool get keepDarkPrimary => _keepDarkPrimary;
  void setKeepDarkPrimary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkPrimary) return;
    _keepDarkPrimary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkPrimary, value));
  }

  late bool _keepDarkSecondary;
  bool get keepDarkSecondary => _keepDarkSecondary;
  void setKeepDarkSecondary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkSecondary) return;
    _keepDarkSecondary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkSecondary, value));
  }

  late bool _keepDarkTertiary;
  bool get keepDarkTertiary => _keepDarkTertiary;
  void setKeepDarkTertiary(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkTertiary) return;
    _keepDarkTertiary = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkTertiary, value));
  }

  late bool _keepDarkPrimaryContainer;
  bool get keepDarkPrimaryContainer => _keepDarkPrimaryContainer;
  void setKeepDarkPrimaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkPrimaryContainer) return;
    _keepDarkPrimaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkPrimaryContainer, value));
  }

  late bool _keepDarkSecondaryContainer;
  bool get keepDarkSecondaryContainer => _keepDarkSecondaryContainer;
  void setKeepDarkSecondaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkSecondaryContainer) return;
    _keepDarkSecondaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkSecondaryContainer, value));
  }

  late bool _keepDarkTertiaryContainer;
  bool get keepDarkTertiaryContainer => _keepDarkTertiaryContainer;
  void setKeepDarkTertiaryContainer(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _keepDarkTertiaryContainer) return;
    _keepDarkTertiaryContainer = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyKeepDarkTertiaryContainer, value));
  }

  late int _usedFlexToneSetup;
  int get usedFlexToneSetup => _usedFlexToneSetup;
  void setUsedFlexToneSetup(int? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _usedFlexToneSetup) return;
    _usedFlexToneSetup = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUsedFlexToneSetup, value));
  }

  late bool _useM3ErrorColors;
  bool get useM3ErrorColors => _useM3ErrorColors;
  void setUseM3ErrorColors(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useM3ErrorColors) return;
    _useM3ErrorColors = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseM3ErrorColors, value));
  }

  late bool _onMainsUseBWLight;
  bool get onMainsUseBWLight => _onMainsUseBWLight;
  void setOnMainsUseBWLight(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onMainsUseBWLight) return;
    _onMainsUseBWLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnMainsUseBWLight, value));
  }

  late bool _onMainsUseBWDark;
  bool get onMainsUseBWDark => _onMainsUseBWDark;
  void setOnMainsUseBWDark(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onMainsUseBWDark) return;
    _onMainsUseBWDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnMainsUseBWDark, value));
  }

  late bool _onSurfacesUseBWLight;
  bool get onSurfacesUseBWLight => _onSurfacesUseBWLight;
  void setOnSurfacesUseBWLight(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onSurfacesUseBWLight) return;
    _onSurfacesUseBWLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnSurfacesUseBWLight, value));
  }

  late bool _onSurfacesUseBWDark;
  bool get onSurfacesUseBWDark => _onSurfacesUseBWDark;
  void setOnSurfacesUseBWDark(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _onSurfacesUseBWDark) return;
    _onSurfacesUseBWDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOnSurfacesUseBWDark, value));
  }

  // InputDecorator SETTINGS.
  // ===========================================================================

  late SchemeColor? _inputDecoratorSchemeColorLight;
  SchemeColor? get inputDecoratorSchemeColorLight =>
      _inputDecoratorSchemeColorLight;
  void setInputDecoratorSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorSchemeColorLight) return;
    _inputDecoratorSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorSchemeColorLight, value));
  }

  late SchemeColor? _inputDecoratorSchemeColorDark;
  SchemeColor? get inputDecoratorSchemeColorDark =>
      _inputDecoratorSchemeColorDark;
  void setInputDecoratorSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _inputDecoratorSchemeColorDark) return;
    _inputDecoratorSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorSchemeColorDark, value));
  }

  late bool _inputDecoratorIsFilled;
  bool get inputDecoratorIsFilled => _inputDecoratorIsFilled;
  void setInputDecoratorIsFilled(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorIsFilled) return;
    _inputDecoratorIsFilled = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorIsFilled, value));
  }

  late FlexInputBorderType _inputDecoratorBorderType;
  FlexInputBorderType get inputDecoratorBorderType => _inputDecoratorBorderType;
  void setInputDecoratorBorderType(FlexInputBorderType? value,
      [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorBorderType) return;
    _inputDecoratorBorderType = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorBorderType, value));
  }

  late double? _inputDecoratorBorderRadius;
  double? get inputDecoratorBorderRadius => _inputDecoratorBorderRadius;
  void setInputDecoratorBorderRadius(double? value, [bool notify = true]) {
    if (value == _inputDecoratorBorderRadius) return;
    _inputDecoratorBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorBorderRadius, value));
  }

  late bool _inputDecoratorUnfocusedHasBorder;
  bool get inputDecoratorUnfocusedHasBorder =>
      _inputDecoratorUnfocusedHasBorder;
  void setInputDecoratorUnfocusedHasBorder(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorUnfocusedHasBorder) return;
    _inputDecoratorUnfocusedHasBorder = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorUnfocusedHasBorder, value));
  }

  late bool _inputDecoratorUnfocusedBorderIsColored;
  bool get inputDecoratorUnfocusedBorderIsColored =>
      _inputDecoratorUnfocusedBorderIsColored;
  void setInputDecoratorUnfocusedBorderIsColored(bool? value,
      [bool notify = true]) {
    if (value == null) return;
    if (value == _inputDecoratorUnfocusedBorderIsColored) return;
    _inputDecoratorUnfocusedBorderIsColored = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyInputDecoratorUnfocusedBorderIsColored, value));
  }

  late double? _inputDecoratorBorderWidth;
  double? get inputDecoratorBorderWidth => _inputDecoratorBorderWidth;
  void setInputDecoratorBorderWidth(double? value, [bool notify = true]) {
    if (value == _inputDecoratorBorderWidth) return;
    _inputDecoratorBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyInputDecoratorBorderWidth, value));
  }

  late double? _inputDecoratorFocusedBorderWidth;
  double? get inputDecoratorFocusedBorderWidth =>
      _inputDecoratorFocusedBorderWidth;
  void setInputDecoratorFocusedBorderWidth(double? value,
      [bool notify = true]) {
    if (value == _inputDecoratorFocusedBorderWidth) return;
    _inputDecoratorFocusedBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyInputDecoratorFocusedBorderWidth, value));
  }

  // AppBar SETTINGS.
  // ===========================================================================

  late FlexAppBarStyle? _appBarStyleLight;
  FlexAppBarStyle? get appBarStyleLight => _appBarStyleLight;
  void setAppBarStyleLight(FlexAppBarStyle? value, [bool notify = true]) {
    // if (value == null) return;
    if (value == _appBarStyleLight) return;
    _appBarStyleLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarStyleLight, value));
  }

  late FlexAppBarStyle? _appBarStyleDark;
  FlexAppBarStyle? get appBarStyleDark => _appBarStyleDark;
  void setAppBarStyleDark(FlexAppBarStyle? value, [bool notify = true]) {
    // if (value == null) return;
    if (value == _appBarStyleDark) return;
    _appBarStyleDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarStyleDark, value));
  }

  late double _appBarOpacityLight;
  double get appBarOpacityLight => _appBarOpacityLight;
  void setAppBarOpacityLight(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _appBarOpacityLight) return;
    _appBarOpacityLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarOpacityLight, value));
  }

  late double _appBarOpacityDark;
  double get appBarOpacityDark => _appBarOpacityDark;
  void setAppBarOpacityDark(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _appBarOpacityDark) return;
    _appBarOpacityDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarOpacityDark, value));
  }

  late double _appBarElevationLight;
  double get appBarElevationLight => _appBarElevationLight;
  void setAppBarElevationLight(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _appBarElevationLight) return;
    _appBarElevationLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarElevationLight, value));
  }

  late double _appBarElevationDark;
  double get appBarElevationDark => _appBarElevationDark;
  void setAppBarElevationDark(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _appBarElevationDark) return;
    _appBarElevationDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyAppBarElevationDark, value));
  }

  late bool _transparentStatusBar;
  bool get transparentStatusBar => _transparentStatusBar;
  void setTransparentStatusBar(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _transparentStatusBar) return;
    _transparentStatusBar = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTransparentStatusBar, value));
  }

  late SchemeColor? _appBarBackgroundSchemeColorLight;
  SchemeColor? get appBarBackgroundSchemeColorLight =>
      _appBarBackgroundSchemeColorLight;
  void setAppBarBackgroundSchemeColorLight(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarBackgroundSchemeColorLight) return;
    _appBarBackgroundSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarBackgroundSchemeColorLight, value));
  }

  late SchemeColor? _appBarBackgroundSchemeColorDark;
  SchemeColor? get appBarBackgroundSchemeColorDark =>
      _appBarBackgroundSchemeColorDark;
  void setAppBarBackgroundSchemeColorDark(SchemeColor? value,
      [bool notify = true]) {
    if (value == _appBarBackgroundSchemeColorDark) return;
    _appBarBackgroundSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyAppBarBackgroundSchemeColorDark, value));
  }

  // TabBar SETTINGS.
  // ===========================================================================

  late FlexTabBarStyle _tabBarStyle;
  FlexTabBarStyle get tabBarStyle => _tabBarStyle;
  void setTabBarStyle(FlexTabBarStyle? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tabBarStyle) return;
    _tabBarStyle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarStyle, value));
  }

  late SchemeColor? _tabBarIndicatorLight;
  SchemeColor? get tabBarIndicatorLight => _tabBarIndicatorLight;
  void setTabBarIndicatorLight(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarIndicatorLight) return;
    _tabBarIndicatorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorLight, value));
  }

  late SchemeColor? _tabBarIndicatorDark;
  SchemeColor? get tabBarIndicatorDark => _tabBarIndicatorDark;
  void setTabBarIndicatorDark(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarIndicatorDark) return;
    _tabBarIndicatorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarIndicatorDark, value));
  }

  late SchemeColor? _tabBarItemSchemeColorLight;
  SchemeColor? get tabBarItemSchemeColorLight => _tabBarItemSchemeColorLight;
  void setTabBarItemSchemeColorLight(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarItemSchemeColorLight) return;
    _tabBarItemSchemeColorLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarItemSchemeColorLight, value));
  }

  late SchemeColor? _tabBarItemSchemeColorDark;
  SchemeColor? get tabBarItemSchemeColorDark => _tabBarItemSchemeColorDark;
  void setTabBarItemSchemeColorDark(SchemeColor? value, [bool notify = true]) {
    if (value == _tabBarItemSchemeColorDark) return;
    _tabBarItemSchemeColorDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTabBarItemSchemeColorDark, value));
  }

  // BottomSheet SETTINGS.
  // ===========================================================================

  late SchemeColor? _bottomSheetSchemeColor;
  SchemeColor? get bottomSheetSchemeColor => _bottomSheetSchemeColor;
  void setBottomSheetSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _bottomSheetSchemeColor) return;
    _bottomSheetSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetSchemeColor, value));
  }

  late double? _bottomSheetElevation;
  double? get bottomSheetElevation => _bottomSheetElevation;
  void setBottomSheetElevation(double? value, [bool notify = true]) {
    if (value == _bottomSheetElevation) return;
    _bottomSheetElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetElevation, value));
  }

  late double? _bottomSheetBorderRadius;
  double? get bottomSheetBorderRadius => _bottomSheetBorderRadius;
  void setBottomSheetBorderRadius(double? value, [bool notify = true]) {
    if (value == _bottomSheetBorderRadius) return;
    _bottomSheetBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomSheetBorderRadius, value));
  }

  // Android System Navigator bar SETTINGS.
  // ===========================================================================

  late FlexSystemNavBarStyle _sysNavBarStyle;
  FlexSystemNavBarStyle get sysNavBarStyle => _sysNavBarStyle;
  void setSysNavBarStyle(FlexSystemNavBarStyle? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sysNavBarStyle) return;
    _sysNavBarStyle = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySysNavBarStyle, value));
  }

  late double _sysNavBarOpacity;
  double get sysNavBarOpacity => _sysNavBarOpacity;
  void setSysBarOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sysNavBarOpacity) return;
    _sysNavBarOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySysNavBarOpacity, value));
  }

  late bool _useSysNavDivider;
  bool get useSysNavDivider => _useSysNavDivider;
  void setUseSysNavDivider(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _useSysNavDivider) return;
    _useSysNavDivider = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUseSysNavDivider, value));
  }

  // BottomNavigationBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _bottomNavBarBackgroundSchemeColor;
  SchemeColor? get bottomNavBarBackgroundSchemeColor =>
      _bottomNavBarBackgroundSchemeColor;
  void setBottomNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomNavBarBackgroundSchemeColor) return;
    _bottomNavBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyBottomNavBarBackgroundSchemeColor, value));
  }

  late double _bottomNavigationBarOpacity;
  double get bottomNavigationBarOpacity => _bottomNavigationBarOpacity;
  void setBottomNavigationBarOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavigationBarOpacity) return;
    _bottomNavigationBarOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavigationBarOpacity, value));
  }

  late double _bottomNavigationBarElevation;
  double get bottomNavigationBarElevation => _bottomNavigationBarElevation;
  void setBottomNavigationBarElevation(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavigationBarElevation) return;
    _bottomNavigationBarElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavigationBarElevation, value));
  }

  late SchemeColor? _bottomNavBarSelectedSchemeColor;
  SchemeColor? get bottomNavBarSelectedSchemeColor =>
      _bottomNavBarSelectedSchemeColor;
  void setBottomNavBarSelectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomNavBarSelectedSchemeColor) return;
    _bottomNavBarSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(
        Store.keyBottomNavBarSelectedItemSchemeColor, value));
  }

  late SchemeColor? _bottomNavBarUnselectedSchemeColor;
  SchemeColor? get bottomNavBarUnselectedSchemeColor =>
      _bottomNavBarUnselectedSchemeColor;
  void setBottomNavBarUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _bottomNavBarUnselectedSchemeColor) return;
    _bottomNavBarUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyBottomNavBarUnselectedSchemeColor, value));
  }

  late bool _bottomNavBarMuteUnselected;
  bool get bottomNavBarMuteUnselected => _bottomNavBarMuteUnselected;
  void setBottomNavBarMuteUnselected(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavBarMuteUnselected) return;
    _bottomNavBarMuteUnselected = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavBarMuteUnselected, value));
  }

  late bool _bottomNavShowSelectedLabels;
  bool get bottomNavShowSelectedLabels => _bottomNavShowSelectedLabels;
  void setBottomNavShowSelectedLabels(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavShowSelectedLabels) return;
    _bottomNavShowSelectedLabels = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyBottomNavShowSelectedLabels, value));
  }

  late bool _bottomNavShowUnselectedLabels;
  bool get bottomNavShowUnselectedLabels => _bottomNavShowUnselectedLabels;
  void setBottomNavShowUnselectedLabels(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _bottomNavShowUnselectedLabels) return;
    _bottomNavShowUnselectedLabels = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyBottomNavShowUnselectedLabels, value));
  }

  // NavigationBar SETTINGS.
  // ===========================================================================

  late SchemeColor? _navBarBackgroundSchemeColor;
  SchemeColor? get navBarBackgroundSchemeColor => _navBarBackgroundSchemeColor;
  void setNavBarBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navBarBackgroundSchemeColor) return;
    _navBarBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarBackgroundSchemeColor, value));
  }

  late double _navBarOpacity;
  double get navBarOpacity => _navBarOpacity;
  void setNavBarOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navBarOpacity) return;
    _navBarOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarOpacity, value));
  }

  late double? _navigationBarElevation;
  double? get navigationBarElevation => _navigationBarElevation;
  void setNavigationBarElevation(double? value, [bool notify = true]) {
    if (value == _navigationBarElevation) return;
    _navigationBarElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavigationBarElevation, value));
  }

  late double? _navBarHeight;
  double? get navBarHeight => _navBarHeight;
  void setNavBarHeight(double? value, [bool notify = true]) {
    if (value == _navBarHeight) return;
    _navBarHeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarHeight, value));
  }

  late SchemeColor? _navBarSelectedSchemeColor;
  SchemeColor? get navBarSelectedSchemeColor => _navBarSelectedSchemeColor;
  void setNavBarSelectedSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _navBarSelectedSchemeColor) return;
    _navBarSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavBarSelectedItemSchemeColor, value));
  }

  late SchemeColor? _navBarUnselectedSchemeColor;
  SchemeColor? get navBarUnselectedSchemeColor => _navBarUnselectedSchemeColor;
  void setNavBarUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navBarUnselectedSchemeColor) return;
    _navBarUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarUnselectedSchemeColor, value));
  }

  late bool _navBarMuteUnselected;
  bool get navBarMuteUnselected => _navBarMuteUnselected;
  void setNavBarMuteUnselected(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navBarMuteUnselected) return;
    _navBarMuteUnselected = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarMuteUnselected, value));
  }

  late SchemeColor? _navBarIndicatorSchemeColor;
  SchemeColor? get navBarIndicatorSchemeColor => _navBarIndicatorSchemeColor;
  void setNavBarIndicatorSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _navBarIndicatorSchemeColor) return;
    _navBarIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarIndicatorSchemeColor, value));
  }

  late double? _navBarIndicatorOpacity;
  double? get navBarIndicatorOpacity => _navBarIndicatorOpacity;
  void setNavBarIndicatorOpacity(double? value, [bool notify = true]) {
    if (value == _navBarIndicatorOpacity) return;
    _navBarIndicatorOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarIndicatorOpacity, value));
  }

  late NavigationDestinationLabelBehavior _navBarLabelBehavior;
  NavigationDestinationLabelBehavior get navBarLabelBehavior =>
      _navBarLabelBehavior;
  void setNavBarLabelBehavior(NavigationDestinationLabelBehavior value,
      [bool notify = true]) {
    if (value == _navBarLabelBehavior) return;
    _navBarLabelBehavior = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavBarLabelBehavior, value));
  }

  // NavigationRail SETTINGS.
  // ===========================================================================

  late SchemeColor? _navRailBackgroundSchemeColor;
  SchemeColor? get navRailBackgroundSchemeColor =>
      _navRailBackgroundSchemeColor;
  void setNavRailBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailBackgroundSchemeColor) return;
    _navRailBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailBackgroundSchemeColor, value));
  }

  late double _navRailOpacity;
  double get navRailOpacity => _navRailOpacity;
  void setNavRailOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navRailOpacity) return;
    _navRailOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailOpacity, value));
  }

  late double _navigationRailElevation;
  double get navigationRailElevation => _navigationRailElevation;
  void setNavigationRailElevation(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navigationRailElevation) return;
    _navigationRailElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavigationRailElevation, value));
  }

  late SchemeColor? _navRailSelectedSchemeColor;
  SchemeColor? get navRailSelectedSchemeColor => _navRailSelectedSchemeColor;
  void setNavRailSelectedSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _navRailSelectedSchemeColor) return;
    _navRailSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyNavRailSelectedItemSchemeColor, value));
  }

  late SchemeColor? _navRailUnselectedSchemeColor;
  SchemeColor? get navRailUnselectedSchemeColor =>
      _navRailUnselectedSchemeColor;
  void setNavRailUnselectedSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailUnselectedSchemeColor) return;
    _navRailUnselectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailUnselectedSchemeColor, value));
  }

  late bool _navRailMuteUnselected;
  bool get navRailMuteUnselected => _navRailMuteUnselected;
  void setNavRailMuteUnselected(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navRailMuteUnselected) return;
    _navRailMuteUnselected = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailMuteUnselected, value));
  }

  late NavigationRailLabelType _navRailLabelType;
  NavigationRailLabelType get navRailLabelType => _navRailLabelType;
  void setNavRailLabelType(NavigationRailLabelType value,
      [bool notify = true]) {
    if (value == _navRailLabelType) return;
    _navRailLabelType = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailLabelType, value));
  }

  late bool _navRailUseIndicator;
  bool get navRailUseIndicator => _navRailUseIndicator;
  void setNavRailUseIndicator(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _navRailUseIndicator) return;
    _navRailUseIndicator = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailUseIndicator, value));
  }

  late SchemeColor? _navRailIndicatorSchemeColor;
  SchemeColor? get navRailIndicatorSchemeColor => _navRailIndicatorSchemeColor;
  void setNavRailIndicatorSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _navRailIndicatorSchemeColor) return;
    _navRailIndicatorSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailIndicatorSchemeColor, value));
  }

  late double? _navRailIndicatorOpacity;
  double? get navRailIndicatorOpacity => _navRailIndicatorOpacity;
  void setNavRailIndicatorOpacity(double? value, [bool notify = true]) {
    if (value == _navRailIndicatorOpacity) return;
    _navRailIndicatorOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyNavRailIndicatorOpacity, value));
  }

  // Button SETTINGS.
  // ===========================================================================

  late SchemeColor? _textButtonSchemeColor;
  SchemeColor? get textButtonSchemeColor => _textButtonSchemeColor;
  void setTextButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _textButtonSchemeColor) return;
    _textButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTextButtonSchemeColor, value));
  }

  late double? _textButtonBorderRadius;
  double? get textButtonBorderRadius => _textButtonBorderRadius;
  void setTextButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _textButtonBorderRadius) return;
    _textButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTextButtonBorderRadius, value));
  }

  late SchemeColor? _elevatedButtonSchemeColor;
  SchemeColor? get elevatedButtonSchemeColor => _elevatedButtonSchemeColor;
  void setElevatedButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _elevatedButtonSchemeColor) return;
    _elevatedButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyElevatedButtonSchemeColor, value));
  }

  late SchemeColor? _elevatedButtonSecondarySchemeColor;
  SchemeColor? get elevatedButtonSecondarySchemeColor =>
      _elevatedButtonSecondarySchemeColor;
  void setElevatedButtonSecondarySchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _elevatedButtonSecondarySchemeColor) return;
    _elevatedButtonSecondarySchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyElevatedButtonSecondarySchemeColor, value));
  }

  late double? _elevatedButtonBorderRadius;
  double? get elevatedButtonBorderRadius => _elevatedButtonBorderRadius;
  void setElevatedButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _elevatedButtonBorderRadius) return;
    _elevatedButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyElevatedButtonBorderRadius, value));
  }

  late SchemeColor? _outlinedButtonSchemeColor;
  SchemeColor? get outlinedButtonSchemeColor => _outlinedButtonSchemeColor;
  void setOutlinedButtonSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _outlinedButtonSchemeColor) return;
    _outlinedButtonSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOutlinedButtonSchemeColor, value));
  }

  late SchemeColor? _outlinedButtonOutlineSchemeColor;
  SchemeColor? get outlinedButtonOutlineSchemeColor =>
      _outlinedButtonOutlineSchemeColor;
  void setOutlinedButtonOutlineSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _outlinedButtonOutlineSchemeColor) return;
    _outlinedButtonOutlineSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyOutlinedButtonOutlineSchemeColor, value));
  }

  late double? _outlinedButtonBorderRadius;
  double? get outlinedButtonBorderRadius => _outlinedButtonBorderRadius;
  void setOutlinedButtonBorderRadius(double? value, [bool notify = true]) {
    if (value == _outlinedButtonBorderRadius) return;
    _outlinedButtonBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOutlinedButtonBorderRadius, value));
  }

  late double? _outlinedButtonBorderWidth;
  double? get outlinedButtonBorderWidth => _outlinedButtonBorderWidth;
  void setOutlinedButtonBorderWidth(double? value, [bool notify = true]) {
    if (value == _outlinedButtonBorderWidth) return;
    _outlinedButtonBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyOutlinedButtonBorderWidth, value));
  }

  late double? _outlinedButtonPressedBorderWidth;
  double? get outlinedButtonPressedBorderWidth =>
      _outlinedButtonPressedBorderWidth;
  void setOutlinedButtonPressedBorderWidth(double? value,
      [bool notify = true]) {
    if (value == _outlinedButtonPressedBorderWidth) return;
    _outlinedButtonPressedBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(
        _themeService.save(Store.keyOutlinedButtonPressedBorderWidth, value));
  }

  late SchemeColor? _toggleButtonsSchemeColor;
  SchemeColor? get toggleButtonsSchemeColor => _toggleButtonsSchemeColor;
  void setToggleButtonsSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _toggleButtonsSchemeColor) return;
    _toggleButtonsSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyToggleButtonsSchemeColor, value));
  }

  late double? _toggleButtonsBorderRadius;
  double? get toggleButtonsBorderRadius => _toggleButtonsBorderRadius;
  void setToggleButtonsBorderRadius(double? value, [bool notify = true]) {
    if (value == _toggleButtonsBorderRadius) return;
    _toggleButtonsBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyToggleButtonsBorderRadius, value));
  }

  late double? _toggleButtonsBorderWidth;
  double? get toggleButtonsBorderWidth => _toggleButtonsBorderWidth;
  void setToggleButtonsBorderWidth(double? value, [bool notify = true]) {
    if (value == _toggleButtonsBorderWidth) return;
    _toggleButtonsBorderWidth = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyToggleButtonsBorderWidth, value));
  }

  // Switch, CheckBox and Radio SETTINGS.
  // ===========================================================================

  late bool _unselectedToggleIsColored;
  bool get unselectedToggleIsColored => _unselectedToggleIsColored;
  void setUnselectedToggleIsColored(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _unselectedToggleIsColored) return;
    _unselectedToggleIsColored = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyUnselectedToggleIsColored, value));
  }

  late SchemeColor? _switchSchemeColor;
  SchemeColor? get switchSchemeColor => _switchSchemeColor;
  void setSwitchSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _switchSchemeColor) return;
    _switchSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwitchSchemeColor, value));
  }

  late SchemeColor? _switchThumbSchemeColor;
  SchemeColor? get switchThumbSchemeColor => _switchThumbSchemeColor;
  void setSwitchThumbSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _switchThumbSchemeColor) return;
    _switchThumbSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySwitchThumbSchemeColor, value));
  }

  late SchemeColor? _checkboxSchemeColor;
  SchemeColor? get checkboxSchemeColor => _checkboxSchemeColor;
  void setCheckboxSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _checkboxSchemeColor) return;
    _checkboxSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCheckboxSchemeColor, value));
  }

  late SchemeColor? _radioSchemeColor;
  SchemeColor? get radioSchemeColor => _radioSchemeColor;
  void setRadioSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _radioSchemeColor) return;
    _radioSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyRadioSchemeColor, value));
  }

  // Slider SETTINGS.
  // ===========================================================================

  late SchemeColor? _sliderBaseSchemeColor;
  SchemeColor? get sliderBaseSchemeColor => _sliderBaseSchemeColor;
  void setSliderBaseSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _sliderBaseSchemeColor) return;
    _sliderBaseSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderBaseSchemeColor, value));
  }

  late bool _sliderValueTinted;
  bool get sliderValueTinted => _sliderValueTinted;
  void setSliderValueTinted(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _sliderValueTinted) return;
    _sliderValueTinted = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderValueTinted, value));
  }

  late double? _sliderTrackHeight;
  double? get sliderTrackHeight => _sliderTrackHeight;
  void setSliderTrackHeight(double? value, [bool notify = true]) {
    if (value == _sliderTrackHeight) return;
    _sliderTrackHeight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySliderTrackHeight, value));
  }

  // Fab, Chip, SnackBar, Popup, Card nad Dialog SETTINGS.
  // ===========================================================================

  late bool _fabUseShape;
  bool get fabUseShape => _fabUseShape;
  void setFabUseShape(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _fabUseShape) return;
    _fabUseShape = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabUseShape, value));
  }

  late bool _fabAlwaysCircular;
  bool get fabAlwaysCircular => _fabAlwaysCircular;
  void setFabAlwaysCircular(bool? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _fabAlwaysCircular) return;
    _fabAlwaysCircular = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabAlwaysCircular, value));
  }

  late double? _fabBorderRadius;
  double? get fabBorderRadius => _fabBorderRadius;
  void setFabBorderRadius(double? value, [bool notify = true]) {
    if (value == _fabBorderRadius) return;
    _fabBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabBorderRadius, value));
  }

  late SchemeColor? _fabSchemeColor;
  SchemeColor? get fabSchemeColor => _fabSchemeColor;
  void setFabSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _fabSchemeColor) return;
    _fabSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyFabSchemeColor, value));
  }

  late SchemeColor? _chipSchemeColor;
  SchemeColor? get chipSchemeColor => _chipSchemeColor;
  void setChipSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _chipSchemeColor) return;
    _chipSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipSchemeColor, value));
  }

  late SchemeColor? _chipSelectedSchemeColor;
  SchemeColor? get chipSelectedSchemeColor => _chipSelectedSchemeColor;
  void setChipSelectedSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _chipSelectedSchemeColor) return;
    _chipSelectedSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipSelectedSchemeColor, value));
  }

  late SchemeColor? _chipDeleteIconSchemeColor;
  SchemeColor? get chipDeleteIconSchemeColor => _chipDeleteIconSchemeColor;
  void setChipDeleteIconSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _chipDeleteIconSchemeColor) return;
    _chipDeleteIconSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipDeleteIconSchemeColor, value));
  }

  late double? _chipBorderRadius;
  double? get chipBorderRadius => _chipBorderRadius;
  void setChipBorderRadius(double? value, [bool notify = true]) {
    if (value == _chipBorderRadius) return;
    _chipBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyChipBorderRadius, value));
  }

  late SchemeColor? _snackBarSchemeColor;
  SchemeColor? get snackBarSchemeColor => _snackBarSchemeColor;
  void setSnackBarSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _snackBarSchemeColor) return;
    _snackBarSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySnackBarSchemeColor, value));
  }

  late SchemeColor? _popupMenuSchemeColor;
  SchemeColor? get popupMenuSchemeColor => _popupMenuSchemeColor;
  void setPopupMenuSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _popupMenuSchemeColor) return;
    _popupMenuSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuSchemeColor, value));
  }

  late double _popupMenuOpacity;
  double get popupMenuOpacity => _popupMenuOpacity;
  void setPopupMenuOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _popupMenuOpacity) return;
    _popupMenuOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuOpacity, value));
  }

  late double? _popupMenuElevation;
  double? get popupMenuElevation => _popupMenuElevation;
  void setPopupMenuElevation(double? value, [bool notify = true]) {
    if (value == _popupMenuElevation) return;
    _popupMenuElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuElevation, value));
  }

  late double? _popupMenuBorderRadius;
  double? get popupMenuBorderRadius => _popupMenuBorderRadius;
  void setPopupMenuBorderRadius(double? value, [bool notify = true]) {
    if (value == _popupMenuBorderRadius) return;
    _popupMenuBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPopupMenuBorderRadius, value));
  }

  late double? _cardBorderRadius;
  double? get cardBorderRadius => _cardBorderRadius;
  void setCardBorderRadius(double? value, [bool notify = true]) {
    if (value == _cardBorderRadius) return;
    _cardBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyCardBorderRadius, value));
  }

  late SchemeColor? _dialogBackgroundSchemeColor;
  SchemeColor? get dialogBackgroundSchemeColor => _dialogBackgroundSchemeColor;
  void setDialogBackgroundSchemeColor(SchemeColor? value,
      [bool notify = true]) {
    if (value == _dialogBackgroundSchemeColor) return;
    _dialogBackgroundSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDialogBackgroundSchemeColor, value));
  }

  late double? _dialogBorderRadius;
  double? get dialogBorderRadius => _dialogBorderRadius;
  void setDialogBorderRadius(double? value, [bool notify = true]) {
    if (value == _dialogBorderRadius) return;
    _dialogBorderRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDialogBorderRadius, value));
  }

  late double? _dialogElevation;
  double? get dialogElevation => _dialogElevation;
  void setDialogElevation(double? value, [bool notify = true]) {
    if (value == _dialogElevation) return;
    _dialogElevation = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyDialogElevation, value));
  }

  // Tooltip SETTINGS.
  // ===========================================================================

  late double? _tooltipRadius;
  double? get tooltipRadius => _tooltipRadius;
  void setTooltipRadius(double? value, [bool notify = true]) {
    if (value == _tooltipRadius) return;
    _tooltipRadius = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipRadius, value));
  }

  late int? _tooltipWaitDuration;
  int? get tooltipWaitDuration => _tooltipWaitDuration;
  void setTooltipWaitDuration(int? value, [bool notify = true]) {
    if (value == _tooltipWaitDuration) return;
    _tooltipWaitDuration = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipWaitDuration, value));
  }

  late int? _tooltipShowDuration;
  int? get tooltipShowDuration => _tooltipShowDuration;
  void setTooltipShowDuration(int? value, [bool notify = true]) {
    if (value == _tooltipShowDuration) return;
    _tooltipShowDuration = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipShowDuration, value));
  }

  late SchemeColor? _tooltipSchemeColor;
  SchemeColor? get tooltipSchemeColor => _tooltipSchemeColor;
  void setTooltipSchemeColor(SchemeColor? value, [bool notify = true]) {
    if (value == _tooltipSchemeColor) return;
    _tooltipSchemeColor = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipSchemeColor, value));
  }

  late double _tooltipOpacity;
  double get tooltipOpacity => _tooltipOpacity;
  void setTooltipOpacity(double? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tooltipOpacity) return;
    _tooltipOpacity = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTooltipOpacity, value));
  }

  // Custom surface tint color SETTINGS.
  // ===========================================================================

  late Color? _surfaceTintLight;
  Color? get surfaceTintLight => _surfaceTintLight;
  void setSurfaceTintLight(Color? value, [bool notify = true]) {
    if (value == _surfaceTintLight) return;
    _surfaceTintLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceTintLight, value));
  }

  late Color? _surfaceTintDark;
  Color? get surfaceTintDark => _surfaceTintDark;
  void setSurfaceTintDark(Color? value, [bool notify = true]) {
    if (value == _surfaceTintDark) return;
    _surfaceTintDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySurfaceTintDark, value));
  }

  // Custom color SETTINGS.
  // ===========================================================================

  late Color _primaryLight;
  Color get primaryLight => _primaryLight;
  void setPrimaryLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryLight) return;
    _primaryLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryLight, value));
  }

  late Color _primaryContainerLight;
  Color get primaryContainerLight => _primaryContainerLight;
  void setPrimaryContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryContainerLight) return;
    _primaryContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryContainerLight, value));
  }

  late Color _secondaryLight;
  Color get secondaryLight => _secondaryLight;
  void setSecondaryLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryLight) return;
    _secondaryLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryLight, value));
  }

  late Color _secondaryContainerLight;
  Color get secondaryContainerLight => _secondaryContainerLight;
  void setSecondaryContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryContainerLight) return;
    _secondaryContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryContainerLight, value));
  }

  late Color _tertiaryLight;
  Color get tertiaryLight => _tertiaryLight;
  void setTertiaryLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryLight) return;
    _tertiaryLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryLight, value));
  }

  late Color _tertiaryContainerLight;
  Color get tertiaryContainerLight => _tertiaryContainerLight;
  void setTertiaryContainerLight(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryContainerLight) return;
    _tertiaryContainerLight = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryContainerLight, value));
  }

  late Color _primaryDark;
  Color get primaryDark => _primaryDark;
  void setPrimaryDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryDark) return;
    _primaryDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryDark, value));
  }

  late Color _primaryContainerDark;
  Color get primaryContainerDark => _primaryContainerDark;
  void setPrimaryContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _primaryContainerDark) return;
    _primaryContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyPrimaryContainerDark, value));
  }

  late Color _secondaryDark;
  Color get secondaryDark => _secondaryDark;
  void setSecondaryDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryDark) return;
    _secondaryDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryDark, value));
  }

  late Color _secondaryContainerDark;
  Color get secondaryContainerDark => _secondaryContainerDark;
  void setSecondaryContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _secondaryContainerDark) return;
    _secondaryContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keySecondaryContainerDark, value));
  }

  late Color _tertiaryDark;
  Color get tertiaryDark => _tertiaryDark;
  void setTertiaryDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryDark) return;
    _tertiaryDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryDark, value));
  }

  late Color _tertiaryContainerDark;
  Color get tertiaryContainerDark => _tertiaryContainerDark;
  void setTertiaryContainerDark(Color? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _tertiaryContainerDark) return;
    _tertiaryContainerDark = value;
    if (notify) notifyListeners();
    unawaited(_themeService.save(Store.keyTertiaryContainerDark, value));
  }

  // Get custom scheme data based on currently defined scheme colors.
  FlexSchemeData get customScheme => FlexSchemeData(
        name: FlexColor.customName,
        description: FlexColor.customDescription,
        light: FlexSchemeColor(
          primary: primaryLight,
          primaryContainer: primaryContainerLight,
          secondary: secondaryLight,
          secondaryContainer: secondaryContainerLight,
          tertiary: tertiaryLight,
          tertiaryContainer: tertiaryContainerLight,
          appBarColor: secondaryContainerLight,
          error: FlexColor.materialLightError,
        ),
        dark: FlexSchemeColor(
          primary: primaryDark,
          primaryContainer: primaryContainerDark,
          secondary: secondaryDark,
          secondaryContainer: secondaryContainerDark,
          tertiary: tertiaryDark,
          tertiaryContainer: tertiaryContainerDark,
          appBarColor: secondaryContainerDark,
          error: FlexColor.materialDarkError,
        ),
      );

  // Set the custom scheme colors to the colors scheme FlexSchemeData.
  void setCustomScheme(FlexSchemeData scheme) {
    // Don't notify listeners while setting new values for each value.
    setPrimaryLight(scheme.light.primary, false);
    setPrimaryContainerLight(scheme.light.primaryContainer, false);
    setSecondaryLight(scheme.light.secondary, false);
    setSecondaryContainerLight(scheme.light.secondaryContainer, false);
    setTertiaryLight(scheme.light.tertiary, false);
    setTertiaryContainerLight(scheme.light.tertiaryContainer, false);
    setPrimaryDark(scheme.dark.primary, false);
    setPrimaryContainerDark(scheme.dark.primaryContainer, false);
    setSecondaryDark(scheme.dark.secondary, false);
    setSecondaryContainerDark(scheme.dark.secondaryContainer, false);
    setTertiaryDark(scheme.dark.tertiary, false);
    setTertiaryContainerDark(scheme.dark.tertiaryContainer, false);
    // Notify listeners, after all individual values have been set.
    notifyListeners();
  }

  // This is just a controller prop for the Platform menu control.
  // It is used as input to the theme, but never persisted so it always
  // defaults to the actual target platform when starting the app.
  // Being able to toggle it during demos and development is a handy feature.
  //
  // This is OK to be in ThemeController, if this is changed, the entire app
  // theme must update too, and yes it is a part of ThemeData.
  late TargetPlatform _platform;
  TargetPlatform get platform => _platform;
  void setPlatform(TargetPlatform? value, [bool notify = true]) {
    if (value == null) return;
    if (value == _platform) return;
    _platform = value;
    if (notify) notifyListeners();
  }

  // Recently used colors, we keep the list of recently used colors in the
  // color picker for custom colors only during the session we don't persist.
  // It is of course possible to persist, but not needed in this demo.
  //
  // This is OK to be in ThemeController, these colors change as we change
  // custom colors for the theme, that needs to update the entire app anyway.
  List<Color> _recentColors = <Color>[];
  List<Color> get recentColors => _recentColors;
  // ignore: use_setters_to_change_properties
  void setRecentColors(final List<Color> colors) {
    _recentColors = colors;
  }

  // Helper ChangeNotifiers tucked into ThemeController because I'm lazy.
  // ===========================================================================
  // TODO(rydmike): Future app version, consider own inherited widget.

  // This is just a controller prop for hovered color on Colorscheme.
  Color? _hoverColor;
  Color? get hoverColor => _hoverColor;
  void setHoverColor(Color? value, [bool notify = true]) {
    if (value == _hoverColor) return;
    _hoverColor = value;
    if (notify) notifyListeners();
  }

  // This is just a controller prop for hovered palette on Colorscheme.
  TonalPalettes? _hoverTonalPalette;
  TonalPalettes? get hoverTonalPalette => _hoverTonalPalette;
  void setHoverTonalPalette(TonalPalettes? value, [bool notify = true]) {
    if (value == _hoverTonalPalette) return;
    _hoverTonalPalette = value;
    if (notify) notifyListeners();
  }
}
