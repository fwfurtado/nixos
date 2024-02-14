{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;
    keyboards.default = {


      ids = [
        "0001:0001"
      ];

      settings = {
          main = {
            "q" = "q";
            "w" = "w";
            "e" = "f";
            "r" = "p";
            "t" = "b";
            "y" = "j";
            "u" = "l";
            "i" = "u";
            "o" = "y";
            "p" = ";";
            "[" = "[";
            "]" = "]";

            "a" = "overloadt(meta, a, 300)";
            "s" = "overloadt(alt, r, 300)";
            "d" = "overloadt(control, s, 300)";
            "f" = "overloadt(shift, t, 300)";
            "g" = "g";
            "h" = "m";
            "j" = "overloadt(shift,n,300)";
            "k" = "overloadt(control,e,300)";
            "l" = "overloadt(alt,i,300)";
            ";" = "overloadt(meta,o,500)";
            "'" = "'";
            # "\" = "\";

            "z" = "z";
            "x" = "overloadt(altgr,x,300)";
            "c" = "c";
            "v" = "d";
            "b" = "v";
            "n" = "k";
            "m" = "h";
            "," = ",";
            "." = "overloadt(altgr,.,300)";
            "/" = "/";

            "leftalt" = "overloadt(nav, tab, 300)";
            "leftmeta" = "esc";
            "rightalt" = "overloadt(numbers,backspace,300)";
            "ro" = "overloadt(functions, delete, 300)";
          };

          nav = {
            "j" = "left";
            "k" = "down";
            "l" = "up";
            ";" = "right";
            "m" = "home";
            "," = "pageup";
            "." = "pagedown";
            "/" = "end";
            "u" = "macro(C-v)";
            "i" = "macro(C-c)";
            "o" = "macro(C-x)";
            "p" = "macro(C-z)";
          };

          numbers = {
            "q" = "[";
            "w" = "7";
            "e" = "8";
            "r" = "9";
            "t" = "]";
            "a" = ";";
            "s" = "4";
            "d" = "5";
            "f" = "6";
            "g" = "equal";
            "z" = "`";
            "x" = "1";
            "c" = "2";
            "v" = "3";
            # "b" = "\";
            "leftmeta" = ".";
            "leftalt" = "0";
          };

          "numbers+shift" = {
            "leftmeta" = "(";
            "space" = "minus";
          };

          functions = {
            "q" = "f12";
            "w" = "f7";
            "e" = "f8";
            "r" = "f9";
            "t" = "sysrq";
            "a" = "f11";
            "s" = "f4";
            "d" = "f5";
            "f" = "f6";
            "z" = "f10";
            "x" = "f1";
            "c" = "f2";
            "v" = "f3";
          };
      };
    };
  };
}