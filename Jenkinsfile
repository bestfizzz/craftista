pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "🔧 Installing Docker Compose (if not already installed)..."
                sh '''
                ls
                whoami
                docker --version
                docker compose version || echo "docker compose not found"
                '''
            }
        }

        stage('Test') {
            steps {
                echo "🧪 Testing.."
                sh 'echo "doing test stuff.."'
            }
        }

        stage('Deliver') {
            steps {
                echo '📦 Delivering...'
                // docker-compose-hub to pull image docker-compose from git repo
                sh '''
                docker compose down || true
                docker compose -f docker-compose-hub.yml up -d --build
                '''
            }
        }
    }
}
