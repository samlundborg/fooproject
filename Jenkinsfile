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
                sh 'newman run labbPostman.json --environment labbPostmanEnv.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
        stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d robot/Results robot/Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'robot/Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        }
    }
}
