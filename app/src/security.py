from passlib.context import CryptContext

# Use bcrypt_sha256 to avoid bcrypt's 72-byte input limit
# Also disable truncate_error to prevent ValueError on edge cases.
pwd_context = CryptContext(
    schemes=["bcrypt_sha256"],
    deprecated="auto",
    bcrypt__truncate_error=False,
)


def hash_password(password: str) -> str:
    return pwd_context.hash(password)


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)
