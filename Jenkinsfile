pipeline {
  agent any
  stages {
  stage('terraform init') {
      steps {
        script {
          sh "terraform init -var AWS_ACCESS_KEY_ID=\"${env.AWS_ACCESS_KEY_ID}\" -var AWS_SECRET_ACCESS_KEY=\"${env.AWS_SECRET_ACCESS_KEY}\""
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

