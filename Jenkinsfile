pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/samlundborg/fooproject.git'
            }
        }
        stage('Build') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
        stage('newman') {
            steps {
                sh 'newman run Restful_Booker_Facit.labbPostman.json --environment Restful_Booker.labbPostmanEnv.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
    }
}
