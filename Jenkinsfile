pipeline {
    agent {
        node {
            label 'docker-agent-alpine'  // Or any label you use
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
                set -e

                # Check if Docker Compose v2 plugin exists
                if ! docker compose version > /dev/null 2>&1; then
                    echo "Docker Compose v2 not found. Installing..."

                    PLUGIN_DIR="/usr/libexec/docker/cli-plugins"
                    mkdir -p "$PLUGIN_DIR"

                    curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
                        -o "$PLUGIN_DIR/docker-compose"
                    chmod +x "$PLUGIN_DIR/docker-compose"

                    echo "✅ Docker Compose installed."
                else
                    echo "✅ Docker Compose already installed."
                fi

                docker compose version
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
