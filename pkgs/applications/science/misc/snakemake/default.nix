{ stdenv, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "snakemake";
  version = "5.7.4";

  propagatedBuildInputs = with python3Packages; [
    appdirs
    ConfigArgParse
    datrie
    docutils
    GitPython
    jsonschema
    psutil
    pyyaml
    ratelimiter
    requests
    wrapt
  ];

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "11f2f00c505d928b91332056667d49c96ed1694bf78e798ce27613948d44a2a2";
  };

  doCheck = false; # Tests depend on Google Cloud credentials at ${HOME}/gcloud-service-key.json

  meta = with stdenv.lib; {
    homepage = http://snakemake.bitbucket.io;
    license = licenses.mit;
    description = "Python-based execution environment for make-like workflows";
    longDescription = ''
      Snakemake is a workflow management system that aims to reduce the complexity of
      creating workflows by providing a fast and comfortable execution environment,
      together with a clean and readable specification language in Python style. Snakemake
      workflows are essentially Python scripts extended by declarative code to define
      rules. Rules describe how to create output files from input files.
    '';
    maintainers = with maintainers; [ helkafen renatoGarcia ];
  };
}
