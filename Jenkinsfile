node {

  def app

   stage('Clone Repository') {
        // Get some code from a GitHub repository
        git 'https://github.com/srajunisum/springboot-dockerdemo.git'

   }

    stage('Gradle Build') {
        if (isUnix()) {
            sh './gradlew clean build'
        } else {
            bat 'gradlew.bat clean build'
        }
    }

    stage('Build Image') {

     docker.build("ajayk333/samedaydelivery.jar")
             }

    stage ('publish Docker Image'){
    withCredentials([string(credentialsId:'dockerHubPwd', variable:'dockerHubPwd')]) {
      sh "docker login -u ajayk333 -p ${dockerHubPwd}"
    }
    sh 'docker push ajayk333/samedaydelivery-1.jar'
    }
   }
