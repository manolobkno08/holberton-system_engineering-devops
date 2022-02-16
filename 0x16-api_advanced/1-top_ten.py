#!/usr/bin/python3
import requests
"""Reddit API"""


def top_ten(subreddit):
    """Get top 10"""
    limit = 10
    try:
        url = 'https://www.reddit.com/r/{subreddit}/hot.json?limit={l}'.format(
            subreddit=subreddit, l=limit)
        request = requests.get(
            url, headers={'User-agent': 'MyHolbertonAPI/0.0.1'})
        r = request.json()['data']
        [print(value['data']['title']) for value in r['children']]
    except(Exception):
        print('None')
