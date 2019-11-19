pipeline {
  environment {
    registry = "gustavoapolinario/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any

  triggers {
          cron('H */4 * * 1-5')
      }

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
}