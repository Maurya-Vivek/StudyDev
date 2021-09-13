def gv

pipeline {
    agent any
	enviornment{
		UserDfndEnvVar_Versn = '1.3.0'
		SERVER_CREDENTIALS_VAR = credentials('CredentialsId') //credentials() is the function that binds the credentials to your env variables
		//for this to work we need to have credentials binding plugin to be installed.
	}
    parameters {
		string(name: 'VersnParam', defaultValue: '', description: 'version to be deployed')
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
		
    }
    stages {
        stage("init") {
            steps {
                script {
                   gv = load "script.groovy" 
                }
            }
        }
        stage("build") {
			when{
				expression{
					params.VersnParam == 'Build'
				}
			}
            steps {
                script {
                    gv.buildApp()
                }
            }
        }
        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
					//if you need credentials in only one stage and not globally, use withcredentials functn which takes objects as parameters
					withCredentials([
						usernamePassword(credentials: 'CredentialsId', usernameVariable: UserDefinedUsrNamVariable, passwordVariable: UserDefinedPwdVariable)
					]){
						echo "UserName is ${UserDefinedUsrNamVariable}"
						echo "Password is ${UserDefinedPwdVariable}"
					}
                script {
                    gv.testApp()
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    gv.deployApp()
					echo "Deploying with server credentials ${SERVER_CREDENTIALS_VAR}"
                }
            }
        }
    }   
}
