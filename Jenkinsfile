pipeline {
    agent any

    // ✅ Specify tools installed in Jenkins Global Tool Configuration
    tools {
        jdk 'JDK-11'        // Change to match your Jenkins JDK installation name
        maven 'Maven-3.9'   // Change to match your Jenkins Maven installation name
    }

    environment {
        // Use SSH for GitHub
        GIT_SSH_COMMAND = "ssh -o StrictHostKeyChecking=no"
        DOCKER_IMAGE = "myapp:latest"
    }

    stages {

        stage('Checkout from GitHub') {
            steps {
                // Make sure your repo uses SSH URL, not HTTPS
                git branch: 'main', url: 'git@github.com:vikaspawar683-beep/myapp.git'
            }
        }

        stage('Clean & Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop & remove existing container if it exists
                    sh '''
                    if [ $(docker ps -aq -f name=myapp-container) ]; then
                        docker stop myapp-container
                        docker rm myapp-container
                    fi
                    '''
                    // Run new container
                    sh "docker run -d --name myapp-container -p 8080:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check the logs."
        }
    }
}
