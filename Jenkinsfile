pipeline {
  environment {
    registry = "ajayk333/samedaydelivery-1.jar"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any

  stages {
    stage('Cloning Git') {
      steps {
       git 'https://github.com/srajunisum/springboot-dockerdemo.git'
     }
    }

    stage('Gradle Build') {
    steps{
            script {
        if (isUnix()) {
            sh './gradlew clean build'
        } else {
            bat 'gradlew.bat clean build'
        }
        }
        }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage =  docker.build registry
        }
      }
    }
    stage('push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('deploy App') {
     steps{
        script {
            kubernetesDeploy(configs:"myconfig.yaml",kubeconfigId:"mycubeconfig")

        }
     }
    }

  }

}