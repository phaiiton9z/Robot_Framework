pipeline {
    agent any

    stages {
        stage('Run Robot Tests via run.sh') {
            steps {
                echo "🚀 Executing shell script..."
                sh './Script/run.sh'
            }
        }

        stage('Publish Robot HTML Reports') {
            steps {
                publishHTML(target: [
                    reportDir: 'Results',
                    reportFiles: 'log.html,report.html',
                    reportName: 'Robot Framework Report',
                    keepAll: true,
                    alwaysLinkToLastBuild: true
                ])
            }
        }
    }
}