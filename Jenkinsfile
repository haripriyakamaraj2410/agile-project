pipeline {
    agent any

    environment {
        IMAGE_NAME = "haripriyakamaraj2410/ecommerce-app"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/haripriyakamaraj2410/agile-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'kubernets',
                    usernameVariable: 'USERNAME',
                    passwordVariable: 'PASSWORD'
                )]) {

                    bat '''
                    echo %PASSWORD% | docker login -u %USERNAME% --password-stdin
                    docker push %IMAGE_NAME%:latest
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
