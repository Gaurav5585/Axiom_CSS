pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "gaurav5585/axiom_core:2.20"
    }
    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git branch: 'main', url: 'https://github.com/Gaurav5585/Axiom_CSS.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        // Login to DockerHub
                        sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                        // Push image to DockerHub
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    // Stop and remove existing containers (optional)
                    sh 'docker rm -f $(docker ps -aq) || true'
                    // Run container
                    sh 'docker run -d -p 5585:80 $DOCKER_IMAGE'
                }
            }
        }
    }
    post {
        success {
            echo 'Deployment successful! Application is accessible at http://192.168.1.18:5585'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}

