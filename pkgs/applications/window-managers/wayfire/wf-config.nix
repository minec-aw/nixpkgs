{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
  meson,
  ninja,
  pkg-config,
  doctest,
  glm,
  libevdev,
  libxml2,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "wf-config";
  version = "d89d630ff3e3d8deb7813d6cd57b88e81ec059f9";

  src = fetchFromGitHub {
    owner = "WayfireWM";
    repo = "wf-config";
    rev = "${finalAttrs.version}";
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    libevdev
    libxml2
  ];

  propagatedBuildInputs = [
    glm
  ];

  nativeCheckInputs = [
    cmake
  ];
  checkInputs = [
    doctest
  ];
  # CMake is just used for finding doctest.
  dontUseCmakeConfigure = true;

  strictDeps = true;

  mesonFlags = [
    (lib.mesonEnable "tests" (stdenv.buildPlatform.canExecute stdenv.hostPlatform))
  ];

  doCheck = true;

  meta = {
    homepage = "https://github.com/WayfireWM/wf-config";
    description = "Library for managing configuration files, written for Wayfire";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      teatwig
      wucke13
      wineee
    ];
    platforms = lib.platforms.unix;
  };
})
