import os
import json
from datetime import datetime


def create_log_dir_if_not_exist():
    log_path = '/tmp/custom-monitoring/'

    isExist = os.path.exists(log_path)
    if not isExist:
        os.makedirs(log_path)

def read_uptime():
    # return time in seconds
    with open('/proc/uptime') as f:
        uptime = f.read()

    return uptime.split(' ')[0]

def read_loadavg():
    # return loadavg in last 1 min
    with open('/proc/loadavg') as f:
        loadavg = f.read()

    return loadavg.split(' ')[0]

def read_meminfo():
    # return total and free memory in kb
    with open('/proc/meminfo') as f:
        meminfo = f.read()

    return [meminfo.split('\n')[0].split(' ')[-2], meminfo.split('\n')[1].split(' ')[-2]]

def read_number_of_users():
    # return number of users in system
    with open('/etc/passwd') as f:
        return len(f.readlines())


with open(f'/tmp/custom-monitoring/{datetime.today().strftime("%y-%m-%d")}-awesome-monitoring.log', 'a+', encoding='utf-8') as log:
    metrics = {}
    timestamp = str(datetime.timestamp(datetime.now()))[0:-7]
    meminfo = read_meminfo()
    metrics['timestamp'] = timestamp
    metrics['uptime'] = read_uptime()
    metrics['loadavg_1m'] = read_loadavg()
    metrics['mem_total'] = meminfo[0]
    metrics['mem_free'] = meminfo[1]
    metrics['users'] = read_number_of_users()

    log.write(json.dumps(metrics) + '\n')
