locals {
  custom_data = <<EOF
#cloud-config
runcmd:
- [mkdir, '/actions-runner']
- cd /actions-runner
- [curl, -o, 'actions-runner.tar.gz', -L, 'https://github.com/actions/runner/releases/download/v${var.runner_version}/actions-runner-linux-x64-${var.runner_version}.tar.gz']
- [tar, -xzf, 'actions-runner.tar.gz']
- [chmod, -R, 777, '/actions-runner']
- [su, runner-admin, -c, '/actions-runner/config.sh --url https://github.com/${var.github_organisation} --token ${var.runner_token} --runnergroup ${var.runner_group_name}']
- ./svc.sh install
- ./svc.sh start
- [rm, '/actions-runner/actions-runner.tar.gz']
EOF
}
