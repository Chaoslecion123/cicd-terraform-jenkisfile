#!/bin/env/groovy

node ('terraform'){
    err = null
    try {
        stage('Checkout'){
            gitscmvar=checkout scmGit(
            branches: [[name: '*/main']], 
            extensions: [], 
            userRemoteConfigs: [[credentialsId: 'git-token', 
            url: 'https://github.com/Chaoslecion123/cicd-terraform-jenkisfile.git'
            ]])
            sh 'ls -l'
            echo gitscmvar
            // bat 'dir' when windows
        }

        branch = 'main'

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

            stage('Apply') {
                when(branch == 'main'){
                    sh 'terraform apply tfplan'
                }
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
