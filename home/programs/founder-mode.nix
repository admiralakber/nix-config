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
    kdePackages.kdenlive
    discord
    slack
    unstablePkgs.code-cursor

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


    # klowd
    google-cloud-sdk

    # flutter
    flutter
    openjdk17
    gradle

    # grpc
    grpcurl
    ghz

    # quick tools
    qrencode

    # quality of life
    cmatrix

    # UGH - I hate but I must
    # why! :sob:
    #teams
    teams-for-linux

    # protobuf
    buf
    protobuf

    # Language-specific protoc generators 🛠️
    protobuf
    protoc-gen-elixir
    protoc-gen-dart
    protoc-gen-es
    protoc-gen-js
    protoc-gen-doc
    protoc-gen-grpc-web
    protox
    protoc-gen-rust
    protoc-gen-rust-grpc
    protoc-gen-prost
    protoc-gen-prost-serde
    protoc-gen-prost-crate
    protoc-gen-tonic

    pkg-config
    openssl
    sqlite

    # rust
    cargo-ndk
  ];
  }
