# python-hello-freestyle
scanner-cli freestyle example.


Scanner can be added manually to existing freestyle based project, or can
be included as a pipeline step.  In either scenario there is a choice to
use scanner-cli or Aqua Security plugin.

### General notes

If you are failing the build, do so before the sccanner-cli


### Jenkins Freestyle project snippet


This example includes use of scanner-cli directly, as a build step
within jenkins in a freestyle project, without use of Aqua Security plugin.


*  Add scanner user to Jenkins credential store, and create user in Aqua console.

* In project, add binding to scanner user as separated credential with username `AQUAUSER` and password `AQUAPASS`

* Define variables, either in global scope and inherited, or specific to project:


  `AQUAIMAGE` The name of the image to use,

  `AQUAHOST`  Hostname for Aqua console

* Add a build step as sh script as below.

  Replace the image and tag reference with your own.

  Image parameters can be changed according to syntax seen if scanner
  is run with --help parameter or documentation.

  ```
  docker build . -t demoimage/hello-freestyle:${BUILD_NUMBER}

  sudo docker run --rm  -v /var/run/docker.sock:/var/run/docker.sock ${AQUAIMAGE} scan --host ${AQUAHOST} --user ${AQUAUSER} --password ${AQUAPASS} --html --local --register --registry "Docker Hub" "demoimage/hello-freestyle:${BUILD_NUMBER}" > result.html
  ```

* Add Post-build Action of 'Archive the artifacts'.

  Select `result.html` as the file to archive.

  Optionally fingerprint the archive in advanced settings.





