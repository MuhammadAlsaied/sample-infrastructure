pipeline {
  agent any
  stages {
  stage('terraform init') {
      steps {
        script {
          sh "terraform init"
        }
      }
    }

     stage('terraform apply') {
      steps {
        script {
          sh "terraform apply -var-file dev.tfvars -auto-approve"
        }
      }
    }
  }
}

