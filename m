Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A1C331B2D3B
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Apr 2020 18:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587488102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z56Q5p87A1VR73prmcqvzrqGFS7Uf8i7c391JlPam3g=;
	b=e1mCfsOTQDBDQ6OpDL/sKy1Z8jHJVkvvPxPXhuqDmkHZ3AT8HoNQwtwR8nXS+kZPpHtxko
	hH3gm+8SRpk2UtCPd991YKEVMFWPFeiHdaj+SAdFQgowzqunhs9uGPd7/wvFMGCFDXpaAC
	cD2/jKH31F/efUtiNgqzntOQk7RE0o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Bh3w0y_oNTqXr8E4OuhL4w-1; Tue, 21 Apr 2020 12:55:00 -0400
X-MC-Unique: Bh3w0y_oNTqXr8E4OuhL4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 035C310CE78D;
	Tue, 21 Apr 2020 16:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFD151001DD8;
	Tue, 21 Apr 2020 16:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20AB118089CE;
	Tue, 21 Apr 2020 16:54:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LGso3L018894 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 12:54:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28E1A202A943; Tue, 21 Apr 2020 16:54:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20AF12024517
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28DBB802071
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:54:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-428-PVg_uqYkPH2YTp1evvKw5Q-1;
	Tue, 21 Apr 2020 12:54:45 -0400
X-MC-Unique: PVg_uqYkPH2YTp1evvKw5Q-1
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
	[95.90.212.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E85B520724;
	Tue, 21 Apr 2020 16:54:43 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jQwAU-00CmDe-5X; Tue, 21 Apr 2020 18:54:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue, 21 Apr 2020 18:54:16 +0200
Message-Id: <fcabacabbcd3e8ab29d054949a793868122958ba.1587487612.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1587487612.git.mchehab+huawei@kernel.org>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LGso3L018894
X-loop: linux-cachefs@redhat.com
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [Linux-cachefs] [PATCH v2 05/29] docs: filesystems:
	caching/cachefiles.txt: convert to ReST
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add a SPDX header;
- Adjust document title;
- Mark literal blocks as such;
- Add table markups;
- Comment out text ToC for html/pdf output;
- Add lists markups;
- Add it to filesystems/caching/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{cachefiles.txt => cachefiles.rst}        | 139 ++++++++----------
 Documentation/filesystems/caching/index.rst   |   1 +
 MAINTAINERS                                   |   2 +-
 fs/cachefiles/Kconfig                         |   4 +-
 4 files changed, 65 insertions(+), 81 deletions(-)
 rename Documentation/filesystems/caching/{cachefiles.txt => cachefiles.rst} (90%)

diff --git a/Documentation/filesystems/caching/cachefiles.txt b/Documentation/filesystems/caching/cachefiles.rst
similarity index 90%
rename from Documentation/filesystems/caching/cachefiles.txt
rename to Documentation/filesystems/caching/cachefiles.rst
index 28aefcbb1442..65d3db476765 100644
--- a/Documentation/filesystems/caching/cachefiles.txt
+++ b/Documentation/filesystems/caching/cachefiles.rst
@@ -1,8 +1,10 @@
-	       ===============================================
-	       CacheFiles: CACHE ON ALREADY MOUNTED FILESYSTEM
-	       ===============================================
+.. SPDX-License-Identifier: GPL-2.0
 
-Contents:
+===============================================
+CacheFiles: CACHE ON ALREADY MOUNTED FILESYSTEM
+===============================================
+
+.. Contents:
 
  (*) Overview.
 
@@ -27,8 +29,8 @@ Contents:
  (*) Debugging.
 
 
-========
-OVERVIEW
+
+Overview
 ========
 
 CacheFiles is a caching backend that's meant to use as a cache a directory on
@@ -58,8 +60,8 @@ spare space and automatically contract when the set of data requires more
 space.
 
 
-============
-REQUIREMENTS
+
+Requirements
 ============
 
 The use of CacheFiles and its daemon requires the following features to be
@@ -79,84 +81,70 @@ It is strongly recommended that the "dir_index" option is enabled on Ext3
 filesystems being used as a cache.
 
 
-=============
-CONFIGURATION
+Configuration
 =============
 
 The cache is configured by a script in /etc/cachefilesd.conf.  These commands
 set up cache ready for use.  The following script commands are available:
 
- (*) brun <N>%
- (*) bcull <N>%
- (*) bstop <N>%
- (*) frun <N>%
- (*) fcull <N>%
- (*) fstop <N>%
-
+ brun <N>%, bcull <N>%, bstop <N>%, frun <N>%, fcull <N>%, fstop <N>%
 	Configure the culling limits.  Optional.  See the section on culling
 	The defaults are 7% (run), 5% (cull) and 1% (stop) respectively.
 
 	The commands beginning with a 'b' are file space (block) limits, those
 	beginning with an 'f' are file count limits.
 
- (*) dir <path>
-
+ dir <path>
 	Specify the directory containing the root of the cache.  Mandatory.
 
- (*) tag <name>
-
+ tag <name>
 	Specify a tag to FS-Cache to use in distinguishing multiple caches.
 	Optional.  The default is "CacheFiles".
 
- (*) debug <mask>
-
+ debug <mask>
 	Specify a numeric bitmask to control debugging in the kernel module.
 	Optional.  The default is zero (all off).  The following values can be
 	OR'd into the mask to collect various information:
 
+		==	=================================================
 		1	Turn on trace of function entry (_enter() macros)
 		2	Turn on trace of function exit (_leave() macros)
 		4	Turn on trace of internal debug points (_debug())
+		==	=================================================
 
-	This mask can also be set through sysfs, eg:
+	This mask can also be set through sysfs, eg::
 
 		echo 5 >/sys/modules/cachefiles/parameters/debug
 
 
-==================
-STARTING THE CACHE
+Starting the Cache
 ==================
 
 The cache is started by running the daemon.  The daemon opens the cache device,
 configures the cache and tells it to begin caching.  At that point the cache
 binds to fscache and the cache becomes live.
 
-The daemon is run as follows:
+The daemon is run as follows::
 
 	/sbin/cachefilesd [-d]* [-s] [-n] [-f <configfile>]
 
 The flags are:
 
- (*) -d
-
+ ``-d``
 	Increase the debugging level.  This can be specified multiple times and
 	is cumulative with itself.
 
- (*) -s
-
+ ``-s``
 	Send messages to stderr instead of syslog.
 
- (*) -n
-
+ ``-n``
 	Don't daemonise and go into background.
 
- (*) -f <configfile>
-
+ ``-f <configfile>``
 	Use an alternative configuration file rather than the default one.
 
 
-===============
-THINGS TO AVOID
+Things to Avoid
 ===============
 
 Do not mount other things within the cache as this will cause problems.  The
@@ -179,8 +167,7 @@ Do not chmod files in the cache.  The module creates things with minimal
 permissions to prevent random users being able to access them directly.
 
 
-=============
-CACHE CULLING
+Cache Culling
 =============
 
 The cache may need culling occasionally to make space.  This involves
@@ -192,27 +179,21 @@ Cache culling is done on the basis of the percentage of blocks and the
 percentage of files available in the underlying filesystem.  There are six
 "limits":
 
- (*) brun
- (*) frun
-
+ brun, frun
      If the amount of free space and the number of available files in the cache
      rises above both these limits, then culling is turned off.
 
- (*) bcull
- (*) fcull
-
+ bcull, fcull
      If the amount of available space or the number of available files in the
      cache falls below either of these limits, then culling is started.
 
- (*) bstop
- (*) fstop
-
+ bstop, fstop
      If the amount of available space or the number of available files in the
      cache falls below either of these limits, then no further allocation of
      disk space or files is permitted until culling has raised things above
      these limits again.
 
-These must be configured thusly:
+These must be configured thusly::
 
 	0 <= bstop < bcull < brun < 100
 	0 <= fstop < fcull < frun < 100
@@ -226,16 +207,14 @@ started as soon as space is made in the table.  Objects will be skipped if
 their atimes have changed or if the kernel module says it is still using them.
 
 
-===============
-CACHE STRUCTURE
+Cache Structure
 ===============
 
 The CacheFiles module will create two directories in the directory it was
 given:
 
- (*) cache/
-
- (*) graveyard/
+ * cache/
+ * graveyard/
 
 The active cache objects all reside in the first directory.  The CacheFiles
 kernel module moves any retired or culled objects that it can't simply unlink
@@ -261,10 +240,10 @@ If an object has children, then it will be represented as a directory.
 Immediately in the representative directory are a collection of directories
 named for hash values of the child object keys with an '@' prepended.  Into
 this directory, if possible, will be placed the representations of the child
-objects:
+objects::
 
-	INDEX     INDEX      INDEX                             DATA FILES
-	========= ========== ================================= ================
+	 /INDEX    /INDEX     /INDEX                            /DATA FILES
+	/=========/==========/=================================/================
 	cache/@4a/I03nfs/@30/Ji000000000000000--fHg8hi8400
 	cache/@4a/I03nfs/@30/Ji000000000000000--fHg8hi8400/@75/Es0g000w...DB1ry
 	cache/@4a/I03nfs/@30/Ji000000000000000--fHg8hi8400/@75/Es0g000w...N22ry
@@ -275,7 +254,7 @@ If the key is so long that it exceeds NAME_MAX with the decorations added on to
 it, then it will be cut into pieces, the first few of which will be used to
 make a nest of directories, and the last one of which will be the objects
 inside the last directory.  The names of the intermediate directories will have
-'+' prepended:
+'+' prepended::
 
 	J1223/@23/+xy...z/+kl...m/Epqr
 
@@ -288,11 +267,13 @@ To handle this, CacheFiles will use a suitably printable filename directly and
 "base-64" encode ones that aren't directly suitable.  The two versions of
 object filenames indicate the encoding:
 
+	===============	===============	===============
 	OBJECT TYPE	PRINTABLE	ENCODED
 	===============	===============	===============
 	Index		"I..."		"J..."
 	Data		"D..."		"E..."
 	Special		"S..."		"T..."
+	===============	===============	===============
 
 Intermediate directories are always "@" or "+" as appropriate.
 
@@ -307,8 +288,7 @@ Note that CacheFiles will erase from the cache any file it doesn't recognise or
 any file of an incorrect type (such as a FIFO file or a device file).
 
 
-==========================
-SECURITY MODEL AND SELINUX
+Security Model and SELinux
 ==========================
 
 CacheFiles is implemented to deal properly with the LSM security features of
@@ -331,26 +311,26 @@ When the CacheFiles module is asked to bind to its cache, it:
 
  (1) Finds the security label attached to the root cache directory and uses
      that as the security label with which it will create files.  By default,
-     this is:
+     this is::
 
 	cachefiles_var_t
 
  (2) Finds the security label of the process which issued the bind request
-     (presumed to be the cachefilesd daemon), which by default will be:
+     (presumed to be the cachefilesd daemon), which by default will be::
 
 	cachefilesd_t
 
      and asks LSM to supply a security ID as which it should act given the
-     daemon's label.  By default, this will be:
+     daemon's label.  By default, this will be::
 
 	cachefiles_kernel_t
 
      SELinux transitions the daemon's security ID to the module's security ID
-     based on a rule of this form in the policy.
+     based on a rule of this form in the policy::
 
 	type_transition <daemon's-ID> kernel_t : process <module's-ID>;
 
-     For instance:
+     For instance::
 
 	type_transition cachefilesd_t kernel_t : process cachefiles_kernel_t;
 
@@ -370,7 +350,7 @@ There are policy source files available in:
 
 	http://people.redhat.com/~dhowells/fscache/cachefilesd-0.8.tar.bz2
 
-and later versions.  In that tarball, see the files:
+and later versions.  In that tarball, see the files::
 
 	cachefilesd.te
 	cachefilesd.fc
@@ -379,7 +359,7 @@ and later versions.  In that tarball, see the files:
 They are built and installed directly by the RPM.
 
 If a non-RPM based system is being used, then copy the above files to their own
-directory and run:
+directory and run::
 
 	make -f /usr/share/selinux/devel/Makefile
 	semodule -i cachefilesd.pp
@@ -394,7 +374,7 @@ an auxiliary policy must be installed to label the alternate location of the
 cache.
 
 For instructions on how to add an auxiliary policy to enable the cache to be
-located elsewhere when SELinux is in enforcing mode, please see:
+located elsewhere when SELinux is in enforcing mode, please see::
 
 	/usr/share/doc/cachefilesd-*/move-cache.txt
 
@@ -402,8 +382,7 @@ When the cachefilesd rpm is installed; alternatively, the document can be found
 in the sources.
 
 
-==================
-A NOTE ON SECURITY
+A Note on Security
 ==================
 
 CacheFiles makes use of the split security in the task_struct.  It allocates
@@ -445,17 +424,18 @@ for CacheFiles to run in a context of a specific security label, or to create
 files and directories with another security label.
 
 
-=======================
-STATISTICAL INFORMATION
+Statistical Information
 =======================
 
-If FS-Cache is compiled with the following option enabled:
+If FS-Cache is compiled with the following option enabled::
 
 	CONFIG_CACHEFILES_HISTOGRAM=y
 
 then it will gather certain statistics and display them through a proc file.
 
- (*) /proc/fs/cachefiles/histogram
+ /proc/fs/cachefiles/histogram
+
+     ::
 
 	cat /proc/fs/cachefiles/histogram
 	JIFS  SECS  LOOKUPS   MKDIRS    CREATES
@@ -465,36 +445,39 @@ then it will gather certain statistics and display them through a proc file.
      between 0 jiffies and HZ-1 jiffies a variety of tasks took to run.  The
      columns are as follows:
 
+	=======		=======================================================
 	COLUMN		TIME MEASUREMENT
 	=======		=======================================================
 	LOOKUPS		Length of time to perform a lookup on the backing fs
 	MKDIRS		Length of time to perform a mkdir on the backing fs
 	CREATES		Length of time to perform a create on the backing fs
+	=======		=======================================================
 
      Each row shows the number of events that took a particular range of times.
      Each step is 1 jiffy in size.  The JIFS column indicates the particular
      jiffy range covered, and the SECS field the equivalent number of seconds.
 
 
-=========
-DEBUGGING
+Debugging
 =========
 
 If CONFIG_CACHEFILES_DEBUG is enabled, the CacheFiles facility can have runtime
-debugging enabled by adjusting the value in:
+debugging enabled by adjusting the value in::
 
 	/sys/module/cachefiles/parameters/debug
 
 This is a bitmask of debugging streams to enable:
 
+	=======	=======	===============================	=======================
 	BIT	VALUE	STREAM				POINT
 	=======	=======	===============================	=======================
 	0	1	General				Function entry trace
 	1	2					Function exit trace
 	2	4					General
+	=======	=======	===============================	=======================
 
 The appropriate set of values should be OR'd together and the result written to
-the control file.  For example:
+the control file.  For example::
 
 	echo $((1|4|8)) >/sys/module/cachefiles/parameters/debug
 
diff --git a/Documentation/filesystems/caching/index.rst b/Documentation/filesystems/caching/index.rst
index 75492b7c8ea0..a2cf35f89e28 100644
--- a/Documentation/filesystems/caching/index.rst
+++ b/Documentation/filesystems/caching/index.rst
@@ -8,5 +8,6 @@ Filesystem Caching
 
    fscache
    object
+   cachefiles
    netfs-api
    operations
diff --git a/MAINTAINERS b/MAINTAINERS
index ecf38ddd8962..42e2c8ae22b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3732,7 +3732,7 @@ CACHEFILES: FS-CACHE BACKEND FOR CACHING ON MOUNTED FILESYSTEMS
 M:	David Howells <dhowells@redhat.com>
 L:	linux-cachefs@redhat.com (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/filesystems/caching/cachefiles.txt
+F:	Documentation/filesystems/caching/cachefiles.rst
 F:	fs/cachefiles/
 
 CADENCE MIPI-CSI2 BRIDGES
diff --git a/fs/cachefiles/Kconfig b/fs/cachefiles/Kconfig
index ae559ed5b3b3..ff9ca55a9ae9 100644
--- a/fs/cachefiles/Kconfig
+++ b/fs/cachefiles/Kconfig
@@ -8,7 +8,7 @@ config CACHEFILES
 	  filesystems - primarily networking filesystems - thus allowing fast
 	  local disk to enhance the speed of slower devices.
 
-	  See Documentation/filesystems/caching/cachefiles.txt for more
+	  See Documentation/filesystems/caching/cachefiles.rst for more
 	  information.
 
 config CACHEFILES_DEBUG
@@ -36,5 +36,5 @@ config CACHEFILES_HISTOGRAM
 	  bouncing between CPUs.  On the other hand, the histogram may be
 	  useful for debugging purposes.  Saying 'N' here is recommended.
 
-	  See Documentation/filesystems/caching/cachefiles.txt for more
+	  See Documentation/filesystems/caching/cachefiles.rst for more
 	  information.
-- 
2.25.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

