pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/haripriyakamaraj2410/agile-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t agile-project .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d -p 5000:5000 agile-project'
            }
        }

    }
}
