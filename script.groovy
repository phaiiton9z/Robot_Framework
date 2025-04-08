pipeline {
    agent any

    environment {
        VENV_DIR = "venv"
        ROBOT_REPORT_DIR = "Results"
    }

    stages {
        stage('Create Virtualenv') {
            steps {
                echo "Creating virtual environment..."
                sh """
                python3 -m venv ${VENV_DIR}
                source ${VENV_DIR}/bin/activate
                pip install -r requirements.txt
                """
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                echo "Running Robot tests in virtual environment..."
                sh """
                source ${VENV_DIR}/bin/activate
                mkdir -p ${ROBOT_REPORT_DIR}
                robot -d ${ROBOT_REPORT_DIR} -L TRACE Tests/
                """
            }
        }

        stage('Publish Robot Results') {
            steps {
                publishRobotResults(outputPath: "${ROBOT_REPORT_DIR}")
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    reportDir: "${ROBOT_REPORT_DIR}",
                    reportFiles: 'report.html',
                    keepAll: true,
                    alwaysLinkToLastBuild: true,
                    reportName: 'Robot Framework Report'
                ])
            }
        }
    }

    post {
        always {
            echo "Cleaning up virtual environment..."
            sh "rm -rf ${VENV_DIR}"
        }
    }
}