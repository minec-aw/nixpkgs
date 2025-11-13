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
  version = "dc57cc8ec85f521537c6cb85c8888a4d67cbd05d";

  src = fetchFromGitHub {
    owner = "minec-aw";
    repo = "pixdecor";
    rev = "${finalAttrs.version}";
    hash = "sha256-vvUyFV2VlV77LwdPd2TgJwWCPQPIJdtIBNyzEI1uEm4=";
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
