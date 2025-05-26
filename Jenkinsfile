pipeline {
    agent {
        node {
            label 'built-in'  // Or any label you use
        }
    }
    triggers {
        cron('* * * * *')  // Every minute
    }
    stages {
        stage('Build') {
            steps {
                echo "🔧 Installing Docker Compose (if not already installed)..."
                sh '''
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
                sh '''
                docker compose down || true
                docker compose up -d --build
                '''
            }
        }
    }
}
