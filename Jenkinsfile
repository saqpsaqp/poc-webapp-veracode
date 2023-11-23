pipeline {

    agent any

    triggers {
    	pollSCM '* * * * *'
    }

    options {
    	disableConcurrentBuilds()
    }

    stages {

        stage("test") {
            options { timeout(time: 30, unit: 'MINUTES') }
            steps {
                sh 'test/run.sh'
            }
        }

        stage("build") {
            options { timeout(time: 30, unit: 'MINUTES') }
            steps {
                sh 'webapp/gradle build -g gradle-user-home'
            }
        }

        stage("deploy") {

            steps {
                echo 'Deploy in Tomcat'
            }
        }
    }
}