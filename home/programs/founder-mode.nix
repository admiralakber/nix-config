{ pkgs, inputs, ... }:
  let
  # Configure with license acceptance
  unstablePkgs = import inputs.nixpkgs-unstable { 
    system = pkgs.system;
    config = {
      allowUnfree = true;
    };
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
  ];
  }
