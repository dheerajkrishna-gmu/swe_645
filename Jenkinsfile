pipeline {
	agent any
	environment {
	DOCKERHUB_CREDENTIALS = credentials('docker-pass')
	}
	
	stages {
		stage("Building the Student Survey Image") {
			steps{
				script {
					sh 'rm -rf *.war'
					sh 'jar -cvf StudentSurvey.war -C web .'
					sh 'docker build -t dheerajkrishna141/student_survey_645:latest .'
				}
			}	
		}
		
		stage("Login to Docker Hub"){
			steps{
				script{
					sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'

				}
			}
		}
		stage("Pushing Image to DockerHub") {
			steps {
				script {
					sh 'docker push dheerajkrishna141/student_survey_645:latest'
					}
				}
			}
			
			
		stage("Deploying to Rancher") {
			steps {
				sh 'kubectl set image deployment/studentsurvey container-0=dheerajkrishna141/student_survey_645:latest -n hw-1-namespace'
				sh 'kubectl rollout status deployment/studentsurvey -n hw-1-namespace'
			}
		}
		
		
	}
	
}