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
                dir('webapp'){
                    sh 'gradle build -g gradle-user-home'
                }
            }
        }

        stage("scan"){
            steps {
                dir('webapp/build/libs'){
                    withCredentials([usernamePassword(credentialsId: 'API-Veracode-Erick', passwordVariable: 'secret-key', usernameVariable: 'secret-id')]) {
                        veracode applicationName: "${VERACODE_APP_NAME}", criticality: 'VeryHigh', debug: true, fileNamePattern: '', pHost: '', pPassword: '', pUser: '', replacementPattern: '', sandboxName: '', scanExcludesPattern: '', scanIncludesPattern: '', scanName: "${BUILD_TAG}", uploadExcludesPattern: '', uploadIncludesPattern: 'hello-world-0.0.1-SNAPSHOT.war', vid: secret-id, vkey: secret-key
                    }
                }
            }
        }

        stage("deploy") {

            steps {
                echo 'Deploy in Tomcat'
            }
        }
    }
}