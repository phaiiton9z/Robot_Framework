pipeline {
    agent any

    stages {
        stage('Run Robot Tests via run.sh') {
            steps {
                echo "🚀 Executing shell script..."
                sh './run.sh'
            }
        }
    }
}