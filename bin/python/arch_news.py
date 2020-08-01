#!/usr/bin/env python

import feedparser
import re

class colors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def cleanHTML(rawHTML):
    cleanR = re.compile('<.*?>')
    cleanText = re.sub(cleanR,'',rawHTML)
    return cleanText

NewsFeed = feedparser.parse("https://www.archlinux.org/feeds/news/")
entry = NewsFeed.entries[0]

print(colors.OKGREEN + entry.published)
print(colors.HEADER + entry.title)
print(colors.OKBLUE + cleanHTML(entry.summary))
print(colors.FAIL + entry.link)
