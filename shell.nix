with (import <nixpkgs> {}); let
  unstable = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/50eb7ecf4cd0a5756d7275c8ba36790e5bd53e33.tar.gz");
in
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [
      # clang-tools
      llvmPackages_16.libllvm
      # libclang
      # clang
      #llvmPackages_17
      zig
      darwin.cctools
      darwin.apple_sdk.frameworks.System
      darwin.Libc
      libcxx
    ];

    shellHook = ''
      export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
      export CPATH=$SDKROOT/usr/include:$CPATH
      export LIBRARY_PATH=$SDKROOT/usr/lib:$LIBRARY_PATH
      export C_INCLUDE_PATH=$SDKROOT/usr/include:$C_INCLUDE_PATH
      export CPLUS_INCLUDE_PATH=$SDKROOT/usr/include:$CPLUS_INCLUDE_PATH
      export LD_LIBRARY_PATH=$SDKROOT/usr/lib:$LD_LIBRARY_PATH
      export CC=clang
      export CXX=clang++
    '';
  }
