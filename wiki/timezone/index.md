
```python
from datetime import datetime, timedelta, timezone

OFFSET_DEFAULT = "UTC-03:00"


def get_timezone(offset: str = OFFSET_DEFAULT) -> timezone:
    sign = 1 if offset[3] == "+" else -1
    hours = int(offset[4:6])
    minutes = int(offset[7:9])

    return timezone(sign * timedelta(hours=hours, minutes=minutes))


def dt_to_tz(dt: datetime, offset: str = OFFSET_DEFAULT) -> datetime:
    tz = get_timezone(offset)

    return dt.replace(tzinfo=timezone.utc).astimezone(tz)

# Example:
# >>> from datetime import UTC
# >>> dt = datetime.now(UTC)

# >>> dt_to_tz(dt, "UTC-03:00")
# >>> datetime.datetime(2025, 9, 2, 12, 48, 52, 491090, tzinfo=datetime.timezone(datetime.timedelta(days=-1, seconds=75600)))

# >>> dt_to_tz(dt, "UTC-05:00")
# >>> datetime.datetime(2025, 9, 2, 10, 48, 52, 491090, tzinfo=datetime.timezone(datetime.timedelta(days=-1, seconds=68400)))
```