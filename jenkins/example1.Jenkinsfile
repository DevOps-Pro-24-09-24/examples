pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/DevOps-Pro-24-09-24/students.git'
        ARCHIVE_NAME = 'archive.zip'
        BRANCH_NAME = 'main'
    }

       stages {

         stage('Checkout') {
            steps {
                // Завантаження репозиторію з GitHub з вказаною гілкою
                git branch: "${env.BRANCH_NAME}", url: "${env.REPO_URL}"
            }
        }

        stage('Archive') {
            steps {
                // Створення архіву з вмістом репозиторію
                sh "zip -r ${env.ARCHIVE_NAME} *"
            }
        }

        stage('Create Artifact') {
            steps {
                // Створення артефакту з архіву
                archiveArtifacts artifacts: "${env.ARCHIVE_NAME}", allowEmptyArchive: false
                }
            }
    }

    post {
        always {
            // Очищення робочого простору після завершення
            cleanWs()
        }
    }
}