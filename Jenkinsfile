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

     stage('Deploy Dev') {
          // Developer Branches
          when { branch 'master' }

          }
          steps {
            container('kubectl') {
              // Create namespace if it doesn't exist
              //sh("kubectl get ns ${env.BRANCH_NAME} || kubectl create ns ${env.BRANCH_NAME}")
              // Don't use public load balancing for development branches
              sh("sed -i.bak 's#LoadBalancer#ClusterIP#' ./samedaydelivery/dockerkubernate.yaml")
              //sh("sed -i.bak 's#gcr.io/cloud-solutions-images/gceme:1.0.0#${IMAGE_TAG}#' ./k8s/dev/*.yaml")
             // step([$class: 'KubernetesEngineBuilder',namespace: "${env.BRANCH_NAME}", projectId: env.PROJECT, clusterName: env.CLUSTER, zone: env.CLUSTER_ZONE, manifestPattern: 'k8s/services', credentialsId: env.JENKINS_CRED, verifyDeployments: false])
              //step([$class: 'KubernetesEngineBuilder',namespace: "${env.BRANCH_NAME}", projectId: env.PROJECT, clusterName: env.CLUSTER, zone: env.CLUSTER_ZONE, manifestPattern: 'k8s/dev', credentialsId: env.JENKINS_CRED, verifyDeployments: true])
              echo 'To access your environment run `kubectl proxy`'
              echo "Then access your service via http://localhost:8001/api/v1/proxy/namespaces/${env.BRANCH_NAME}/services/${FE_SVC_NAME}:80/"
            }
          }
        }

  }
}