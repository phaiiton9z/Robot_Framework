pipeline {
    agent any

    stages {
        stage('Run Robot Tests via run.sh') {
            steps {
                echo "🚀 Executing shell script..."
                sh './Script/run.sh'  
            }
        }
    }
}