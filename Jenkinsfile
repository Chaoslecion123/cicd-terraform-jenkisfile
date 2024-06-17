#!/bin/env/groovy

node ('terraform'){
    try {
        checkout scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git-token', url: 'https://github.com/Chaoslecion123/cicd-terraform-jenkisfile.git']])
        sh 'ls -l'
        // bat 'dir' when windows
    }catch(caughtError) {
        err = caughtError
    }
    finally {
        // cleanWs()
    }
}
