# Optimistic Locking

Optimistic locking assumes that the concurrent updates are rare to happen.

This kind of locking is more suitable for high concurrency scenarios where conflicts are unlikely.

### How it works

- 1. Create a field ```version``` in the database table.
- 2. Before updating the record, read the ```version``` field.
- 3. Do the record update .
- 4. After updating, read the ```version``` field again and check if ```version``` number __matches__ with first reading.
   - If the version number matches with first reading, continue the operation normally.
   - if not, do a rollback or other treatment.


# Pessimistic Locking

Pessimistic locking assumes that the lock is common. This kind of locking locks a database row, preventing the other transaction to update this row, when it is locked.

The Pessimistic lock is more suitable for critical operations but is worse for concurrency.

_If one person is updating, nobody else can't touch._

### How it works

```sql
BEGIN;

SELECT balance FROM accounts WHERE id = 1 FOR UPDATE; -- Lock now

UPDATE accounts
SET balance = balance - 50
WHERE id = 1;

COMMIT;
```

- ```FOR UPDATE``` keyword __lock the row__ where ```id = 1``` and only this transaction can update this row.

- The lock is released when the transaction is committed or rollbacked.

- If another transaction tries to update or delete the locked row, the transaction will __wait__ or __fail__ (depending on configuration). The default behaviour is __wait__.

## Comparison

| Pessimistic Lock | Optimistic lock |
|------|-----|
| Concurrent updates are rare | Concurrent updates are common |
| For non critical scenarios | For critical scenarios |
| High throughput | Low throughput |
| Create a field version and check the version | Lock the database row with ```FOR UPDATE``` |
