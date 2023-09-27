# Password Manager

I know. There are like a million great password managers out there.

The problem is that you either have to trust the password manager or install something.

At any rate, I spent a little bit of time coming up with a lightweight password management scheme
that is relatively cross-platform without needing to install special stuff.

The crux of the scheme is a single openssl command,
but I wrapped it up with a nice little script in [open-vault.sh](./open-vault.sh).

## Usage

```sh
source open-vault.sh
# get password
decrypt_from_vault password-id
# save password
encrypt_to_vault password-id
```
