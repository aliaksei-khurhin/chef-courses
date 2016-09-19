plugins = {
"build-token-root.hpi" => "http://updates.jenkins-ci.org/latest/build-token-root.hpi",
"config-file-provider.hpi" => "http://updates.jenkins-ci.org/latest/config-file-provider.hpi",
"credentials.hpi" => "http://updates.jenkins-ci.org/latest/credentials.hpi",
"ssh-credentials.hpi" => "http://updates.jenkins-ci.org/latest/ssh-credentials.hpi",
"token-macro.hpi" => "http://updates.jenkins-ci.org/latest/token-macro.hpi",
"delivery-pipeline-plugin.hpi" => "http://updates.jenkins-ci.org/latest/delivery-pipeline-plugin.hpi",
"structs.hpi" => "http://updates.jenkins-ci.org/latest/structs.hpi",
"junit.hpi" => "http://updates.jenkins-ci.org/latest/junit.hpi",
"javadoc.hpi" => "http://updates.jenkins-ci.org/latest/javadoc.hpi",
"display-url-api.hpi" => "http://updates.jenkins-ci.org/latest/display-url-api.hpi",
"mailer.hpi" => "http://updates.jenkins-ci.org/latest/mailer.hpi",
"maven-plugin.hpi" => "http://updates.jenkins-ci.org/latest/maven-plugin.hpi",
"dashboard-view.hpi" => "http://updates.jenkins-ci.org/latest/dashboard-view.hpi",
"jquery.hpi" => "http://updates.jenkins-ci.org/latest/jquery.hpi",
"mapdb-api.hpi" => "http://updates.jenkins-ci.org/latest/mapdb-api.hpi",
"scm-api.hpi" => "http://updates.jenkins-ci.org/latest/scm-api.hpi",
"workflow-step-api.hpi" => "http://updates.jenkins-ci.org/latest/workflow-step-api.hpi",
"workflow-scm-step.hpi" => "http://updates.jenkins-ci.org/latest/workflow-scm-step.hpi",
"subversion.hpi" => "http://updates.jenkins-ci.org/latest/subversion.hpi",
"script-security.hpi" => "http://updates.jenkins-ci.org/latest/script-security.hpi",
"matrix-project.hpi" => "http://updates.jenkins-ci.org/latest/matrix-project.hpi",
"rebuild.hpi" => "http://updates.jenkins-ci.org/latest/rebuild.hpi",
"workflow-api.hpi" => "http://updates.jenkins-ci.org/latest/workflow-api.hpi",
"workflow-basic-steps.hpi" => "http://updates.jenkins-ci.org/latest/workflow-basic-steps.hpi",
"node-iterator-api.hpi" => "http://updates.jenkins-ci.org/latest/node-iterator-api.hpi",
"ssh-slaves.hpi" => "http://updates.jenkins-ci.org/latest/ssh-slaves.hpi",
"vsphere-cloud.hpi" => "http://updates.jenkins-ci.org/latest/vsphere-cloud.hpi",
"config-file-provider.hpi" => "http://updates.jenkins-ci.org/latest/config-file-provider.hpi",
"managed-scripts.hpi" => "http://updates.jenkins-ci.org/latest/managed-scripts.hpi",
"job-dsl.hpi" => "http://updates.jenkins-ci.org/latest/job-dsl.hpi",
"project-inheritance.hpi" => "http://updates.jenkins-ci.org/latest/project-inheritance.hpi",
"promoted-builds.hpi" => "http://updates.jenkins-ci.org/latest/promoted-builds.hpi",
"run-condition.hpi" => "http://updates.jenkins-ci.org/latest/run-condition.hpi",
"conditional-buildstep.hpi" => "http://updates.jenkins-ci.org/latest/conditional-buildstep.hpi",
"parameterized-trigger.hpi" => "http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi",
"ant.hpi" => "http://updates.jenkins-ci.org/latest/ant.hpi",
"analysis-core.hpi" => "http://updates.jenkins-ci.org/latest/analysis-core.hpi",
"git-client.hpi" => "http://updates.jenkins-ci.org/latest/git-client.hpi",
"git.hpi" => "http://updates.jenkins-ci.org/latest/git.hpi",
"greenballs.hpi" => "http://updates.jenkins-ci.org/latest/greenballs.hpi"
}

plugins.each do | key,value |
  remote_file "/var/lib/jenkins/plugins/#{key}" do
    source value
    owner 'jenkins'
    group 'jenkins'
  end
end
