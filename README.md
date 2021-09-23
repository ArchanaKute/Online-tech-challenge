# Online-tech-challenge
Challenge-2
Using below command you can access the server metadata:
$gcloud compute ssh --project prj-test --zone us-west1-b test-vm --command="curl \"http://metadata.google.internal/computeMetadata/v1/instance/image\" -H \"Metadata-Flavor: Google\""

In command section we can give below commands:
curl "http://metadata.google.internal/computeMetadata/v1/instance/image" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/0/" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/0/type" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/0/type" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/instance/tags" -H "Metadata-Flavor: Google"
curl "http://metadata.google.internal/computeMetadata/v1/METADATA_KEY?wait_for_change=true" -H "Metadata-Flavor: Google"
curl -v "http://metadata.google.internal/computeMetadata/v1/instance/tags" -H "Metadata-Flavor: Google"
