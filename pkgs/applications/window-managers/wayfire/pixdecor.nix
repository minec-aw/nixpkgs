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
  version = "b83e9731db88fd880d9b83a77b1b625816e97a8c";

  src = fetchFromGitHub {
    owner = "soreau";
    repo = "pixdecor";
    rev = "${finalAttrs.version}";
    hash = "sha256-+NvnG8tYc0M5zdxaI375+gqeWWWePyqPp+njI07ooXM=";
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
