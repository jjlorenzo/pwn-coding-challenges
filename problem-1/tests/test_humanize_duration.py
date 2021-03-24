from datetime import timedelta

from pytest import raises

from cprofile import humanize_timedelta_duration


def _htd(**kwargs):
  """ helper for creating formatted values """
  return humanize_timedelta_duration(timedelta(**kwargs))


def test_negative_value():
  with raises(ValueError):
    _htd(seconds=-1)


def test_zero_value():
  with raises(ValueError):
    _htd()


def test_positive_value_singular():
  assert _htd(days=1) == "1 day"
  assert _htd(hours=1) == "1 hour"
  assert _htd(minutes=1) == "1 minute"
  assert _htd(seconds=1) == "1 second"
  assert _htd(microseconds=1) == "1 microsecond"


def test_positive_value_plural():
  assert _htd(days=2) == "2 days"
  assert _htd(hours=2) == "2 hours"
  assert _htd(minutes=2) == "2 minutes"
  assert _htd(seconds=2) == "2 seconds"
  assert _htd(microseconds=2) == "2 microseconds"


def test_positive_values_singular():
  assert _htd(days=1, hours=1) == "1 day and 1 hour"
  assert _htd(days=1, hours=1, minutes=1) == "1 day, 1 hour and 1 minute"
  assert _htd(days=1, hours=1, minutes=1, seconds=1) == "1 day, 1 hour, 1 minute and 1 second"


def test_positive_values_plural():
  assert _htd(days=2, hours=2) == "2 days and 2 hours"
  assert _htd(days=2, hours=2, minutes=2) == "2 days, 2 hours and 2 minutes"
  assert _htd(days=2, hours=2, minutes=2, seconds=2) == "2 days, 2 hours, 2 minutes and 2 seconds"


def test_positive_values_mixed():
  assert _htd(days=1, hours=2) == "1 day and 2 hours"
  assert _htd(days=1, hours=2, minutes=1) == "1 day, 2 hours and 1 minute"
  assert _htd(minutes=1, seconds=1, microseconds=5) == "1 minute, 1 second and 5 microseconds"
  assert _htd(minutes=2, seconds=1, microseconds=5) == "2 minutes, 1 second and 5 microseconds"
