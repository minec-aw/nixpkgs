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
  pname = "wf-info";
  version = "2d0127a484f332ffaf1c64a7be199f755d4f68a8";

  src = fetchFromGitHub {
    owner = "soreau";
    repo = "wf-info";
    rev = "${finalAttrs.version}";
    hash = "sha256-hp1HSef/jmp2SRck4OcfIut2lI7apOkYbw7/g4YY9nE=";
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
    homepage = "https://github.com/soreau/wf-info";
    description = "information views";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ wineee ];
    inherit (wayfire.meta) platforms;
  };
})
