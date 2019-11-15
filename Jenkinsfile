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

   }