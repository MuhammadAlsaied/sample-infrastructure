pipeline {
  agent any
  stages {
  stage('Stage 1') {
      steps {
        script {
          terraform plan -var-file dev.tfvars -auto-approve
        }
      }
    }
  }
}

