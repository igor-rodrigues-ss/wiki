### Simetric Encryption

- Python example for simetric based AES encryption.

```python
import json

import base64 as b64

from typing import TypedDict
from Crypto.Cipher import AES


AES_KEY = "EgsTyaim7HDb1mK3+V2pqA64cfK1xgO87fAqxiBp8tI="
# AES_KEY generation
# from Crypto.Random import get_random_bytes; import base64 as b64; print(b64.b64encode(get_random_bytes(32)).decode("utf-8"))


class Encryption(TypedDict):
    nonce: bytes
    ciphered_text: bytes


def _b64_enc(value: bytes) -> str:
    return b64.b64encode(value).decode("utf-8")


def _b64_dec(value: str) -> bytes:
    return b64.b64decode(value)


def _to_b64(nonce: bytes, ciphered_text: bytes) -> str:
    enc_info: dict = {"nonce": _b64_enc(nonce), "ciphered_text": _b64_enc(ciphered_text)}
    enc_info_str = json.dumps(enc_info).encode()

    return _b64_enc(enc_info_str)


def encrypt(data: str) -> str:
    key = _b64_dec(AES_KEY)

    cipher = AES.new(key, AES.MODE_GCM)
    ciphered_text = cipher.encrypt(data.encode())

    return _to_b64(cipher.nonce, ciphered_text)


def _from_b64(encryption: str) -> Encryption:
    result = json.loads(_b64_dec(encryption))

    return {"nonce": _b64_dec(result["nonce"]), "ciphered_text": _b64_dec(result["ciphered_text"])}


def decrypt(encryption: str) -> str:
    key = _b64_dec(AES_KEY)

    encrypted = _from_b64(encryption)

    cipher = AES.new(key, AES.MODE_GCM, nonce=encrypted["nonce"])

    data = cipher.decrypt(encrypted["ciphered_text"])

    return data.decode()
```