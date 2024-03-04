#!/bin/bash
# Add the 'nfl' user with no password (change as needed)
adduser nfl --disabled-password --gecos ""
echo 'nfl:$6$9vQKwUaA9qJ1XzZs$Neu48INiOfYDvEAmlog34hh4ZosYUwvQV/ukvSKZ1vo1.Rdz.DZPYEq19aL.CmyQQA8AmSHxn/H1aeRy.KpKC0' | chpasswd -e
# Give 'nfl' user password-less sudo privileges
echo 'nfl ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/nfl
# Make sure the file is secure
chmod 0440 /etc/sudoers.d/nfl
# Add ssh pubkey
mkdir -p /home/nfl/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDonbKPOS+9Mp2wg2NqJHuCJrZtt2xUPrisku5sm1Z6TJn4elj+giV357DgEZPc1+V0v+kMyBx0wqR62L7wT97d9grzOyfZH8vOWpWJKEYIJs+yjJXYsXFRx0OrxOhFf75bDAazXMVSe0ypIDfq9F1USOvoDv0SMeFZNFXKtntvEmwi6hG/oQ+cn35cr+H1bwjBYXjy9LI5ltitNUOK6ViI3bv+kIHqb4J+rThx60EGSZGHb6XsxULuzookMdPUCt+aZRIMj4h2pEgPGTlMw+4lGlKqrFB0dlB9N10hfRT+F/+/lTDVjRsmKRSEnD+wZS7tXj5NDy9mPs8JW/9gy0zp nowfaln@yahoo.com' >> /home/nfl/.ssh/authorized_keys