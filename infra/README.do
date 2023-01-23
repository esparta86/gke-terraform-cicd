

gsutil mb -p esparta86project  -c regional -l us-west1 gs://tf-states-cicd/


gsutil iam ch serviceAccount:col886@esparta86project.iam.gserviceaccount.com@esparta86project.iam.gserviceaccount.com:legacyBucketWriter gs://terraform-state-cicd/