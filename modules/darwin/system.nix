{ pkgs, ... }: {
  system = {
    keyboard = {
      enableKeyMapping = false;
      # remapCapsLockToEscape = true;
    };
    defaults = {
      # `man configuration.nix` on mac is useful in seeing available options
      # `defaults read -g` on mac is useful to see current settings
      LaunchServices = {
        # quarantine downloads until approved
        LSQuarantine = true;
      };
      menuExtraClock = {
        Show24Hour = false;
        ShowAMPM = true;
        ShowDate = 0;
      };
      # login window settings
      loginwindow = {
        # disable guest account
        GuestEnabled = false;
        # show name instead of username
        SHOWFULLNAME = false;
        # Disables the ability for a user to access the console by typing “>console” for a username at the login window.
        DisableConsoleAccess = true;
      };

      # file viewer settings
      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        _FXShowPosixPathInTitle = true;
        # Use list view in all Finder windows by default
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      # trackpad settings
      trackpad = {
        # silent clicking = 0, default = 1
        ActuationStrength = 0;
        # enable tap to click
        Clicking = true;
        Dragging = true; # tap and a half to drag
        # three finger click and drag
        TrackpadThreeFingerDrag = true;
      };

      # firewall settings
      alf = {
        # 0 = disabled 1 = enabled 2 = blocks all connections except for essential services
        globalstate = 1;
        loggingenabled = 0;
        stealthenabled = 1;
      };

      spaces.spans-displays = false; # separate spaces on each display

      # dock settings
      dock = {
        # auto show and hide dock
        autohide = true;
        # remove delay for showing dock
        autohide-delay = 0.0;
        # how fast is the dock showing animation
        autohide-time-modifier = 0.2;
        expose-animation-duration = 0.2;
        tilesize = 48;
        launchanim = false;
        static-only = false;
        showhidden = true;
        show-recents = false;
        show-process-indicators = true;
        orientation = "bottom";
        mru-spaces = false;
        # mouse in top right corner will (5) start screensaver
        wvous-tr-corner = 5;
      };

      # universalaccess = {
      # get rid of extra transparency in menu bar and elsewhere
      # reduceTransparency = false;
      # };

      NSGlobalDomain = {
        AppleEnableSwipeNavigateWithScrolls = true;
        # 2 = heavy font smoothing; if text looks blurry, back this down to 1
        AppleFontSmoothing = 2;
        AppleShowAllExtensions = true;
        # Dark mode
        AppleInterfaceStyle = "Dark";
        # auto switch between light/dark mode
        AppleInterfaceStyleSwitchesAutomatically = false;
        "com.apple.sound.beep.feedback" = 1;
        "com.apple.sound.beep.volume" = 0.606531; # 50%
        "com.apple.mouse.tapBehavior" = 1; # tap to click
        "com.apple.swipescrolldirection" = true; # "natural" scrolling
        "com.apple.keyboard.fnState" = false;
        "com.apple.springing.enabled" = false;
        "com.apple.trackpad.scaling" = 3.0; # fast
        "com.apple.trackpad.enableSecondaryClick" = true;
        # enable full keyboard control
        # (e.g. enable Tab in modal dialogs)
        AppleKeyboardUIMode = 3;
        AppleTemperatureUnit = "Celsius";
        AppleMeasurementUnits = "Centimeters";
        # no popup menus when holding down letters
        ApplePressAndHoldEnabled = false;
        # delay before repeating keystrokes
        InitialKeyRepeat = 14;
        # delay between repeated keystrokes upon holding a key
        KeyRepeat = 1;
        AppleShowScrollBars = "Automatic";
        NSScrollAnimationEnabled = true; # smooth scrolling
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        # no automatic smart quotes
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        # speed up animation on open/save boxes (default:0.2)
        NSWindowResizeTime = 1.0e-3;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };
      CustomSystemPreferences = { };
      CustomUserPreferences = {
        NSGlobalDomain = {
          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.screensaver" = {
          # Require password immediately after sleep or screen saver begins
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.screencapture" = {
          location = "~/Downloads";
          type = "png";
        };
        "com.apple.mail" = {
          # Disable inline attachments (just show the icons)
          DisableInlineAttachmentViewing = true;
        };
        "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };
        "com.apple.print.PrintingPrefs" = {
          # Automatically quit printer app once the print jobs complete
          "Quit When Finished" = true;
        };
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          # Check for software updates daily, not just once per week
          ScheduleFrequency = 1;
          # Download newly available updates in background
          AutomaticDownload = 1;
          # Install System data files & security updates
          CriticalUpdateInstall = 1;
        };
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
        # Turn on app auto-update
        "com.apple.commerce".AutoUpdate = true;
        "com.raycast.macos" = {
          "NSStatusItem Visible raycastIcon" = 0;
          commandsPreferencesExpandedItemIds = [
            "builtin_package_navigation"
            "builtin_package_scriptCommands"
            "builtin_package_floatingNotes"
          ];
          "emojiPicker_skinTone" = "mediumLight";
          initialSpotlightHotkey = "Command-49";
          navigationCommandStyleIdentifierKey = "legacy";
          "onboarding_canShowActionPanelHint" = 0;
          "onboarding_canShowBackNavigationHint" = 0;
          "onboarding_completedTaskIdentifiers" = [
            "startWalkthrough"
            "calendar"
            "setHotkeyAndAlias"
            "snippets"
            "quicklinks"
            "installFirstExtension"
            "floatingNotes"
            "windowManagement"
            "calculator"
            "raycastShortcuts"
            "openActionPanel"
          ];
          organizationsPreferencesTabVisited = 1;
          popToRootTimeout = 60;
          raycastAPIOptions = 8;
          raycastGlobalHotkey = "Command-49";
          raycastPreferredWindowMode = "default";
          raycastShouldFollowSystemAppearance = 1;
          raycastWindowPresentationMode = 1;
          showGettingStartedLink = 0;
          "store_termsAccepted" = 1;
          suggestedPreferredGoogleBrowser = 1;
        };
      };
    };
    activationScripts.extraActivation.enable = true;
    activationScripts.extraActivation.text = ''
      echo "Activating extra preferences..."
      # Close any open System Preferences panes, to prevent them from overriding
      # settings we’re about to change
      osascript -e 'tell application "System Preferences" to quit'

      # Show the ~/Library folder
      # chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

      # Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
      # defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

      # Display emails in threaded mode, sorted by date (newest at the top)
      defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
      defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "no"
      defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

      defaults write com.apple.spotlight orderedItems -array \
          '{"enabled" = 1;"name" = "APPLICATIONS";}' \
          '{"enabled" = 1;"name" = "DIRECTORIES";}' \
          '{"enabled" = 1;"name" = "PDF";}' \
          '{"enabled" = 1;"name" = "DOCUMENTS";}' \
          '{"enabled" = 1;"name" = "PRESENTATIONS";}' \
          '{"enabled" = 1;"name" = "SPREADSHEETS";}' \
          '{"enabled" = 1;"name" = "MENU_OTHER";}' \
          '{"enabled" = 1;"name" = "CONTACT";}' \
          '{"enabled" = 1;"name" = "IMAGES";}' \
          '{"enabled" = 1;"name" = "MESSAGES";}' \
          '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
          '{"enabled" = 1;"name" = "EVENT_TODO";}' \
          '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
          '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
          '{"enabled" = 0;"name" = "FONTS";}' \
          '{"enabled" = 0;"name" = "BOOKMARKS";}' \
          '{"enabled" = 0;"name" = "MUSIC";}' \
          '{"enabled" = 0;"name" = "MOVIES";}' \
          '{"enabled" = 0;"name" = "SOURCE";}' \
          '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
          '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
          '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
    '';
    activationScripts.postUserActivation.text = ''
      # Following line should allow us to avoid a logout/login cycle
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
    # backwards compat; don't change
    stateVersion = 4;
  };
}
