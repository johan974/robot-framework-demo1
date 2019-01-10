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
                echo "ls of ${WORKSPACE}/Tests"
                sh "ls ${WORKSPACE}/Tests"
                sh 'docker run -v //k/data/${WORKSPACE}/reports:/opt/robotframework/reports -v //k/data/${WORKSPACE}/Tests:/opt/robotframework/tests \
                            --network=geosolution-localhost_geosolutionsnet -e BROWSER=chrome ppodgorsek/robot-framework:latest'
                sh 'ls -l ${WORKSPACE}/reports'
                echo "OK 3"
            }
        }
    }
    post {
        always {
            archive (includes: 'reports/*.html')
        }
    }
}