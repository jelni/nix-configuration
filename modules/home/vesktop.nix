{ ... }:
{
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "canary";
      enableSplashScreen = false;

      spellCheckLanguages = [
        "en-US"
        "pl"
      ];
    };

    vencord = {
      settings = {
        useQuickCss = false;
        enabledThemes = [ "hide-nitro-gift.css" ];

        themeLinks = [
          "https://croissantdunord.github.io/discord-adblock/adblock.css"
          "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
        ];

        plugins = {
          AccountPanelServerProfile.enabled = true;
          AlwaysTrust.enabled = true;
          AutomodContext.enabled = true;
          BetterRoleContext.enabled = true;
          BetterUploadButton.enabled = true;
          BiggerStreamPreview.enabled = true;
          ClearURLs.enabled = true;
          CopyStickerLinks.enabled = true;

          CrashHandler = {
            enabled = true;
            attemptToNavigateToHome = true;
          };

          DisableCallIdle.enabled = true;
          DontRoundMyTimestamps.enabled = true;
          Experiments.enabled = true;
          FavoriteEmojiFirst.enabled = true;
          FixCodeblockGap.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          ForceOwnerCrown.enabled = true;
          FriendInvites.enabled = true;
          FriendsSince.enabled = true;
          FullSearchContext.enabled = true;
          FullUserInChatbox.enabled = true;
          FxTwitter.enabled = true;
          GreetStickerPicker.enabled = true;
          ImplicitRelationships.enabled = true;
          LoadingQuotes.enabled = true;
          MaskedLinkPaste.enabled = true;
          MemberCount.enabled = true;
          MentionAvatars.enabled = true;

          MessageLatency = {
            enabled = true;
            latency = 10;
            detectDiscordKotlin = false;
            showMillis = true;
          };

          MessageLinkEmbeds = {
            enabled = true;
            automodEmbeds = "prefer";
          };

          MessageLogger = {
            enabled = true;
            deleteStyle = "overlay";
            ignoreBots = true;
            ignoreSelf = true;
          };

          NoDevtoolsWarning.enabled = true;
          NoF1.enabled = true;
          NoMaskedUrlPaste.enabled = true;
          NoRPC.enabled = true;

          NotificationVolume = {
            enabled = true;
            notificationVolume = 25;
          };

          NoUnblockToJump.enabled = true;
          OnePingPerDM = {
            enabled = true;
            allowMentions = true;
          };

          PermissionFreeWill.enabled = true;

          PermissionsViewer = {
            enabled = true;
            permissionsSortOrder = 1;
          };

          PlatformIndicators = {
            enabled = true;
            list = false;
            messages = false;
          };

          QuickReply.enabled = true;
          ReplyTimestamp.enabled = true;

          ReviewDB = {
            enabled = true;
            showWarning = false;
            hideBlockedUsers = false;
          };

          RoleColorEverywhere.enabled = true;
          SecretRingToneEnabler.enabled = true;
          ServerInfo.enabled = true;
          ServerListIndicators.enabled = true;

          ShikiCodeblocks = {
            enabled = true;
            theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/main/packages/tm-themes/themes/github-dark.json";
            tryHljs = "ALWAYS";
            useDevIcon = "DISABLED";
          };

          ShowAllMessageButtons.enabled = true;
          ShowHiddenChannels.enabled = true;
          ShowHiddenThings.enabled = true;

          ShowMeYourName = {
            enabled = true;
            mode = "nick-user";
          };

          ShowTimeoutDuration = {
            enabled = true;
            displayStyle = "tooltip";
          };

          SortFriendRequests.enabled = true;
          TimeBarAllActivities.enabled = true;

          Translate = {
            enabled = true;
            showChatBarButton = false;
          };

          TypingIndicator = {
            enabled = true;
            includeMutedChannels = true;
            includeBlockedUsers = true;
          };

          TypingTweaks.enabled = true;
          Unindent.enabled = true;
          UnsuppressEmbeds.enabled = true;
          UserVoiceShow.enabled = true;
          USRBG.enabled = true;
          ValidReply.enabled = true;
          ValidUser.enabled = true;

          ViewIcons = {
            enabled = true;
            format = "png";
          };

          ViewRaw.enabled = true;
          VoiceChatDoubleClick.enabled = true;
          VoiceDownload.enabled = true;
          VolumeBooster.enabled = true;
          WebKeybinds.enabled = true;
          WebScreenShareFixes.enabled = true;
          YoutubeAdblock.enabled = true;
        };

        notifications = {
          timeout = 2500;
          useNative = "never";
        };
      };

      themes.hide-nitro-gift = ''
        div[class*="channelTextArea_"] div[class*="buttons__"] > div:nth-of-type(3) {
          display: none;
        }
      '';
    };
  };
}
