#!/bin/env/groovy

node ('terraform'){
    err = null
    try {
        stage('Checkout'){
            checkout scmGit(
            branches: [[name: '*/main']], 
            extensions: [], 
            userRemoteConfigs: [[credentialsId: 'git-token', 
            url: 'https://github.com/Chaoslecion123/cicd-terraform-jenkisfile.git'
            ]])
            sh 'ls -l'
            // bat 'dir' when windows
        }

        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: "aws_credentials",
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
            // AWS Code
            
            stage('Init'){
                sh 'terraform init'
            }

            stage('Validate'){
                sh 'terraform fmt'
                sh 'terraform validate'
            }

            stage('Plan'){
                sh 'terraform plan -out=tfplan'
            }
        }

        
        
    }catch(caughtError) {
        err = caughtError
    }
    finally {
        cleanWs()
        if(err){
            throw err
        }
    }
}
