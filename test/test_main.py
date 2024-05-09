from main import _sum, get_service_name, get_port


def test_sum_case_1():

    total = _sum(1, 2, 3, 4, 5)
    assert total == 15


def test_sum_case_2():

    total = _sum(1, 2, 3)
    assert total == 6


def test_get_service_name():

    service_name = get_service_name()

    assert type(service_name) == str
    assert len(service_name) != 0


def test_get_port():

    port = get_port()

    assert type(port) == int
    assert port > 1000
