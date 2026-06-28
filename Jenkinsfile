pipeline {
	
	agent any
	
	stages {
		
		stage('Build'){
		
			steps {
				bat 'mvn clean package'
			}
			
		}
		
		stage('Build Docker image'){
			
			steps{
				
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
		
		stage('Deploy to kubernates'){
			steps {
				
				withKubeConfig([credentialsId: 'kuberConfig-cred']){
					
					bat 'kubectl apply -f k8s/service.yaml'
					bat 'kubectl apply -f k8s/deployment.yaml'
					bat 'kubectl set image deployment/springjenkins-deployment springjenkins= shihaji/springjenkins:latest'
					bat 'kubectl rollout status deployment/springjenkins-deployment'
					
				}
				
			}
			
		}	
	}
	
	
	
}