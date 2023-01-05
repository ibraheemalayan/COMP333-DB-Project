from flask import Flask
from redis import Redis
from datetime import datetime
from os import getpid
from socket import gethostname


def record_start_up(app: Flask, redis_client: Redis):

    # TODO use the atexit module to record currently working workers and sth at aws level to get running containers to get insights about the fleet

    redis_client.rpush(
        f'Deployment {app.config["VERSION"]}',
        (
            f"deployment data\n📅 dates"
            f"\n\tutc time: {str(datetime.utcnow().strftime('%m/%d/%Y, %I:%M %p'))}"
            f"\n\tlocal time: {str(datetime.now().strftime('%m/%d/%Y, %I:%M %p'))}"
            f"\n⚙️ config"
            f"\n\tversion: {app.config['VERSION']}"
            f"\n\tlast update: {app.config['LAST_UPDATE']}"
            f"\n🏃‍♂️ instance"
            f"\n\thostname: {gethostname()}"
            f"\n\tpid: {getpid()}"
        ),
    )
