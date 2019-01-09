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
                PWD = ${WORKSPACE}
                echo "Pwd = "
                sh "pwd"
                PWD2 = pwd();
                echo "PWD = ${PWD} and pwd2 = ${PWD2}"
                echo "ls of ${PWD}"
                sh "ls ${PWD}"
                echo "ls of ${PWD}/Tests"
                sh "ls ${PWD}/Tests"
                sh 'docker run -v ${WORKSPACE}/reports:/opt/robotframework/reports:Z -v ${WORKSPACE}/Tests:/opt/robotframework/tests:Z \
                            -e BROWSER=chrome ppodgorsek/robot-framework:latest'
                sh 'ls -l ${PWD}/reports'
            }
        }
    }
    post {
        always {
            archive (includes: 'reports/*.html')
        }
    }
}