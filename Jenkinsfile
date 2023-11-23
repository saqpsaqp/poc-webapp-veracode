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
                        withCredentials([usernamePassword(credentialsId: 'API-Veracode-Erick', passwordVariable: 'SECRET_KEY', usernameVariable: 'SECRET_ID')]) {
                        veracode applicationName: 'POC-WEBAPP-VERACODE', canFailJob: true, createProfile: true, criticality: 'VeryHigh', deleteIncompleteScanLevel: '0', fileNamePattern: '', replacementPattern: '', sandboxName: '', scanExcludesPattern: '', scanIncludesPattern: '', scanName: 'Scan Demo POC', teams: 'Default Team', unstableBuild: true, uploadIncludesPattern: '**/**.war', vid: SECRET_ID, vkey: SECRET_KEY
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