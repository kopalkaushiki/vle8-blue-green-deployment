pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/kopalkaushiki/vle8-blue-green-deployment.git'
            }
        }

        stage('Build Blue and Green Images') {
            steps {
                sh 'docker build -t myapp:v1 -f Dockerfile ./blue'
                sh 'docker build -t myapp:v2 -f Dockerfile ./green'
               }
        }

        stage('Deploy Blue') {
            steps {
                sh 'kubectl apply -f deployment-blue.yaml'
            }
        }

        stage('Deploy Green') {
            steps {
                sh 'kubectl apply -f deployment-green.yaml'
            }
        }

        stage('Switch Traffic') {
            steps {
                input message: 'Switch traffic to Green?'
                sh '''
                kubectl patch service bluegreen-service \
                -p '{"spec":{"selector":{"app":"bluegreen","color":"green"}}}'
                '''
            }
        }
    }
}
