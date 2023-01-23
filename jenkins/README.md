

kubectl create namespace jenkins


---------------- Configure helm ----------------
 helm repo add jenkinsci https://charts.jenkins.io
 helm repo update


 helm install cd-jenkins -f values.yaml jenkinsci/jenkins --namespace jenkins --wait

print : cat /run/secrets/chart-admin-password



kubectl create clusterrolebinding cluster-admin-binding-custom-k8-sa  --clusterrole=cluster-admin --user=col886@esparta86project.iam.gserviceaccount.com