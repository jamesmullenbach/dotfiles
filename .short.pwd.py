import os
from socket import gethostname
import time
username = os.environ['USER']
username = username.split("@")[0]
#current time minus the year !!WARNING!! NOT SCALABLE TO 5-DIGIT YEARS !!!WARNING!!!
host = gethostname()
if host.startswith('james'):
    host = 'lenovo'
t = time.ctime()[:-5]
pwd = os.getcwd()
homedir = os.path.expanduser('~')
pwd = pwd.replace(homedir, '~', 1)
pwd = pwd.replace("/media/james/Windows8_OS/Users/James", "W~", 1)
if len(pwd) > 30:
    pwd = pwd[:10]+'...'+pwd[-20:] # first 10 chars+last 20 chars
print(f'[{t} {username}@{host}:{pwd}]$ ')
