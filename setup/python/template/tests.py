from dojo import is_too_old

def test_asks_age_for_old_people():
    result = is_too_old(150)
    assert result

def test_asks_age_for_young_people():
    result = is_too_old(30)
    assert not result