pipeline {
    agent { 
        node {
            label 'docker-agent-alpine'
        }
    }
    triggers {
        cron('* * * * *')  // Every minute (consider H/5 for better spacing)
    }
    stages {
        stage('Check Environment') {
            steps {
                sh '''
                echo "User: $(whoami)"
                docker --version || echo "Docker not found"
                docker compose version || docker compose version || echo "Compose not found"
                '''
            }
        }
        stage('Build') {
            steps {
                echo "Building.."
                sh 'echo "doing build stuff.."'
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh 'echo "doing test stuff.."'
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                docker compose down || true
                docker compose up -d --build
                '''
            }
        }
    }
}
