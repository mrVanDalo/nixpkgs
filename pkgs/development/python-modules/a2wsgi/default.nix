{
  lib,
  buildPythonPackage,
  fetchPypi,
  asgiref,
  httpx,
  pdm-backend,
  pytest-asyncio,
  pytestCheckHook,
  starlette,
  baize,
}:

buildPythonPackage rec {
  pname = "a2wsgi";
  version = "1.10.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zkYv9+HarAvFcYPG+ADwmnHCp6mN3VzeyhSePqvzM44=";
  };

  nativeBuildInputs = [ pdm-backend ];

  nativeCheckInputs = [
    asgiref
    httpx
    pytest-asyncio
    pytestCheckHook
  ];

  dependencies = [
    starlette
    baize
  ];

  meta = {
    description = "Convert WSGI app to ASGI app or ASGI app to WSGI app";
    homepage = "https://github.com/abersheeran/a2wsgi";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ SuperSandro2000 ];
  };
}
