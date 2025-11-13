{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  wayfire,
  wayland-scanner,
  wf-config,
  boost,
  libdrm,
  libevdev,
  libinput,
  libxkbcommon,
  vulkan-headers,
  xcbutilwm,
  gtkmm3,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "pixdecor";
  version = "a916265cf7815b2c922c876293cef07db1931b50";

  src = fetchFromGitHub {
    owner = "minec-aw";
    repo = "pixdecor";
    rev = "${finalAttrs.version}";
    hash = "sha256-rW55VCC4teGNFQuNblK1l+wgbBU+o8730r+pqsck1Sg=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayfire
    wf-config
    boost
    libdrm
    libevdev
    libinput
    libxkbcommon
    vulkan-headers
    xcbutilwm
    gtkmm3
  ];

  env = {
    PKG_CONFIG_WAYFIRE_METADATADIR = "${placeholder "out"}/share/wayfire/metadata";
  };

  meta = {
    homepage = "https://github.com/soreau/pixdecor";
    description = "window decorations for wayfire";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ wineee ];
    inherit (wayfire.meta) platforms;
  };
})
