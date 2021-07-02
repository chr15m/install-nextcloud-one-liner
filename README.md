With this script you can install Nextcloud on an Ubuntu VPS.

You will need the following:

 * An Ubuntu Linux VPS.
 * A domain name (You can use sslip.io if you don't have one).
 * An email address (for the SSL certificate).
 * The username you want to use for the first user.
 * The first user's password.

# Install

```

./install-nextcloud.sh HOSTNAME USERNAME PASSWORD
```

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

Type your domain name again, the same domain name you 
