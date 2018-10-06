pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
            args '-v `pwd`/reports:/opt/robotframework/reports -v `pwd`/tests:/opt/robotframework/tests -e BROWSER=chrome'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: "master", url:'https://github.com/johan974/robot-framework-demo1.git'
            }
        }
        stage('Test') {
            steps{
                sh 'run-tests.sh'
            }
        }
    }
    post {
        always {
            archive (includes: 'reports/*.html')
        }
    }
}