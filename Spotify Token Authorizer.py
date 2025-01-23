import spotipy
import requests
from base64 import b64encode

url = 'https://accounts.spotify.com/api/token'

client_ID = 'removed for privacy'
client_secret = 'removed for privacy'

def main():
    auth_string = f"{client_ID}:{client_secret}"
    auth_string_encoded = auth_string.encode("utf-8")
    auth_base64 = b64encode(auth_string_encoded).decode("utf-8") # should be noted that API expects client_id and client_secret to be encoded in base64 for authentification

    # define post request dictionaries
    headers = {
        "Authorization": f"Basic {auth_base64}",
        "Content-Type": "application/x-www-form-urlencoded"
    }

    payload = { # client_credentials prints public data
        "grant_type": "client_credentials"
    }

    response = requests.post(url, headers=headers, data=payload)

    print(response.text) # prints my access token

if __name__ == "__main__":
    main()