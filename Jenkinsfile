pipeline {
  environment {
    registry = "gustavoapolinario/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any

  triggers{ cron('*/5 * * * * ') }

  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/srajunisum/springboot-dockerdemo.git'
      }
    }

    stage('Building image') {
      steps{
        script {
          dockerImage =  docker.build("ajayk333/samedaydelivery")
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

  }

   post { always { deleteDir() } success { mail to:"sraju@nisum.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we passed." } failure { mail to:"sraju@nisum.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed." } }
}