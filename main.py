import os


def _sum(*args):
    total = 0
    for arg in args:
        total += arg
    return total


def get_service_name():
    return os.environ.get("SERVICE_NAME")


def get_port():
    return int(os.environ.get("PORT"))
