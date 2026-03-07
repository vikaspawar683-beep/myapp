pipeline {
    agent any

    tools {
        maven 'Maven-3.9'
        jdk 'JDK-11'
    }

    stages {

        stage('Checkout from GitHub') {
            steps {
                git 'https://github.com/vikaspawar683-beep/myapp.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:1.0 .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop myapp-container || true
                docker rm myapp-container || true
                docker run -d -p 8081:8080 --name myapp-container myapp:1.0
                '''
            }
        }

    }
}
