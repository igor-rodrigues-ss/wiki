### Custom Sortable ID

- Readable and efficient for database indexing

```python
# pip install base36

import time
import base36
import base64
import secrets


def sortable_id(length: int = 6) -> str:
    ts_str = base36.dumps(int(time.time() * 1_000)).upper()
    
    rand_bytes = secrets.token_bytes(length)
    rand_str = base64.b32encode(rand_bytes).decode('utf-8').rstrip('=').upper()

    return ts_str + rand_str[:length]


# Example
# >>> sortable_id()
# >>> MF2POE04XOWH53
```

### Entropy

A measure to show the the collision probability based on birthday paradoxal.