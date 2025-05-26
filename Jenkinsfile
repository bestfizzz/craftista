pipeline {
    agent { 
        node {
            label 'docker-agent-alpine'
        }
    }
    triggers {
        cron('* * * * *')  // Run every minute
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                echo "doing build stuff.."
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                echo "doing test stuff.."
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                docker-compose down || true
                docker-compose up -d --build
                '''
            }
        }
    }
}
