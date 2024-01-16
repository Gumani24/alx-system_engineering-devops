#!/usr/bin/python3
"""queries the Reddit API and returns the number of subscribers"""
import requests

def number_of_subscribers(subreddit):
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'MyBot/1.0'}

    try:
        response = requests.get(url, headers=headers)

        """Check if the request was successful"""
        if response.status_code == 200:
            subreddit_data = response.json().get('data', {})
            subscribers = subreddit_data.get('subscribers', 0)
            return subscribers
        else:
            print(f"Error: {response.status_code}. Unable to fetch data for subreddit '{subreddit}'")
            return 0

    except Exception as e:
        print(f"An error occurred: {e}")
        return 0
