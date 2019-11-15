node {

  def app

   stage('Clone Repository') {
        // Get some code from a GitHub repository
        git 'https://github.com/srajunisum/springboot-dockerdemo.git'

   }

   stage('Build Image') {
           docker.build("samedaydelivery-1")
           }

   }