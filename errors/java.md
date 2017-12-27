
activemq

In ubuntu 14.0.4 root cause of the problem is

INFO: Loading '/etc/default/activemq' ERROR: Configuration variable JAVA_HOME or JAVACMD is not defined correctly. (JAVA_HOME='', JAVACMD='java')

Even if you define JAVA_HOME in /etc/environment, active MQ reads only from either of the below locations where ever if finds the file first.

/etc/default/activemq
$HOME/.activemqrc
$INSTALLDIR/apache-activemq-/bin/env
So I recommend defining JAVA_HOME in /etc/default/activemq (which is copied from $INSTALLDIR/apache-activemq-/bin/env)
