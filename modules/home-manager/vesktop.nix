{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.vesktop;
in {
  options.modules.vesktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the vesktop module";
  };

  config = lib.mkIf cfg.enable {
    programs.vesktop = {
      enable = true;
      package = pkgs.vesktop;

      settings = {
        appBadge = false;
        arRPC = true;
        checkUpdates = true;
        customTitleBar = false;
        splashBackground = "#000000";
        splashColor = "#ffffff";
        splashTheming = true;
        staticTitle = false;
        hardwareAcceleration = true;
        discordBranch = "stable";
      };
      vencord = {
        useSystem = true;

        settings = {
          autoUpdate = false;
          autoUpdateNotification = false;
          notifyAboutUpdates = true;
          useQuickCss = true;
          disableMinSize = true;

          plugins = {
            AlwaysExpandRoles = {
              enabled = true;
            };

            AlwaysTrust = {
              enabled = true;
            };

            AnonymiseFileNames = {
              enabled = true;
            };

            BetterGifPicker = {
              enabled = true;
            };

            BetterRoleContext = {
              enabled = true;
            };

            BetterUploadButton = {
              enabled = true;
            };

            BiggerStreamPreview = {
              enabled = true;
            };

            CallTimer = {
              enabled = true;
            };

            ClearURLs = {
              enabled = true;
            };

            ClientTheme = {
              # rewview prob not needed with themes
              enabled = true;
            };

            CopyEmojiMarkdown = {
              enabled = true;
            };

            CopyFileContents = {
              enabled = true;
            };

            CopyUserURLs = {
              enabled = true;
            };

            DisableCallIdle = {
              enabled = true;
            };

            Experiments = {
              enabled = true;
            };

            FavoriteGifSearch = {
              enabled = true;
            };

            FixImagesQuality = {
              enabled = true;
            };

            ForceOwnerCrown = {
              enabled = true;
            };

            FriendsSince = {
              enabled = true;
            };

            FullSearchContext = {
              enabled = true;
            };

            GameActivityToggle = {
              enabled = true;
            };

            GifPaste = {
              enabled = true;
            };

            GreetStickerPicker = {
              enabled = true;
            };

            iLoveSpam = {
              enabled = true;
            };

            ImageLink = {
              enabled = true;
            };

            ImageZoom = {
              enabled = true;
            };

            ImplicitRelationships = {
              enabled = true;
            };

            MemberCount = {
              enabled = true;
            };

            MentionAvatars = {
              enabled = true;
            };

            MessageClickActions = {
              enabled = true;
            };

            MessageLatency = {
              enabled = true;
            };

            MessageLogger = {
              enabled = true;
              ignoreSelf = true;
            };

            MessageTags = {
              enabled = true;
            };

            MutualGroupDMs = {
              enabled = true;
            };

            NoF1 = {
              enabled = true;
            };

            PermissionsViewer = {
              enabled = true;
            };

            PlatformIndicators = {
              enabled = true;
            };

            PreviewMessage = {
              enabled = true;
            };

            QuickMention = {
              enabled = true;
            };

            RelationshipNotifier = {
              enabled = true;
            };

            ReviewDB = {
              enabled = true;
            };

            ServerInfo = {
              enabled = true;
            };

            ShowHiddenChannels = {
              enabled = true;
            };

            ShowHiddenThings = {
              enabled = true;
            };

            ShowTimeoutDuration = {
              enabled = true;
            };

            StreamerModeOnStream = {
              # remove if annoying
              enabled = true;
            };

            TypingIndicator = {
              enabled = true;
            };

            VcNarrator = {
              # remove if annoying
              enabled = true;
            };

            ViewRaw = {
              enabled = true;
            };

            VoiceDownload = {
              enabled = true;
            };

            VolumeBooster = {
              enabled = true;
            };

            WhoReacted = {
              enabled = true;
            };

            YoutubeAdblock = {
              enabled = true;
            };
          };

          #          themes = {
          #            "myCoolTheme" = ''
          #              body {
          #                background: #222;
          #                color: #eee;
          #              }
          #            '';
          #            enabledThemes = ["myCoolTheme.css"];
          #           };
          #         "anotherTheme" = /home/user/path/to/anotherTheme.css;
          #         };
        };
      };
    };
  };
}
