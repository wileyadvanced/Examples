import requests

# Replace with your actual API key and account ID
API_KEY = 'your_api_key'
ACCOUNT_ID = 'your_account_id'
HARNESS_ID = 'harness_instance'

# Set the API endpoint
url = f'https://{HARNESS_ID}/v1/cloud-costs/overview?accountId={ACCOUNT_ID}'

# Set the headers for authentication
headers = {
    'Content-Type': 'application/json',
    'Authorization': f'Bearer {API_KEY}'
}

def get_active_billing_items():
    try:
        # Make the API request
        response = requests.get(url, headers=headers)

        # Check if the request was successful
        if response.status_code == 200:
            data = response.json()
            # Process and print the active billing items
            active_items = data.get('activeItems', [])
            for item in active_items:
                print(f"Item Name: {item['name']}, Cost: {item['cost']}, Type: {item['type']}")
        else:
            print(f"Error: {response.status_code} - {response.text}")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    get_active_billing_items()
