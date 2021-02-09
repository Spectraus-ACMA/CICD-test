#bin/bash

mkdir .pip_cache || echo '.pip_cache existed. skip creation'
GCP_ProjectID=$(gcloud config list --format 'value(core.project)' )      
gcloud builds submit --tag gcr.io/$GCP_ProjectID/django-markdown
gcloud run deploy --image gcr.io/$GCP_ProjectID/django-markdown --platform managed --port 8020
