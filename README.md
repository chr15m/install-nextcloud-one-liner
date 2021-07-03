<p align="center">
  <img src="logo.svg?sanitize=true" alt="nextcloud installer logo"><br/>
</p>

With this script you can install Nextcloud on an Ubuntu VPS with one line.

This is not an official script from Nextcloud.
I made it for my own use and thought it might be useful for other people

[Install](#install) | [Requirements](#requirements) | [Instructions](#instructions)

# Install

```
wget https://raw.githubusercontent.com/chr15m/nextcloud-installer-script/main/install-nextcloud.sh
chmod 755 install-nextcloud.sh
./install-nextcloud.sh HOSTNAME USERNAME PASSWORD
```

To get help just run the script with no parameters:

```
./install-nextcloud.sh
```

# Requirements

You will need:

 * An Ubuntu Linux VPS.
 * Root access to the VPS.
 * A domain name (You can use sslip.io if you don't have one).

Information you'll need to supply:

 * An email address (for the SSL certificate).
 * The username you want to use for the first user.
 * The first user's password.

# Instructions

For the final steps you will need to answer four questions.

```
Command may disrupt existing ssh connections. Proceed with operation (y|n)?
```

Answer `y`.

```
Have you met these requirements? (y/n)
```

Answer `y`.

```
Please enter an email address (for urgent notices or key recovery):
```

Type your email address.

```
Please enter your domain name(s) (space-separated):
```

Type your domain name again, the same domain name you entered on the command line to start the installation.
