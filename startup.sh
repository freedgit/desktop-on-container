#!/usr/bin/env bash

for i in rsa ecdsa ed22519; do
   /usr/libexec/openssh/sshd-keygen $i
done

groupadd -g ${THE_GID} ${THE_USERNAME}

adduser -u ${THE_UID} -g ${THE_GID} ${THE_USERNAME}

# adding the_username as an admin
usermod -a -G wheel ${THE_USERNAME}

# adding this user in sudoers
echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/${THE_USERNAME}_additions

# ssh needs to be started with full path
/usr/sbin/sshd &

# other daemons can start right now on behalf of root
# /usr/sbin/crond &
# /bin/node_exporter &

sudo -u ${THE_USERNAME} bash ${THE_STARTUP_SCRIPT}
