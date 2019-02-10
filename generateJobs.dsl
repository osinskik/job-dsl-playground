job('DSL-Tutorial-Test-Github') {
    scm {
        git('git://github.com/quidryan/aws-sdk-test.git')
    }
    triggers {
        scm('H/15 * * * *')
    }
    steps {
        maven('-e clean test')
    }
}

pipelineJob('generated.pipeline.job') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelines/colorPipeline.groovy'))
            sandbox()
        }
    }
}

pipelineJob('ssh_check') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelines/sshCheck.groovy'))
            sandbox()
        }
    }
}