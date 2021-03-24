from datetime import datetime


class Timer(object):
  """ Context-Manager for measure code execution """

  def __init__(self):
    self.start_date = None
    self.end_date = None
    self.duration_timedelta = None

  def __enter__(self):
    self.start_date = datetime.now()
    return self

  def __exit__(self, *exc):
    self.end_date = datetime.now()
    self.duration_timedelta = self.end_date - self.start_date
    return False

  @property
  def duration(self):
    return humanize_timedelta_duration(self.duration_timedelta)

  def __str__(self):
    return f"Timer(start_date -> {self.start_date}, end_date -> {self.end_date}, duration -> {self.duration})"


def humanize_timedelta_duration(td):
  """ Utility function to convert timedelta value to a friendly format for human interpretation """
  total_seconds = td.total_seconds()
  if total_seconds <= 0:
    raise ValueError(f"Invalid duration value {td}")
  units = (
    ("day", 86400),  # 60 * 60 * 24
    ("hour", 3600),  # 60 * 60
    ("minute", 60),
    ("second", 1),
  )
  parts = []
  for txt, val in units:
    val, total_seconds = divmod(total_seconds, val)
    if val:
      parts.append(f"{int(val)} {txt}{'s' if abs(val) != 1 else ''}")

  if total_seconds:
    val = total_seconds * 1000000
    txt = "microsecond"
    parts.append(f"{int(val)} microsecond{'s' if abs(val) != 1 else ''}")

  if len(parts) > 1:
    return f"{', '.join(parts[:-1])} and {parts[-1]}"
  return parts[0]
