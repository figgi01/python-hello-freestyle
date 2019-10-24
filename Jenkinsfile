node ('docker') {
    checkout scm

    stage('Build image') {
        def customImage = docker.build("figgi01/appimage:${BUILD_NUMBER}")
    }

    stage('Scan image with Aqua') {
        aqua locationType: 'local', localImage: 'figgi01/appimage:${BUILD_NUMBER}', hideBase: true,  notCompliesCmd: '', onDisallowed: 'fail', showNegligible: false
    }

    stage('Push to registry') {
        // Going to skip this part for testing.
    }

    stage('Scan image with Aqua') {
        aqua locationType: 'local', localImage: 'figgi01/appimage:${BUILD_NUMBER}', hideBase: true,  notCompliesCmd: '', onDisallowed: 'fail', showNegligible: false, register: true, registry: "Docker Hub"
    }


}
