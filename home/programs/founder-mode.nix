{ pkgs, inputs, ... }:
  let
  # Configure with license acceptance
  unstablePkgs = import inputs.nixpkgs-unstable { 
    system = pkgs.system;
    config = {
      allowUnfree = true; # Required for Android Studio
    };
  };
  
  # Flutter directly from Git repo - simplified approach 🔥
  flutterFromGit = pkgs.stdenv.mkDerivation {
    name = "flutter-git";
    version = "3.29.2";
    
    src = pkgs.fetchFromGitHub {
      owner = "flutter";
      repo = "flutter";
      rev = "3.29.2"; 
      sha256 = "sha256-rHnHMpSiVhwed4TTt6nPrq0IthjXQanjQg/VDcT2Zqw=";
    };
    
    buildInputs = with pkgs; [ git unzip curl ];
    
    # Simplified installation - don't try to run precache yet
    installPhase = ''
      mkdir -p $out
      cp -r $src/* $out/
      chmod +x $out/bin/flutter
    '';
    
    # Don't patch shebangs - causes issues with Flutter's internal scripts
    dontPatchShebangs = true;
    
    # Skip some phases that might cause problems
    dontFixup = true;
  };
  
  in {
  home.packages = with pkgs; [
    kdenlive
    discord
    slack
    code-cursor

    # python
    uv

    # install elixir/erlang on base so cursor has access
    erlang_27
    erlang-ls
    elixir_1_18
    elixir-ls
    postgresql_17_jit # phoenix
    inotify-tools # liveview
    libnotify # exunit notifier

    # Simplified Flutter development environment 🚀
    flutterFromGit
    #android-studio
    #openjdk17
    #unstablePkgs.jdk17
    #unstablePkgs.android-studio
    #unstablePkgs.android-tools # Basic Android tooling
    
    # Native dependencies for Flutter
    cmake
    ninja
    pkg-config
    gtk3
    clang
    xz
  ];
  
  # Set up environment variables for Flutter and Android development
  home.sessionVariables = {
    # Flutter configuration
    FLUTTER_ROOT = "${flutterFromGit}";
    
    # Extend PATH to include Flutter
    PATH = "$PATH:${flutterFromGit}/bin";
  };
  }
