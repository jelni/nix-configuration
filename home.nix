{
  lib,
  pkgs,
  config,
  firefox,
  ...
}:
{
  home = {
    username = "jel";
    homeDirectory = "/home/jel";

    shellAliases = {
      cat = "bat";
    };

    stateVersion = "25.05";
  };

  programs = {
    aria2.enable = true;

    bat = {
      enable = true;
      config.pager = "moor -no-linenumbers";
    };

    bottom.enable = true;
    claude-code.enable = true;

    delta = {
      enable = true;
      enableGitIntegration = true;
      enableJujutsuIntegration = true;
    };

    firefox = {
      enable = true;
      package = firefox.packages.x86_64-linux.firefox-nightly-bin;

      policies = {
        "3rdparty".Extensions."uBlock0@raymondhill.net".adminSettings = builtins.toJSON {
          userSettings = {
            advancedUserEnabled = true;
            cnameUncloakEnabled = false;
            contextMenuEnabled = false;
            popupPanelSections = 31;
            prefetchingDisabled = false;
          };

          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "ublock-experimental"
            "easylist"
            "adguard-generic"
            "easyprivacy"
            "urlhaus-1"
            "plowe-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "adguard-cookies"
            "ublock-cookies-adguard"
            "fanboy-social"
            "adguard-social"
            "fanboy-thirdparty_social"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-widgets"
            "ublock-annoyances"
            "POL-3"
            "POL-0"
          ];

          whitelist = [
            "chrome-extension-scheme"
            "moz-extension-scheme"
            "dash.cloudflare.com"
            "insights.hotjar.com"
          ];

          dynamicFilteringString = ''
            * * 3p-frame block
            * * 3p-script block
            * ajax.googleapis.com * noop
            * auth0.com * noop
            * awswaf.com * noop
            * cdnjs.cloudflare.com * noop
            * challenges.cloudflare.com * noop
            * cloudfront.net * noop
            * discourse-cdn.com * noop
            * disqus.com * noop
            * c.disquscdn.com * noop
            * static-2v.gitbook.com * noop
            * www.google.com * noop
            * googleusercontent.com * noop
            * gstatic.com * noop
            * hcaptcha.com * noop
            * js.hcaptcha.com * noop
            * code.highcharts.com * noop
            * code.jquery.com * noop
            * cdn.jsdelivr.net * noop
            * umap.openstreetmap.fr * noop
            * recaptcha.net * noop
            * revolut.com * noop
            * cdn.shopify.com * noop
            * platform.twitter.com * noop
            * unpkg.com * noop
            * website-files.com * noop
            * cdn.weglot.com * noop
            aftership.com websites.am-static.com * noop
            ai-maturity-index.com js.hsforms.net * noop
            app.ai-maturity-index.com public.flourish.studio * noop
            app.ai-maturity-index.com senja.io * noop
            app.ai-maturity-index.com flo.uri.sh * noop
            app.staging.ai-maturity-index.com public.flourish.studio * noop
            app.staging.ai-maturity-index.com flo.uri.sh * noop
            app.staging.ai-maturity-index.com app.viral-loops.com * noop
            ai-mentor.space ai-maturity-index.com * noop
            airbnb.com maps.googleapis.com * noop
            airbnb.com a0.muscache.com * noop
            airbnb.pl a0.muscache.com * noop
            aliexpress.com alicdn.com * noop
            aliexpress.com assets.aliexpress-media.com * noop
            pl.aliexpress.com alicdn.com * noop
            pl.aliexpress.com assets.aliexpress-media.com * noop
            iexpfront-sea-global.alipay.com cdn.marmot-cloud.com * noop
            allegro.pl assets.allegrostatic.com * noop
            allegro.pl captcha-delivery.com * noop
            allegrolokalnie.pl lokalnie-prod-assets.storage.googleapis.com * noop
            amazon.com m.media-amazon.com * noop
            aws.amazon.com awsstatic.com * noop
            console.anthropic.com accounts.google.com * noop
            music.apple.com appleid.cdn-apple.com * noop
            ashbyhq.com cdn.ashbyprd.com * noop
            id.atlassian.com atl-paas.net * noop
            start.atlassian.com atl-paas.net * noop
            shop.aurora-music.com cdn.shopify.com * noop
            bandcamp.com bcbits.com * noop
            bandcamp.com core.spreedly.com * noop
            behind-the-scene * * noop
            behind-the-scene * 1p-script noop
            behind-the-scene * 3p noop
            behind-the-scene * 3p-frame noop
            behind-the-scene * 3p-script noop
            behind-the-scene * image noop
            behind-the-scene * inline-script noop
            binance.com bnbstatic.com * noop
            academy.binance.com bnbstatic.com * noop
            accounts.binance.com bnbstatic.com * noop
            booking.com cf.bstatic.com * noop
            account.booking.com bstatic.com * noop
            my.brain.fm js.stripe.com * noop
            buster.so framerusercontent.com * noop
            chatgpt.com cdn.oaistatic.com * noop
            chatgpt.com web-sandbox.oaiusercontent.com * noop
            sora.chatgpt.com sora-cdn.oaistatic.com * noop
            claude.ai www.claudeusercontent.com * noop
            claude.ai accounts.google.com * noop
            codepen.io cdpn.io * noop
            newsletter.coingecko.com gr-cdn.com * noop
            combot.org telegram.org * noop
            unsubscribe.convertkit.com cdn.kit.com * noop
            cooltext.com ct.mob0.com * noop
            dagnymusic.com widget-app.songkick.com * noop
            dailymotion.com static1.dmcdn.net * noop
            darntough.eu snapui.searchspring.io * noop
            darntough.eu cdn.shopify.com * noop
            dbrand.com cdn.db.io * noop
            dbrand.com google.com * noop
            shop.dbrand.com cdn.shopify.com * noop
            deezer.com cdn-files.dzcdn.net * noop
            account.deezer.com cdn-assets.dzcdn.net * noop
            discord.com discordsays.com * noop
            discord.com www.youtube.com * noop
            app.docker.com dockerstatic.com * noop
            hub.docker.com dockerstatic.com * noop
            hub.docker.com dev.visualwebsiteoptimizer.com * noop
            dropbox.com cfl.dropboxstatic.com * noop
            dropbox.com dropboxusercontent.com * noop
            explorer.duinocoin.com bernii.github.io * noop
            dziennikzachodni.pl ppstatic.pl * noop
            epicgames.com static-assets-prod.unrealengine.com * noop
            esesja.tv vjs.zencdn.net * noop
            facebook.com meta-api.arkoselabs.com * noop
            facebook.com static.xx.fbcdn.net * noop
            facebook.com www.fbsbx.com * noop
            fakturownia.pl assets2.firmlet.com * noop
            secure.fastcloudpay.com cardinalcommerce.com * noop
            frame.work js.stripe.com * noop
            genius.com filepicker.io * noop
            genius.com pusher.com * block
            getdrip.com drip.com * noop
            github.com github.githubassets.com * noop
            github.com viewscreen.githubusercontent.com * noop
            github.com zuora.com * noop
            support.github.com support-assets.githubassets.com * noop
            gnosispay.com framerusercontent.com * noop
            goofish.com g.alicdn.com * noop
            google.com maps.googleapis.com * noop
            ads.google.com tpc.googlesyndication.com * noop
            calendar.google.com maps.googleapis.com * noop
            cloud.google.com gweb-cloud-chat-prod.appspot.com * noop
            developers.google.com maps.googleapis.com * noop
            support.google.com www.youtube.com * noop
            console.groq.com stytch.com * noop
            app.hubspot.com static.hsappstatic.net * noop
            app.hubspot.com hubspotpreview-na1.com * noop
            app.hubspot.com hubspotusercontent-na1.net * noop
            app.humanornot.ai cdn.amplitude.com * noop
            iamlights.com campaigner.com * noop
            help.imgur.com static.zdassets.com * noop
            dash.infinityfree.com html-load.com * noop
            forum.infinityfree.com forum-cdn.infinityfree.net * noop
            instagram.com static.cdninstagram.com * noop
            isg-one.com jobs.jobvite.com * noop
            sebastian.itch.io cloudflarestorage.com * noop
            jsonformatter.org unpkg.com * noop
            kagi.com api.mapbox.com * noop
            ko-fi.com google.com * noop
            kotaku.com x.kinja-static.com * noop
            latarnikwyborczy.pl stackpath.bootstrapcdn.com * noop
            linkedin.com static.licdn.com * noop
            account.live.com msauth.net * noop
            login.live.com logincdn.msftauth.net * noop
            teams.live.com statics.teams.cdn.live.net * noop
            llama.com static.xx.fbcdn.net * noop
            web.lmarena.ai e2b-foxtrot.dev * noop
            aurora.lnk.to static.assetlab.io * noop
            dagny.lnk.to static.assetlab.io * noop
            localhost public.flourish.studio * noop
            localhost www.googletagmanager.com * noop
            localhost flo.uri.sh * noop
            localhost app.viral-loops.com * noop
            loudnesspenalty.com maxcdn.bootstrapcdn.com * noop
            magiceden.io next.cdn.magiceden.dev * noop
            manus.im files.manuscdn.com * noop
            messenger.com static.xx.fbcdn.net * noop
            mexc.com static.mocortech.com * noop
            microsoft.com mem.gfx.ms * noop
            copilot.microsoft.com studiostaticassetsprod.azureedge.net * noop
            teams.microsoft.com login.microsoftonline.com * noop
            teams.microsoft.com statics.teams.cdn.office.net * noop
            login.microsoftonline.com aadcdn.msauth.net * noop
            login.microsoftonline.com aadcdn.msftauth.net * noop
            minecraft.net www.microsoft.com * noop
            account.mongodb.com assets.mongodb-cdn.com * noop
            cloud.mongodb.com assets.mongodb-cdn.com * noop
            developer.mozilla.org mdnplay.dev * noop
            myorders.co static.cdn.printful.com * noop
            namemc.com fb.content-loader.com * noop
            neal.fun maps.googleapis.com * noop
            store.nebula.tv cdn.shopify.com * noop
            nintendo.com alps.cdn.nintendo.net * noop
            notion.so gist.github.com * noop
            nvidia.com cdn.cookielaw.org * noop
            auth.openai.com chatgpt.com * noop
            auth.openai.com auth-cdn.oaistatic.com * noop
            ovh.pl auth.eu.ovhcloud.com * noop
            paypal.com paypalobjects.com * noop
            perfecthue.tv perfecthue.com * noop
            perplexity.ai paypal.com * noop
            pixiv.net s.pximg.net * noop
            accounts.pixiv.net s.pximg.net * noop
            playstation.com id.sonyentertainmentnetwork.com * noop
            polymarket.com auth.magic.link * noop
            portainer.io hsforms.com * noop
            portainer.io hsforms.net * noop
            portgdansk.pl stream360.pl * noop
            pyszne.pl elnino-production.com * noop
            qobuz.com checkout.com * noop
            quora.com quoracdn.net * noop
            reddit.com redditstatic.com * noop
            remotehow.retool.com retool-edge.com * noop
            samequizy.pl a.spolecznosci.net * noop
            account.samsung.com apis.google.com * noop
            v3.account.samsung.com apis.google.com * noop
            sendibm3.com sibforms.com * noop
            sentry.io s1.sentry-cdn.com * noop
            sentry.io www.sentry.dev * noop
            shopify.com shop.app * noop
            slack.com slack-edge.com * noop
            songkick.com assets.sk-static.com * noop
            soundcloud.com sndcdn.com * noop
            accounts.spotify.com accounts.scdn.co * noop
            challenge.spotify.com challenge.spotifycdn.com * noop
            open.spotify.com spotifycdn.com * noop
            stackblitz.com staticblitz.com * noop
            js-mbbmgk.stackblitz.io staticblitz.com * noop
            stackexchange.com cdn.sstatic.net * noop
            stackoverflow.com cdn.sstatic.net * noop
            steamcommunity.com community.fastly.steamstatic.com * noop
            store.steampowered.com store.fastly.steamstatic.com * noop
            stripe.com stripecdn.com * noop
            superuser.com cdn.sstatic.net * noop
            t.me telegram.org * noop
            taobao.com g.alicdn.com * noop
            taobao.com o.alicdn.com * noop
            ticketmaster.pl tmconst.com * noop
            tiktok.com ttwstatic.com * noop
            detail.tmall.com alicdn.com * noop
            jobs.ton.org cdn.getro.com * noop
            transfemscience.org transfemscience.github.io * noop
            trojmiasto.pl s-trojmiasto.pl * noop
            trojmiasto.pl x-trojmiasto.pl * noop
            checkout.trustlymerchant.com checkout.trustly.com * noop
            trustpilot.com businessunitprofile-cdn.trustpilot.net * noop
            eu.ugreen.com cdn.shopify.com * noop
            unrealengine.com talon-website-prod.ecosec.on.epicgames.com * noop
            unrealengine.com static-assets-prod.epicgames.com * noop
            validategnosis.com framerusercontent.com * noop
            emmgenesis.vhx.tv f.vimeocdn.com * noop
            vinted.pl marketplace-web-assets.vinted.com * noop
            vinted.pl dd.vinted.lt * noop
            app.viral-loops.com accounts.google.com * noop
            developers.viral-loops.com cdn.readme.io * noop
            weareider.com widget-app.songkick.com * noop
            wigle.net js.arcgis.com * noop
            wordpress.com s0.wp.com * noop
            1login.wp.pl onelogin.wpcdn.pl * noop
            poczta.wp.pl onelogin.wpcdn.pl * noop
            poczta.wp.pl pocztanh.wpcdn.pl * noop
            x-kom.pl appleid.cdn-apple.com * noop
            x.com twimg.com * noop
            youtube.com google.com * noop
            ask.zen.com static.zdassets.com * noop
            znanylekarz.pl platform.docplanner.com * noop
            l.znanylekarz.pl global.frcapi.com * noop
            zoho.com accounts.zoho.eu * noop
            zoho.com static.zohocdn.com * noop
            zoho.com www.zohowebstatic.com * noop
            accounts.zoho.eu static.zohocdn.com * noop
          '';

          userFilters = ''
            ||karachan.org/js/htmlshiv.js
            karachan.org###jesli-zablokujesz-tego-diva-ukraina-odniesie-zwyciestwo
            notion.so##.notion-ai-button
          '';
        };

        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        AutoLaunchProtocolsFromOrigins = [
          {
            protocol = "tg";

            allowed_origins = [
              "https://t.me"
            ];
          }
        ];

        Containers.Default = [
          {
            name = "Work";
            icon = "briefcase";
            color = "orange";
          }
        ];

        DisableProfileRefresh = true;
        DisableSetDesktopBackground = true;
        DisplayMenuBar = "never";

        # this is kinda messy, but i don't know a better way.
        # `nur.repos.rycee.firefox-addons` is missing too many extensions
        ExtensionSettings =
          let
            default-config = extra: id: {
              ${id} = {
                installation_mode = "normal_installed";
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/${lib.strings.escapeURL id}/latest.xpi";
              }
              // extra;
            };

            private-browsing = {
              private_browsing = true;
            };

            install = default-config { };
            install-private-browsing = default-config private-browsing;
          in
          default-config (
            {
              install_url = "https://c.1password.com/dist/1P/b5x/firefox/nightly/latest.xpi";
            }
            // private-browsing
          ) "{0a75d802-9aed-41e7-8daa-24c067386e82}" # 1Password
          // install "chrome-mask@overengineer.dev"
          // install "languagetool-webextension@languagetool.org"
          // install "{1be309c5-3e4f-4b99-927d-bb500eb4fa88}" # Augmented Steam
          // install "bluelitefilter@malwaretech.com"
          // install "{74145f27-f039-47ce-a470-a662b129930a}" # ClearURLs
          // install "gdpr@cavi.au.dk"
          // install "{c3c10168-4186-445c-9c5b-63f12b8e2c87}" # Cookie-Editor
          // install "deArrow@ajay.app"
          // install "jid1-BoFifL9Vbdl2zQ@jetpack" # Decentraleyes
          // install "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" # Indie Wiki Buddy
          // install-private-browsing "search@kagi.com"
          // install-private-browsing "@mute-sites-by-default"
          // install "octolinker@stefanbuck.com"
          // install "{af838dcd-be8a-4237-8835-69fca92171d3}" # Permanent Progress Bar for YouTube
          // install-private-browsing "jid1-MnnxcxisBPnSXQ@jetpack" # Privacy Badger
          // install "firefox-addon@pronoundb.org"
          // install "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" # Refined GitHub
          // install "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" # Return YouTube Dislike
          // install "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" # Search by Image
          // install "jesse@adhdjesse.com" # SkyLink
          // install "smart-upscale@tanalin.com"
          // install "sponsorBlocker@ajay.app"
          // install-private-browsing "uBlock0@raymondhill.net"
          // install "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" # Violentmonkey
          // install "wayback_machine@mozilla.org"
          // install "{799c0914-748b-41df-a25c-22d008f9e83f}" # Web Scrobbler
          // install "{169e0f20-b4d6-4670-a852-e78a56f68264}" # Youtube MrBeastify
          // install "{d8b32864-153d-47fb-93ea-c273c4d1ef17}" # YouTube Screenshot Button
          // install-private-browsing "{cf485034-0bda-470d-a027-794f3214359c}"; # YouTube Shorts Redirect

        HttpsOnlyMode = "enabled";
        NewTabPage = false;

        Permissions = {
          Notifications.BlockNewRequests = true;
          Autoplay.Default = "block-audio-video";
        };

        PictureInPicture.Enabled = false;
        PopupBlocking.Default = true;

        # only preferences listed on https://mozilla.github.io/policy-templates/#preferences can be set here
        Preferences = {
          "accessibility.typeaheadfind.enablesound".Value = false;
          "accessibility.typeaheadfind.flashBar".Value = 0;
          "browser.aboutConfig.showWarning".Value = false;
          "browser.download.autohideButton".Value = false;
          "browser.search.suggest.enabled.private".Value = true;
          "browser.toolbars.bookmarks.visibility".Value = "always";

          "browser.uiCustomization.state".Value = builtins.toJSON {
            placements = {
              nav-bar = [
                "sidebar-button"
                "back-button"
                "forward-button"
                "stop-reload-button"
                "vertical-spacer"
                "home-button"
                "urlbar-container"
                "downloads-button"
                "unified-extensions-button"
                "fxa-toolbar-menu-button"
                "reset-pbm-toolbar-button"
                "customizableui-special-spring5"
              ];

              PersonalToolbar = [
                "personal-bookmarks"
                "_799c0914-748b-41df-a25c-22d008f9e83f_-browser-action"
                "jesse_adhdjesse_com-browser-action"
                "ublock0_raymondhill_net-browser-action"
                "jid1-mnnxcxisbpnsxq_jetpack-browser-action"
                "sponsorblocker_ajay_app-browser-action"
                "wayback_machine_mozilla_org-browser-action"
                "_0a75d802-9aed-41e7-8daa-24c067386e82_-browser-action"
                "developer-button"
              ];
            };

            currentVersion = 23;
          };

          "browser.urlbar.trimURLs".Value = false;
          "general.smoothScroll.currentVelocityWeighting".Value = builtins.toJSON 0;
          "general.smoothScroll.mouseWheel.durationMaxMS".Value = 250;
          "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS".Value = 250;
          "general.smoothScroll.msdPhysics.regularSpringConstant".Value = 400;
          "general.smoothScroll.msdPhysics.slowdownMinDeltaMS".Value = 120;
          "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio".Value = builtins.toJSON 0.4;
          "general.smoothScroll.msdPhysics.slowdownSpringConstant".Value = 5000;
          "general.smoothScroll.stopDecelerationWeighting".Value = builtins.toJSON 0.75;
          "print.more-settings.open".Value = true;
          "privacy.globalprivacycontrol.enabled".Value = true;
          "ui.textHighlightBackground".Value = "#fffc47";
          "ui.textHighlightForeground".Value = "#000000";
          "ui.textSelectAttentionBackground".Value = "#fd8e41";
          "ui.textSelectAttentionForeground".Value = "#000000";
        };
      };

      profiles.default = {
        bookmarks = {
          force = true;

          settings = [
            {
              name = "";

              bookmarks =
                let
                  bookmark = url: {
                    name = "";
                    inherit url;
                  };
                in
                [
                  (bookmark "https://jel.gay/password-generator")
                  "separator"
                  (bookmark "https://www.youtube.com/feed/history")
                  (bookmark "https://photos.google.com/")
                  (bookmark "https://mail.google.com/mail/")
                  (bookmark "https://translate.google.com/?sl=auto&tl=en&op=translate")
                  (bookmark "https://maps.google.pl/maps")
                  (bookmark "https://earth.google.com/web/")
                  (bookmark "https://drive.google.com/drive/my-drive")
                  (bookmark "https://docs.google.com/document/")
                  (bookmark "https://docs.google.com/spreadsheets/")
                  (bookmark "https://docs.google.com/presentation/")
                  (bookmark "https://docs.google.com/forms/")
                  (bookmark "https://docs.google.com/videos/")
                  (bookmark "https://docs.google.com/drawings/")
                  (bookmark "https://keep.google.com/")
                  (bookmark "https://fonts.google.com/")
                  "separator"
                  (bookmark "https://github.com/jelni?tab=repositories")
                  (bookmark "https://gchq.github.io/CyberChef/")
                  (bookmark "https://translations.telegram.org/pl/")
                  (bookmark "https://languagetool.org/editor/new")
                  (bookmark "https://www.notion.so/")
                  (bookmark "https://kagi.com/assistant")
                  (bookmark "https://claude.ai/new?incognito")
                  (bookmark "https://console.anthropic.com/workbench")
                  (bookmark "https://chatgpt.com/?temporary-chat=true")
                  (bookmark "https://track.toggl.com/")
                  "separator"
                  (bookmark "https://beta.nebula.tv/")
                  (bookmark "https://www.last.fm/user/JelNiSlaw_")
                  (bookmark "https://bsky.app/")
                  (bookmark "https://tech.lgbt/")
                  (bookmark "https://twitter.com/")
                  (bookmark "https://www.reddit.com/")
                  (bookmark "https://www.twitch.tv/")
                  "separator"
                  (bookmark "https://console.cloud.google.com/")
                  (bookmark "https://dash.cloudflare.com/")
                  (bookmark "https://cloud.oracle.com/compute/instances")
                  "separator"

                  {
                    name = "";

                    bookmarks = [
                      (bookmark "https://discordpy.readthedocs.io/en/latest/genindex.html")
                      (bookmark "https://core.telegram.org/bots/api")
                      (bookmark "https://github.com/tdlib/td/blob/master/td/generate/scheme/td_api.tl")
                      (bookmark "https://github.com/tdlib/td/blob/master/td/telegram/cli.cpp")
                      (bookmark "https://docs.docker.com/reference/compose-file/")
                      (bookmark "https://ai.google.dev/api/all-methods")
                      (bookmark "https://platform.openai.com/docs/api-reference")
                      (bookmark "https://docs.stripe.com/api")
                    ];
                  }

                  (bookmark "about:config")
                ];

              toolbar = true;
            }
          ];
        };

        settings = {
          "devtools.netmonitor.persistlog" = true;
          "devtools.toolbox.selectedTool" = "netmonitor";
          "devtools.webconsole.persistlog" = true;
          "devtools.webconsole.timestampMessages" = true;
          "findbar.highlightAll" = true;
          "image.jxl.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "sidebar.verticalTabs" = true;
        };
      };
    };

    gcc.enable = true;
    gh.enable = true;
    ghostty.enable = true;

    gnome-shell = {
      enable = true;

      extensions = with pkgs.gnomeExtensions; [
        { package = auto-move-windows; }
        { package = clipboard-history; }
        { package = launch-new-instance; }
        { package = removable-drive-menu; }
        { package = status-icons; }
        { package = steal-my-focus-window; }
        { package = system-monitor; }
      ];
    };

    helix = {
      enable = true;
      defaultEditor = true;
    };

    htop = {
      enable = true;

      settings = {
        tree_view = 1;
        header_layout = "one_100";
      }
      // (
        with config.lib.htop;
        leftMeters [
          (bar "AllCPUs4")
          (bar "Memory")
          (text "ZFSARC")
          (text "DiskIO")
          (text "Uptime")
          (text "LoadAverage")
          (text "Tasks")
        ]
      );
    };

    home-manager.enable = true;

    jujutsu = {
      enable = true;

      settings = {
        user = {
          name = "jel";
          email = "25802745+jelni@users.noreply.github.com";
        };

        signing = {
          behavior = "own";
          backend = "ssh";
          key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIeyqBh/je0A8dMXB0m9jxZ0nBWHc5Hj+dFmFBiT5Mdw";
          backends.ssh.program = "op-ssh-sign";
        };

        git.sign-on-push = true;
      };
    };

    mpv.enable = true;

    mullvad-vpn = {
      enable = true;
      settings.monochromaticIcon = true;
    };

    nushell = {
      enable = true;
      settings.show_banner = false;
    };

    ripgrep.enable = true;

    ssh = {
      enable = true;
      enableDefaultConfig = false; # remove once this is the default
      matchBlocks."*".identityAgent = "~/.1password/agent.sock";
    };

    uv.enable = true;

    vscode = {
      enable = true;

      profiles.default = {
        enableExtensionUpdateCheck = false;
        enableUpdateCheck = false;

        extensions = (
          with pkgs.vscode-marketplace;
          [
            pkgs.vscode-marketplace."1password".op-vscode
            adpyke.vscode-sql-formatter
            anthropic.claude-code
            bradlc.vscode-tailwindcss
            charliermarsh.ruff
            dbaeumer.vscode-eslint
            esbenp.prettier-vscode
            fill-labs.dependi
            geequlim.godot-tools
            github.vscode-pull-request-github
            jnoortheen.nix-ide
            ms-azuretools.vscode-containers
            ms-python.python
            ms-python.vscode-pylance
            ms-vscode.hexeditor
            mtdmali.daybreak-theme
            pkief.material-icon-theme
            prisma.prisma-insider
            rust-lang.rust-analyzer
            supabase.postgrestools
            svelte.svelte-vscode
            tamasfe.even-better-toml
            thenuprojectcontributors.vscode-nushell-lang
            usernamehw.errorlens
            watware.soyfu
            wmaurer.change-case
            yzhang.markdown-all-in-one
          ]
        );

        keybindings = [
          {
            key = "alt+backspace";
            command = "deleteWordPartLeft";
            when = "textInputFocus && !editorReadonly";
          }
          {
            key = "alt+delete";
            command = "deleteWordPartRight";
            when = "textInputFocus && !editorReadonly";
          }
          {
            key = "alt+f12";
            command = "-editor.action.peekDefinition";
          }
          {
            key = "alt+f12";
            command = "workbench.action.openGlobalKeybindings";
          }
          {
            key = "alt+left";
            command = "-workbench.action.navigateBack";
          }
          {
            key = "alt+left";
            command = "-workbench.action.quickInputBack";
          }
          {
            key = "alt+left";
            command = "-workbench.action.terminal.focusPreviousPane";
          }
          {
            key = "alt+left";
            command = "cursorWordPartLeft";
            when = "textInputFocus";
          }
          {
            key = "alt+right";
            command = "-workbench.action.navigateForward";
          }
          {
            key = "alt+right";
            command = "-workbench.action.terminal.focusNextPane";
          }
          {
            key = "alt+right";
            command = "cursorWordPartRight";
            when = "textInputFocus";
          }
          {
            key = "ctrl+alt+down";
            command = "-editor.action.insertCursorBelow";
          }
          {
            key = "ctrl+alt+down";
            command = "editor.action.smartSelect.shrink";
            when = "editorTextFocus";
          }
          {
            key = "ctrl+alt+up";
            command = "-editor.action.insertCursorAbove";
          }
          {
            key = "ctrl+alt+up";
            command = "editor.action.smartSelect.expand";
            when = "editorTextFocus";
          }
          {
            key = "ctrl+d";
            command = "-editor.action.addSelectionToNextFindMatch";
          }
          {
            key = "ctrl+d";
            command = "editor.action.duplicateSelection";
            when = "textInputFocus";
          }
          {
            key = "ctrl+f12";
            command = "-editor.action.goToImplementation";
          }
          {
            key = "ctrl+f12";
            command = "-editor.action.goToImplementation";
          }
          {
            key = "ctrl+f12";
            command = "-editor.action.revealDefinition";
          }
          {
            key = "ctrl+f12";
            command = "workbench.action.openSettings";
          }
          {
            key = "ctrl+p";
            command = "-workbench.action.quickOpen";
          }
          {
            key = "ctrl+p";
            command = "-workbench.action.quickOpenNavigateNextInFilePicker";
          }
          {
            key = "ctrl+p";
            command = "workbench.action.showCommands";
          }
          {
            key = "ctrl+shift+c";
            command = "-workbench.action.terminal.openNativeConsole";
          }
          {
            key = "ctrl+shift+c";
            command = "editor.action.clipboardCopyAction";
          }
          {
            key = "ctrl+shift+left";
            command = "-soy.moveLeft";
          }
          {
            key = "ctrl+shift+p";
            command = "-workbench.action.quickOpenNavigatePreviousInFilePicker";
          }
          {
            key = "ctrl+shift+p";
            command = "-workbench.action.showCommands";
          }
          {
            key = "ctrl+shift+p";
            command = "workbench.action.quickOpen";
          }
          {
            key = "ctrl+shift+right";
            command = "-soy.moveRight";
          }
          {
            key = "ctrl+shift+s";
            command = "-workbench.action.files.saveAs";
          }
          {
            key = "ctrl+shift+s";
            command = "-workbench.action.files.saveLocalFile";
          }
          {
            key = "ctrl+shift+s";
            command = "workbench.action.files.saveWithoutFormatting";
          }
          {
            key = "ctrl+shift+tab";
            command = "workbench.action.previousEditorInGroup";
          }
          {
            key = "ctrl+shift+v";
            command = "-markdown.showPreview";
          }
          {
            key = "ctrl+shift+w";
            command = "-workbench.action.closeWindow";
          }
          {
            key = "ctrl+shift+w";
            command = "workbench.files.action.showActiveFileInExplorer";
          }
          {
            key = "ctrl+tab";
            command = "workbench.action.nextEditorInGroup";
          }
          {
            key = "ctrl+y";
            command = "-redo";
          }
          {
            key = "ctrl+y";
            command = "editor.action.deleteLines";
            when = "textInputFocus";
          }
          {
            key = "shift shift";
            command = "-soy.enterSelectionMode";
          }
          {
            key = "shift+alt+left";
            command = "-editor.action.smartSelect.shrink";
          }
          {
            key = "shift+alt+left";
            command = "cursorWordPartLeftSelect";
            when = "textInputFocus";
          }
          {
            key = "shift+alt+right";
            command = "-editor.action.smartSelect.expand";
          }
          {
            key = "shift+alt+right";
            command = "cursorWordPartRightSelect";
            when = "textInputFocus";
          }
          {
            key = "shift+enter";
            command = "-python.execInREPL";
          }
          {
            key = "shift+enter";
            command = "-python.execSelectionInTerminal";
          }
          {
            key = "shift+tab";
            command = "-acceptAlternativeSelectedSuggestion";
          }
          {
            key = "shift+tab";
            command = "-insertPrevSuggestion";
          }
          {
            key = "tab";
            command = "-insertNextSuggestion";
          }
        ];

        userSettings = {
          "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[javascriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[jsonc]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
          "[prisma]"."editor.defaultFormatter" = "Prisma.prisma-insider";
          "[python]"."editor.defaultFormatter" = "charliermarsh.ruff";
          "[rust]"."editor.defaultFormatter" = "rust-lang.rust-analyzer";
          "[svelte]"."editor.defaultFormatter" = "svelte.svelte-vscode";
          "[toml]"."editor.defaultFormatter" = "tamasfe.even-better-toml";
          "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
          "breadcrumbs.icons" = false;
          "breadcrumbs.symbolPath" = "off";
          "chat.commandCenter.enabled" = false;
          "css.lint.emptyRules" = "ignore";
          "css.lint.ieHack" = "warning";
          "css.lint.important" = "warning";
          "css.lint.zeroUnits" = "warning";
          "debug.internalConsoleOptions" = "openOnSessionStart";
          "debug.javascript.autoAttachFilter" = "disabled";
          "dependi.vulnerability.ghsa.enabled" = true;
          "diffEditor.hideUnchangedRegions.enabled" = true;
          "diffEditor.ignoreTrimWhitespace" = false;
          "diffEditor.renderSideBySide" = false;
          "diffEditor.wordWrap" = "off";
          "editor.acceptSuggestionOnCommitCharacter" = false;
          "editor.acceptSuggestionOnEnter" = "off";
          "editor.accessibilitySupport" = "off";
          "editor.autoClosingBrackets" = "beforeWhitespace";
          "editor.autoClosingDelete" = "always";
          "editor.autoClosingQuotes" = "beforeWhitespace";
          "editor.bracketPairColorization.enabled" = false;
          "editor.codeActionsOnSave"."source.organizeImports" = "explicit";
          "editor.colorDecorators" = false;
          "editor.colorDecoratorsActivatedOn" = "click";
          "editor.copyWithSyntaxHighlighting" = false;
          "editor.cursorBlinking" = "smooth";
          "editor.cursorSmoothCaretAnimation" = "on";
          "editor.find.cursorMoveOnType" = false;
          "editor.folding" = false;
          "editor.foldingHighlight" = false;
          "editor.fontFamily" = "Fira Code";
          "editor.fontLigatures" = true;
          "editor.formatOnSave" = true;
          "editor.formatOnType" = true;
          "editor.inlayHints.enabled" = "off";
          "editor.inlineSuggest.enabled" = true;
          "editor.minimap.enabled" = false;
          "editor.minimap.renderCharacters" = false;
          "editor.minimap.showSlider" = "always";
          "editor.minimap.size" = "fit";
          "editor.renderControlCharacters" = true;
          "editor.renderFinalNewline" = "off";
          "editor.renderLineHighlight" = "gutter";
          "editor.renderLineHighlightOnlyWhenFocus" = true;
          "editor.rulers" = [ 100 ];
          "editor.scrollBeyondLastLine" = false;
          "editor.semanticHighlighting.enabled" = true;
          "editor.smoothScrolling" = true;
          "editor.stickyScroll.enabled" = false;
          "editor.stickyTabStops" = true;
          "editor.tabCompletion" = "on";
          "editor.unicodeHighlight.allowedLocales".pl = true;
          "editor.unicodeHighlight.includeComments" = true;
          "editor.unicodeHighlight.invisibleCharacters" = false;
          "editor.unicodeHighlight.nonBasicASCII" = false;
          "editor.unusualLineTerminators" = "auto";
          "editor.wordBasedSuggestions" = "off";
          "errorLens.followCursor" = "activeLine";
          "errorLens.messageBackgroundMode" = "none";
          "errorLens.removeLinebreaks" = false;
          "evenBetterToml.formatter.allowedBlankLines" = 1;
          "evenBetterToml.formatter.arrayAutoCollapse" = true;
          "evenBetterToml.formatter.arrayAutoExpand" = true;
          "evenBetterToml.formatter.arrayTrailingComma" = true;
          "evenBetterToml.formatter.columnWidth" = 120;
          "evenBetterToml.formatter.compactArrays" = true;
          "evenBetterToml.schema.links" = true;
          "evenBetterToml.semanticTokens" = true;
          "explorer.autoReveal" = false;
          "explorer.confirmDelete" = false;
          "explorer.confirmDragAndDrop" = false;
          "explorer.copyRelativePathSeparator" = "/";
          "explorer.fileNesting.expand" = false;
          "explorer.incrementalNaming" = "smart";
          "explorer.sortOrder" = "type";
          "extensions.ignoreRecommendations" = true;
          "files.eol" = "\n";
          "files.insertFinalNewline" = true;
          "files.trimFinalNewlines" = true;
          "git.autoRepositoryDetection" = "openEditors";
          "git.autoStash" = true;
          "git.autofetch" = true;
          "git.autofetchPeriod" = 300;
          "git.confirmEmptyCommits" = false;
          "git.confirmSync" = false;
          "git.countBadge" = "tracked";
          "git.enableCommitSigning" = true;
          "git.enableSmartCommit" = true;
          "git.ignoreMissingGitWarning" = true;
          "git.openRepositoryInParentFolders" = "never";
          "html.format.indentHandlebars" = true;
          "html.format.indentInnerHtml" = true;
          "html.format.preserveNewLines" = false;
          "javascript.format.semicolons" = "insert";
          "javascript.inlayHints.parameterNames.enabled" = "literals";
          "javascript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" = false;
          "javascript.suggest.completeFunctionCalls" = true;
          "javascript.updateImportsOnPaste.enabled" = false;
          "markdown.extension.list.indentationSize" = "inherit";
          "markdown.extension.tableFormatter.normalizeIndentation" = true;
          "markdown.preview.doubleClickToSwitchToEditor" = false;
          "markdown.preview.lineHeight" = 1.2;
          "markdown.preview.scrollEditorWithPreview" = false;
          "markdown.preview.scrollPreviewWithEditor" = false;
          "material-icon-theme.folders.theme" = "classic";
          "nix.enableLanguageServer" = true;
          "php.suggest.basic" = false;
          "prettier.proseWrap" = "always";
          "prettier.trailingComma" = "all";
          "python.analysis.completeFunctionParens" = true;
          "python.analysis.diagnosticMode" = "workspace";
          "python.analysis.diagnosticSeverityOverrides" = {
            reportMissingTypeStubs = "none";
            reportUnknownArgumentType = "none";
            reportUnknownMemberType = "none";
          };
          "python.analysis.typeCheckingMode" = "strict";
          "python.envFile" = "";
          "python.globalModuleInstallation" = true;
          "python.languageServer" = "Pylance";
          "python.terminal.activateEnvironment" = false;
          "python.terminal.focusAfterLaunch" = true;
          "ruff.format.preview" = true;
          "ruff.lint.preview" = true;
          "ruff.nativeServer" = "on";
          "rust-analyzer.assist.expressionFillDefault" = "default";
          "rust-analyzer.imports.granularity.enforce" = true;
          "rust-analyzer.imports.granularity.group" = "module";
          "rust-analyzer.imports.merge.glob" = false;
          "rust-analyzer.lens.enable" = false;
          "rust-analyzer.rustfmt.rangeFormatting.enable" = true;
          "search.exclude" = {
            "**/.git" = true;
            "**/.jj" = true;
            "**/.svelte-kit" = true;
            "**/.venv" = true;
            "**/build" = true;
            "**/target" = true;
            "**/venv" = true;
          };
          "search.quickOpen.includeHistory" = false;
          "search.useIgnoreFiles" = false;
          "security.workspace.trust.enabled" = false;
          "settingsSync.keybindingsPerPlatform" = false;
          "sql-formatter.uppercase" = true;
          "svelte.enable-ts-plugin" = true;
          "terminal.integrated.defaultProfile.windows" = "Nushell";
          "terminal.integrated.enablePersistentSessions" = false;
          "terminal.integrated.shellIntegration.decorationsEnabled" = "never";
          "terminal.integrated.shellIntegration.history" = 0;
          "terminal.integrated.smoothScrolling" = true;
          "terminal.integrated.stickyScroll.enabled" = false;
          "terminal.integrated.tabs.location" = "left";
          "testing.gutterEnabled" = false;
          "typescript.inlayHints.enumMemberValues.enabled" = true;
          "typescript.inlayHints.parameterNames.enabled" = "literals";
          "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" = false;
          "typescript.suggest.completeFunctionCalls" = true;
          "typescript.updateImportsOnPaste.enabled" = false;
          "update.showReleaseNotes" = false;
          "window.autoDetectHighContrast" = false;
          "window.commandCenter" = false;
          "window.customMenuBarAltFocus" = false;
          "window.dialogStyle" = "custom";
          "window.enableMenuBarMnemonics" = false;
          "window.menuBarVisibility" = "toggle";
          "window.newWindowDimensions" = "maximized";
          "window.openFoldersInNewWindow" = "off";
          "window.title" = "\${dirty}\${rootName}";
          "window.titleSeparator" = " | ";
          "workbench.colorTheme" = "Daybreak";
          "workbench.editor.empty.hint" = "hidden";
          "workbench.editor.highlightModifiedTabs" = true;
          "workbench.editor.tabActionCloseVisibility" = false;
          "workbench.editor.untitled.labelFormat" = "name";
          "workbench.iconTheme" = "material-icon-theme";
          "workbench.layoutControl.enabled" = false;
          "workbench.list.smoothScrolling" = true;
          "workbench.startupEditor" = "none";
          "workbench.tree.enableStickyScroll" = false;
          "zenMode.hideActivityBar" = false;
          "zenMode.restore" = false;
          "zenMode.silentNotifications" = false;
        };
      };
    };

    yt-dlp.enable = true;
  };

  services = {
    home-manager.autoExpire = {
      enable = true;
      frequency = "weekly";
    };

    udiskie.enable = true;
  };

  xdg = {
    autostart = {
      enable = true;

      entries = [
        "${pkgs.telegram-desktop}/share/applications/org.telegram.desktop.desktop"
        "${pkgs.vesktop}/share/applications/vesktop.desktop"
      ];
    };

    configFile."autostart/1password.desktop" = {
      enable = true;

      text = ''
        [Desktop Entry]
        Type=Application
        Name=1Password
        Exec=1password --silent %U
      '';
    };
  };
}
