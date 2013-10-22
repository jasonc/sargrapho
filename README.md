# SarGraphO

## Summary

SarGraphO collects sar data, graphs it, and generates web pages to display the graphs.

## Installation

By default SarGraphO installs in /opt/sargrapho and is configured to output HTML in /var/www/html/sargrapho.

One line default install:

	curl -s https://raw.github.com/jasonc/sargrapho/master/bin/install.sh | bash

The defaults can be overridden by environmental variables.

	curl -s https://raw.github.com/jasonc/sargrapho/master/bin/install.sh | PREFIX=/home/pat/sargrapho HTMLDIR=/home/pat/www bash

## Usage and Post Installation Configuration

### Create a Hosts File

Graphs are generated for the servers listed in the hosts file.  The default location is /opt/sargrapho/etc/hosts.  List one host per line.

	$ cat /opt/sargrapho/etc/hosts
	server1
	server2
	deathstar
	thor

### Configure SSH

Sar data is retrieved via SSH.  Ensure that the account executing SarGraphO can SSH into the servers listed in the hosts file without using a password.  (Use SSH keys.)  This account also needs write permissions to the HTML output directory.  The default HTML output directory is /var/www/html/sargrapho.

### Optional Configuration

Edit /opt/sargrapho/etc/sargrapho.conf to change the location of the hosts file, the HTML output directory, and the size of the graphs.

### Create a Cron Job

Create a cron job to run SarGraphO once per day.

	(crontab -l ; echo '30 0 * * * /opt/sargrapho/bin/sargrapho') | crontab -

### Configure the Web Server

To create an alias for http://WEBSERVER/sargrapho that serves documents from /var/www/html/sargrapho, link to the included Apache configuration file.  If you installed SarGraphO as root and /etc/httpd/conf.d existed, this has already been completed.

	ln -s /opt/sargrapho/etc/sargrapho-httpd.conf /etc/httpd/conf.d/

### Dependencies

SarGraphO uses [RRDTool](http://oss.oetiker.ch/rrdtool/) to generate graphs.

	yum install -y rrdtool

## Limitations

SarGraphO works with the RedHat family of Linux distributions and has been tested on RHEL 5 and RHEL 6.  A few minor changes would allow it to work on Debian/Ubuntu.

##  Background

SarGraphO was created to graph historical performance data for a set of Linux servers and display those graphs via a web interface without installing agents on the clients.  There were existing projects that would create graphs, but only for one server at a time or they required a desktop client.  Other projects would create and display graphs via a web interface, but they required agents to be installed on the clients.  There are many good options if you can or are willing to install agents on the clients.

## Other Solutions and Related Projects

### Agentless Options

If you cannot or do not want to install agents on the clients look at:

* [isag](http://www.volny.cz/linux_monitor/isag/index.html)
* [ksar](http://sourceforge.net/projects/ksar/)
* [sar2rrd](http://www.trickytools.com/php/sar2rrd.php)

### Options Requiring Agents

If you can install agents on the clients look at:

* [cacti](http://www.cacti.net/)
* [collectd](http://collectd.org/)
* [ganglia](http://ganglia.sourceforge.net/)
* [munin](http://munin-monitoring.org/)
* [statsd](https://github.com/etsy/statsd/)
* [xymon](http://xymon.sourceforge.net/)

## Contributing

Pull requests are welcomed and appreciated.

GitHub: https://github.com/jasonc/sargrapho
