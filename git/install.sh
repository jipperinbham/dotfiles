#!/bin/sh

set -eo pipefail

EXISTING_KEY=$(gpg --list-secret-keys --keyid-format=long | grep "8F7309351DC7C6D5")
if [[ $EXISTING_KEY ]]; then
  echo "gpg key already imported"
  exit 0
fi

echo "importing gpg key"

echo "Enter 1Password Secret Key: "

read onepasswordsecret

eval $(op signin https://my.1password.com jonphill9@gmail.com ${onepasswordsecret})

op get document "gpg-public.key" --output /tmp/gpg-public.key

gpg --import /tmp/gpg-public.key

rm /tmp/gpg-public.key

op get document "gpg-private.key" --output /tmp/gpg-private.key

gpg --import /tmp/gpg-private.key

rm /tmp/gpg-private.key

export GPG_TTY=$(tty)
echo "test" | gpg --clearsign

op signout --forget
