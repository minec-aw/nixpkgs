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
  version = "adeeae9c0569830eac2e44c3993e7696aee57d38";

  src = fetchFromGitHub {
    owner = "minec-aw";
    repo = "pixdecor";
    rev = "${finalAttrs.version}";
    hash = "sha256-dATIddRZYBU8djkZsY4R9skJXU7LFXe8tsw36ywa3lQ=";
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
