pipepline {
    agent any
    options {

    }
    stages {
        stage('Example') {
            agent any
            options {
                timeout(time: 1, unit: 'SECONDS')
            }
            steps {
                echo 'Hello World'
            }
        }
    }
}