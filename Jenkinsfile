pipeline {
  environment {
    registry = "ajayk333/sdd"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any

  stages {
    stage('Cloning Git') {
      steps {

        git([
                url: "https://github.com/srajunisum/springboot-dockerdemo.git",
                poll: true
            ])
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