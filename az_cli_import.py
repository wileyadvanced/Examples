import requests
import json

# ServiceNow instance details
instance = 'your_instance'
user = 'your_username'
pwd = 'your_password'

# Prepare the headers
headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

# Load the resources from the file
with open('azure_resources.json') as f:
    resources = json.load(f)

for resource in resources:
    # Prepare the resource data for ServiceNow
    resource_data = {
        "name": resource['name'],
        "type": resource['type'],
        "id": resource['id'],
        "location": resource['location'],
        # Add more fields as necessary
    }

    # API endpoint for creating or updating a CI
    url = f'https://{instance}.service-now.com/api/now/table/cmdb_ci'

    # Make the request
    response = requests.post(url, auth=(user, pwd), headers=headers, data=json.dumps(resource_data))

    # Check the response
    if response.status_code == 201:
        print(f"Resource {resource['name']} added to CMDB successfully.")
    else:
        print(f"Failed to add resource {resource['name']}:", response.status_code, response.text)
