pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: "master", url:'https://github.com/johan974/robot-framework-demo1.git'
            }
        }
        stage('Test') {
            def PWD = ${WORKSPACE}
            steps{
                echo "Pwd = "
                sh "pwd"
                echo "PWD = ${PWD}"
                echo "ls of ${PWD}"
                sh "ls ${PWD}"
                echo "ls of ${PWD}/Tests"
                sh "ls ${PWD}/Tests"
                sh 'docker run -v ${PWD}/reports:/opt/robotframework/reports:Z -v ${PWD}/Tests:/opt/robotframework/tests:Z \
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