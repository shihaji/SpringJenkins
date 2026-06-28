pipeline {
	
	agent any
	
	stages {
		
		stage('Build'){
		
			steps {
				bat 'docker build -t shihaji/springjenkins:latest .'
			}
			
		}
		
		stage('Docker login'){
			steps {
				withCredentials([usernamePassword(
					credentialsId: 'dockerhub-creds',
					usernameVariable: 'DOCKER_USER',
					passwordVariable: 'DOCKER_PASS'
				)]){
					
					bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS%'
				}
			}
		}
		
		stage('Docker Push'){
			steps {
				
				bat 'docker push shihaji/springjenkins:latest'
			}
		}	
	}
	
	
	
}