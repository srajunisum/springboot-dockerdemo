pipeline {
  environment {
    registry = "gustavoapolinario/docker-test"
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
      script{
             bat 'gradlew.bat clean build'
         }
        }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage =  docker.build("ajayk333/sdd")
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
            kubernetesDeploy(configs:"bootdemo.yaml",kubeconfigId:"mycubeconfig")

        }
     }
    }

  }

}