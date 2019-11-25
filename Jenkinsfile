pipeline {
  environment {
    registry = "ajayk333/sdd"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent { dockerfile true }

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