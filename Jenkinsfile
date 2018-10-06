pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: "master", url:'https://github.com/johan974/robot-framework-demo1.git'
            }
        }
        stage('Test') {
            steps{
                sh 'docker run -v ${PWD}/reports:/opt/robotframework/reports:Z -v ${PWD}/Tests:/opt/robotframework/tests:Z \
                            -e BROWSER=chrome ppodgorsek/robot-framework:latest'
            }
        }
    }
    post {
        always {
            archive (includes: 'reports/*.html')
        }
    }
}