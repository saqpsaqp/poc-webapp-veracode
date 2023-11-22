pipeline {

    agent any

    triggers {
    	pollSCM '* * * * *'
    }

    stages {

        stage("test") {
            options { timeout(time: 30, unit: 'MINUTES') }
            steps {
                sh 'test/run.sh'
            }
        }

        stage("deploy") {

            steps {
                echo 'Deploy in Tomcat'
            }
        }
    }
}