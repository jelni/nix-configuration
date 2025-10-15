{ pkgs, config, ... }:
{
  home = {
    username = "jel";
    homeDirectory = "/home/jel";
    stateVersion = "25.05";
  };

  programs = {
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

    ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ~/.1password/agent.sock
      '';
    };

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
          "[css]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[javascriptreact]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[json]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[jsonc]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[markdown]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[prisma]" = {
            "editor.defaultFormatter" = "Prisma.prisma-insider";
          };
          "[python]" = {
            "editor.defaultFormatter" = "charliermarsh.ruff";
          };
          "[rust]" = {
            "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          };
          "[svelte]" = {
            "editor.defaultFormatter" = "svelte.svelte-vscode";
          };
          "[toml]" = {
            "editor.defaultFormatter" = "tamasfe.even-better-toml";
          };
          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
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
          "editor.codeActionsOnSave" = {
            "source.organizeImports" = "explicit";
          };
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
          "editor.unicodeHighlight.allowedLocales" = {
            pl = true;
          };
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
  };
}
