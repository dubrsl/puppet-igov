class yum::repo::igov (
	$baseurl = "https://nexus-new.igov.org.ua/nexus/content/groups/public",
) {
	yum::managed_yumrepo { 'igov':
		descr		=> 'iGov repo',
	        baseurl		=> $baseurl,
		enabled		=> 1,
		gpgcheck	=> 0,
		sslverify	=> false,
		priority	=> 1,
	}
}
