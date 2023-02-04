$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"

terraform init
terraform plan -out plan.out
terraform graph | dot -Tsvg > graph.svg
. $chrome "$((Get-Location).Path)/graph.svg"