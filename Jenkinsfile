pipeline {

    agent any

    triggers {
    	pollSCM 'H/10 * * * *'
    }

    options {
    	disableConcurrentBuilds()
    }

    stages {

        stage("test") {
            agent {
                docker {
                    image 'adoptopenjdk/openjdk17:latest'
                    args '-v $HOME/.m2:/tmp/jenkins-home/.m2'
                }
            }
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