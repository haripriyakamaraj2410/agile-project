pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "haripriyakamaraj2410/ecommerce-app:latest"
        KUBECONFIG_PATH = "C:\\ProgramData\\Jenkins\\.kube\\config"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/haripriyakamaraj2410/agile-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'docker_kuber', variable: 'PASSWORD')]) {
                    bat '''
                    echo %PASSWORD% | docker login -u haripriyakamaraj2410 --password-stdin
                    docker push %DOCKER_IMAGE%
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat '''
                set KUBECONFIG=%KUBECONFIG_PATH%
                kubectl config use-context minikube
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml
                '''
            }
        }
    }
}
