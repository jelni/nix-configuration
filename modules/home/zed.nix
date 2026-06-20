{ lib, pkgs, ... }:
{
  home.shellAliases.zed = lib.getExe pkgs.zed-editor;

  programs.zed-editor = {
    enable = true;

    extensions = [
      "catppuccin"
      "dependi"
      "html"
      "nix"
      "toml"
    ];

    mutableUserKeymaps = false;
    mutableUserSettings = false;

    userKeymaps = [
      {
        bindings = {
          alt-f12 = "zed::OpenKeymap";
          ctrl-d = "editor::DuplicateSelection";
          ctrl-f12 = "zed::OpenSettings";
          ctrl-p = "command_palette::Toggle";
          ctrl-shift-p = "file_finder::Toggle";
        };

        unbind = {
          ctrl-n = "menu::SelectNext";
          ctrl-shift-w = "workspace::CloseWindow";
        };
      }
      {
        context = "Editor";

        bindings = {
          alt-backspace = "editor::DeleteToPreviousSubwordStart";
          alt-delete = "editor::DeleteToNextSubwordEnd";
          alt-left = "editor::MoveToPreviousSubwordStart";
          alt-right = "editor::MoveToNextSubwordEnd";
          alt-shift-left = "editor::SelectToPreviousSubwordStart";
          alt-shift-right = "editor::SelectToNextSubwordEnd";
          ctrl-alt-down = "editor::SelectSmallerSyntaxNode";
          ctrl-alt-up = "editor::SelectLargerSyntaxNode";
          ctrl-enter = "editor::NewlineBelow";
          ctrl-shift-c = "editor::Copy";
          ctrl-shift-v = "editor::Paste";
          ctrl-y = "editor::DeleteLine";
        };

        unbind."ctrl-;" = "editor::ToggleLineNumbers";
      }
      {
        context = "Pane";

        bindings = {
          ctrl-shift-tab = "pane::ActivatePreviousItem";
          ctrl-tab = "pane::ActivateNextItem";
        };
      }
      {
        context = "ProjectPanel";
        bindings.delete = "project_panel::Delete";
      }
      {
        context = "Workspace";
        bindings.ctrl-shift-s = "workspace::SaveWithoutFormat";
        unbind.ctrl-w = "workspace::CloseActiveDock";
      }
    ];

    userSettings = {
      auto_signature_help = true;
      cli_default_open_behavior = "existing_window";
      close_on_file_delete = true;
      collaboration_panel.dock = "left";
      completions.lsp_insert_mode = "replace_subsequence";
      current_line_highlight = "gutter";
      diagnostics.inline.enabled = true;
      disable_ai = true;
      git.inline_blame.enabled = false;
      git_panel.dock = "left";

      gutter = {
        folds = false;
        runnables = false;
      };

      languages = {
        Nix.formatter = "language_server";
        QML.formatter = "language_server";
        Rust.formatter = "language_server";
      };

      middle_click_paste = false;
      outline_panel.dock = "left";
      prettier.allowed = true;

      project_panel = {
        auto_reveal_entries = false;
        dock = "left";
      };

      scroll_beyond_last_line = "vertical_scroll_margin";

      search = {
        center_on_match = true;
        include_ignored = false;
      };

      seed_search_query_from_cursor = "selection";
      show_signature_help_after_edits = true;
      tab_bar.show_nav_history_buttons = false;

      tabs = {
        file_icons = true;
        git_status = true;
        show_close_button = "hidden";
        show_diagnostics = "all";
      };

      theme = "Catppuccin Mocha";

      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };

      ui_font_size = 16;
      use_smartcase_search = true;
      wrap_guides = [ 100 ];
      zoomed_padding = false;
    };
  };
}
