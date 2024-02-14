{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;

    settings = {
        add_newline = true;
        command_timeout = 1000;

        format = ''
[╭─ ](bold #4E8278)$all
[│ ](bold #4E8278)$directory$sudo
[╰─ ](bold #4E8278)$character'';

        username = {
          format = " [$user]($style)";
          style_user = "bold #4E8278";
          style_root = "bold #4E8278";
          show_always = true;
        };

        hostname = {
          format = "[@](bold #D7C6B2)[$hostname]($style) ";
          style = "bold #4E8278";
          trim_at = ".";
          ssh_only = false;
        };

        directory = {
          format = "[in](#D7C6B2) [$path]($style)[$read_only]($read_only_style) ";
          style = "#E4A758";
          truncation_length = 0;
          truncate_to_repo = false;
        };

        character = {
          success_symbol = "[ ](bold #DFBF87)";
          error_symbol = "[ ](bold #9C1027)";
        };

        git_status = {
          style = "white";
          ahead = "⇡$count";
          diverged = "⇕⇡$ahead_count⇣$behind_count";
          behind = "⇣$count";
          deleted = "x";
        };

        git_branch = {
          style = "bold #705767";
        };

        git_commit = {
          style = "bold #46949B";
          tag_symbol	= " ";
        };

        package = {
          format = "[$symbol$version]($style) ";
          style = "bold #CC7F60";
          symbol =" ";
        };


        docker_context = {
          symbol = "";
          format	= "[$symbol]($style) ";
          style = "bold #BFD9FF";
        };

        line_break = {
          disabled = true;
        };
    };
  };
}