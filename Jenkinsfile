pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        TF_VAR_file = "terraform.tfvars"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/mohankumar130/kt_sai_terraform.git'
            }
        }

        stage('Check AWS Credentials') {
            steps {
                sh 'env | grep AWS'   // Debug AWS env variables
                sh 'aws sts get-caller-identity'  // Check AWS identity
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=${TF_VAR_file} -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
