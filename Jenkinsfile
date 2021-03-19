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
        stage('newman') {
            steps {
                sh 'newman run Restful_Booker_Facit.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
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
    }
}
