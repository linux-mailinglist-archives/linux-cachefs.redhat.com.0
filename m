Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBHZSCWAMGQEXWWZRAY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E881B749
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:21 +0100 (CET)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67f7b69433dsf12393016d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165060; cv=pass;
        d=google.com; s=arc-20160816;
        b=k4e85ofiuAIHLERqZAOEp8xxJPmXebTzW8Km3EGZlm8wENs3Kw6UTOqoKCN1i9pIFT
         rl6baEYZ4RDP0SvG7wjoyTWDB1jCfqdbzY1wL944vFsKxskCaXDgBqRDBnHFz9VAXZqD
         xQCTLMh0hA6sFX7Tm9+5R7hTlm8g3gnraeiNdd0CL2OurtEIzPQZnz8pZLDCAqoDJYJD
         2XZcAlOMCXY5ERq6lbKXyQtzBFpq0bRr/23GvizbWOLcZwTeves965XhB05x5Wm+FQhO
         yZY9owDajgjDBnJisGcnGZ6BZX1h3FjrAgRS5xWR14UukA7gt7SUr2RyXfPdkh7+5ixz
         cdTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=T34gn1BFpCJYQo6pH7w5oXt0PXGzT0Lbgpa4wsiJStM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=XbW84OwUCSFZWjuAuUGxkvd8lR4d1iE7PCWkLMBNM1g9qr8K/y773lActeNjfhqset
         /o73Rq0OOfenhsb93xGTGlY78E8zd3IKijooPE/XjmBz45A9Z5ZsotHW0oz4sjj2dj01
         UQCnE3WLXgY2MYBZgp4VIx18H92LEeYOr+y8hNmafd/RC1XKvd6GJxm7G5yOH28OA//e
         HViH5NJNN4vm1TJuAkZWZN9drj4xXrWHJLsd1wScrLUtQFM+2EuD9O1AJ4rQPD6M3yl6
         CibGut09lhY0fNGunngdhf1oz+8oBDCIbm13mCJHtUsteakA/4BSst87zsw3zVUtxgWD
         Z6qg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165060; x=1703769860;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T34gn1BFpCJYQo6pH7w5oXt0PXGzT0Lbgpa4wsiJStM=;
        b=DZeL252J2ukw43iMTt542E8mXz17531y3rZ9tmHbr/4VpnRwnl36v0clpJYQLctxk+
         HTo3GPQNJmxR3KYjWdKZ0oXOXDw4mnr7qex9ZHKIVMjCJO+kATQUfxs8a0vBJGiJFZJx
         j1ouAE6pLU46By6APzGnnr2YNLV5vEoLGk0nsvitWhTbvfj2QUxaZ/Xg6l/bv+PmMs3z
         VBGFOr5aOzE6MymtWKr9HGkgfdrI9vegC1r6+v4oqdhf7SkwSqRh92vqp2HrpF+6k4Qe
         /A+BCuHL5qxQ87X1FRZqNHHjXVv5dvi+Ywle7Qn3b27yWcijzVHeDw7WXjJhZdsRkpzp
         C+IA==
X-Gm-Message-State: AOJu0Yy+ywJIxHKjlxkMQDNW5RmCGhdUAksLSGACizwBEJIIDOh6XsK3
	VxblFasO5NgbBq3m7mV6VCP90Q==
X-Google-Smtp-Source: AGHT+IGICbkCD5sYHXby3Um+HCu18tYeuWK1K/NlMR3/eeUgQ5y/pxApNq993qXG4BfluTKbNJfL4A==
X-Received: by 2002:a05:6214:b6b:b0:67f:5b62:297e with SMTP id ey11-20020a0562140b6b00b0067f5b62297emr6931542qvb.62.1703165060166;
        Thu, 21 Dec 2023 05:24:20 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1bc9:b0:67a:b34a:6626 with SMTP id
 m9-20020a0562141bc900b0067ab34a6626ls1682227qvc.0.-pod-prod-05-us; Thu, 21
 Dec 2023 05:24:19 -0800 (PST)
X-Received: by 2002:ad4:4ead:0:b0:67f:288c:81d2 with SMTP id ed13-20020ad44ead000000b0067f288c81d2mr16314529qvb.34.1703165059610;
        Thu, 21 Dec 2023 05:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165059; cv=none;
        d=google.com; s=arc-20160816;
        b=p9N3SDf+ErdUBS5uKfb4GZ3xrJNbAWHrbXdu3Xq8ZnYtsZ9IdG0O289h90WkdI5RFK
         W+RMwXDECcLeCqqNQkZ0Syd00IQfUFt5jQzY25UB/H/a4n2FkK58+g9KyPbhfzlxG/iJ
         r5RmbO9lVrAyrYOB89O3uuvjNtp2dLbT7fBh/eUyw07VNBE/fEJz6BaZ6+xEs+mL0Wv3
         DkUalAX2ZQ11rvAyXpnvezXIwSsEnv4hZUblb+udB/dhA53jiKx0F6z1zMyEPjb619Oa
         zObeSgtPqj8u6asNs6zOS6leRXVdKcIdcWAR2B9O3qx6HZSbYSnyhJ3BRwziXsRCygdh
         ZRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=wBzpmC0rJxDkvfFcXCiCIB5MfO/JtYwi4o+qNt5d+DE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=riqSsIhKuunmyAUkTOCNFIvfAxVLLLmQAk8daOQWvdOXgVSOCrgrtSZPiJN8/2x6v4
         v5FP8fXhBgflqRfEKTNdEmoQhJy5loFolAS2pGrLbm/X+NierDIjA52JZVLdT0dUQ+IX
         fNy//n3WYSKZxFcbPycCQ6/TqMas5J2rFmjL+DIAjFrRwKLvTrVfRimxnDF3U3UKUW8L
         phphRuepC4KP7IlYJpSBqOJU2dnblyEoOT8EvEF4mIne6AisUqKTO1Rqflqw9VUTvjxL
         4P9SiLFIWml+tZCjeoT6VnqsSvFeHhl0kstV18srZE8s+YgcZRiLfEZ+KSxtv/LyJy5M
         VJ9A==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id q12-20020a0c9a4c000000b0067a49f7a0d5si2042344qvd.549.2023.12.21.05.24.19
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:19 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-fqfNzoKsPQC7Q5SIxfnZqQ-1; Thu, 21 Dec 2023 08:24:17 -0500
X-MC-Unique: fqfNzoKsPQC7Q5SIxfnZqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82CBF85CEA3
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7C27C112132A; Thu, 21 Dec 2023 13:24:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23DBD1121313;
	Thu, 21 Dec 2023 13:24:14 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/40] netfs, fscache: Move fs/fscache/* into fs/netfs/
Date: Thu, 21 Dec 2023 13:22:58 +0000
Message-ID: <20231221132400.1601991-4-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

There's a problem with dependencies between netfslib and fscache as each
wants to access some functions of the other.  Deal with this by moving
fs/fscache/* into fs/netfs/ and renaming those files to begin with
"fscache-".

For the moment, the moved files are changed as little as possible and an
fscache module is still built.  A subsequent patch will integrate them.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---

Notes:
    Changes
    =======
    ver #5)
     - Adjust MAINTAINERS file.

 MAINTAINERS                                   | 21 ++++++----
 fs/Kconfig                                    |  1 -
 fs/Makefile                                   |  1 -
 fs/fscache/Kconfig                            | 40 -------------------
 fs/fscache/Makefile                           | 16 --------
 fs/netfs/Kconfig                              | 39 ++++++++++++++++++
 fs/netfs/Makefile                             | 14 ++++++-
 fs/{fscache/cache.c => netfs/fscache_cache.c} |  0
 .../cookie.c => netfs/fscache_cookie.c}       |  0
 .../internal.h => netfs/fscache_internal.h}   |  0
 fs/{fscache/io.c => netfs/fscache_io.c}       |  0
 fs/{fscache/main.c => netfs/fscache_main.c}   |  0
 fs/{fscache/proc.c => netfs/fscache_proc.c}   |  0
 fs/{fscache/stats.c => netfs/fscache_stats.c} |  0
 .../volume.c => netfs/fscache_volume.c}       |  0
 fs/netfs/internal.h                           |  5 +++
 fs/netfs/main.c                               |  5 ++-
 17 files changed, 73 insertions(+), 69 deletions(-)
 delete mode 100644 fs/fscache/Kconfig
 delete mode 100644 fs/fscache/Makefile
 rename fs/{fscache/cache.c => netfs/fscache_cache.c} (100%)
 rename fs/{fscache/cookie.c => netfs/fscache_cookie.c} (100%)
 rename fs/{fscache/internal.h => netfs/fscache_internal.h} (100%)
 rename fs/{fscache/io.c => netfs/fscache_io.c} (100%)
 rename fs/{fscache/main.c => netfs/fscache_main.c} (100%)
 rename fs/{fscache/proc.c => netfs/fscache_proc.c} (100%)
 rename fs/{fscache/stats.c => netfs/fscache_stats.c} (100%)
 rename fs/{fscache/volume.c => netfs/fscache_volume.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9104430e148e..b38e1723b505 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8135,6 +8135,19 @@ S:	Supported
 F:	fs/iomap/
 F:	include/linux/iomap.h
 
+FILESYSTEMS [NETFS LIBRARY]
+M:	David Howells <dhowells@redhat.com>
+L:	linux-cachefs@redhat.com (moderated for non-subscribers)
+L:	linux-fsdevel@vger.kernel.org
+S:	Supported
+F:	Documentation/filesystems/caching/
+F:	Documentation/filesystems/netfs_library.rst
+F:	fs/netfs/
+F:	include/linux/fscache*.h
+F:	include/linux/netfs.h
+F:	include/trace/events/fscache.h
+F:	include/trace/events/netfs.h
+
 FINTEK F75375S HARDWARE MONITOR AND FAN CONTROLLER DRIVER
 M:	Riku Voipio <riku.voipio@iki.fi>
 L:	linux-hwmon@vger.kernel.org
@@ -8569,14 +8582,6 @@ F:	Documentation/power/freezing-of-tasks.rst
 F:	include/linux/freezer.h
 F:	kernel/freezer.c
 
-FS-CACHE: LOCAL CACHING FOR NETWORK FILESYSTEMS
-M:	David Howells <dhowells@redhat.com>
-L:	linux-cachefs@redhat.com (moderated for non-subscribers)
-S:	Supported
-F:	Documentation/filesystems/caching/
-F:	fs/fscache/
-F:	include/linux/fscache*.h
-
 FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION SUPPORT
 M:	Eric Biggers <ebiggers@kernel.org>
 M:	Theodore Y. Ts'o <tytso@mit.edu>
diff --git a/fs/Kconfig b/fs/Kconfig
index 42837617a55b..c935c341eb6e 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -140,7 +140,6 @@ source "fs/overlayfs/Kconfig"
 menu "Caches"
 
 source "fs/netfs/Kconfig"
-source "fs/fscache/Kconfig"
 source "fs/cachefiles/Kconfig"
 
 endmenu
diff --git a/fs/Makefile b/fs/Makefile
index 75522f88e763..af7632368e98 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -60,7 +60,6 @@ obj-$(CONFIG_DLM)		+= dlm/
  
 # Do not add any filesystems before this line
 obj-$(CONFIG_NETFS_SUPPORT)	+= netfs/
-obj-$(CONFIG_FSCACHE)		+= fscache/
 obj-$(CONFIG_REISERFS_FS)	+= reiserfs/
 obj-$(CONFIG_EXT4_FS)		+= ext4/
 # We place ext4 before ext2 so that clean ext3 root fs's do NOT mount using the
diff --git a/fs/fscache/Kconfig b/fs/fscache/Kconfig
deleted file mode 100644
index b313a978ae0a..000000000000
--- a/fs/fscache/Kconfig
+++ /dev/null
@@ -1,40 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-config FSCACHE
-	tristate "General filesystem local caching manager"
-	select NETFS_SUPPORT
-	help
-	  This option enables a generic filesystem caching manager that can be
-	  used by various network and other filesystems to cache data locally.
-	  Different sorts of caches can be plugged in, depending on the
-	  resources available.
-
-	  See Documentation/filesystems/caching/fscache.rst for more information.
-
-config FSCACHE_STATS
-	bool "Gather statistical information on local caching"
-	depends on FSCACHE && PROC_FS
-	select NETFS_STATS
-	help
-	  This option causes statistical information to be gathered on local
-	  caching and exported through file:
-
-		/proc/fs/fscache/stats
-
-	  The gathering of statistics adds a certain amount of overhead to
-	  execution as there are a quite a few stats gathered, and on a
-	  multi-CPU system these may be on cachelines that keep bouncing
-	  between CPUs.  On the other hand, the stats are very useful for
-	  debugging purposes.  Saying 'Y' here is recommended.
-
-	  See Documentation/filesystems/caching/fscache.rst for more information.
-
-config FSCACHE_DEBUG
-	bool "Debug FS-Cache"
-	depends on FSCACHE
-	help
-	  This permits debugging to be dynamically enabled in the local caching
-	  management module.  If this is set, the debugging output may be
-	  enabled by setting bits in /sys/modules/fscache/parameter/debug.
-
-	  See Documentation/filesystems/caching/fscache.rst for more information.
diff --git a/fs/fscache/Makefile b/fs/fscache/Makefile
deleted file mode 100644
index afb090ea16c4..000000000000
--- a/fs/fscache/Makefile
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for general filesystem caching code
-#
-
-fscache-y := \
-	cache.o \
-	cookie.o \
-	io.o \
-	main.o \
-	volume.o
-
-fscache-$(CONFIG_PROC_FS) += proc.o
-fscache-$(CONFIG_FSCACHE_STATS) += stats.o
-
-obj-$(CONFIG_FSCACHE) := fscache.o
diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
index b4db21022cb4..b4378688357c 100644
--- a/fs/netfs/Kconfig
+++ b/fs/netfs/Kconfig
@@ -21,3 +21,42 @@ config NETFS_STATS
 	  multi-CPU system these may be on cachelines that keep bouncing
 	  between CPUs.  On the other hand, the stats are very useful for
 	  debugging purposes.  Saying 'Y' here is recommended.
+
+config FSCACHE
+	tristate "General filesystem local caching manager"
+	select NETFS_SUPPORT
+	help
+	  This option enables a generic filesystem caching manager that can be
+	  used by various network and other filesystems to cache data locally.
+	  Different sorts of caches can be plugged in, depending on the
+	  resources available.
+
+	  See Documentation/filesystems/caching/fscache.rst for more information.
+
+config FSCACHE_STATS
+	bool "Gather statistical information on local caching"
+	depends on FSCACHE && PROC_FS
+	select NETFS_STATS
+	help
+	  This option causes statistical information to be gathered on local
+	  caching and exported through file:
+
+		/proc/fs/fscache/stats
+
+	  The gathering of statistics adds a certain amount of overhead to
+	  execution as there are a quite a few stats gathered, and on a
+	  multi-CPU system these may be on cachelines that keep bouncing
+	  between CPUs.  On the other hand, the stats are very useful for
+	  debugging purposes.  Saying 'Y' here is recommended.
+
+	  See Documentation/filesystems/caching/fscache.rst for more information.
+
+config FSCACHE_DEBUG
+	bool "Debug FS-Cache"
+	depends on FSCACHE
+	help
+	  This permits debugging to be dynamically enabled in the local caching
+	  management module.  If this is set, the debugging output may be
+	  enabled by setting bits in /sys/modules/fscache/parameter/debug.
+
+	  See Documentation/filesystems/caching/fscache.rst for more information.
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 386d6fb92793..bbb2b824bd5e 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 
+fscache-y := \
+	fscache_cache.o \
+	fscache_cookie.o \
+	fscache_io.o \
+	fscache_main.o \
+	fscache_volume.o
+
+fscache-$(CONFIG_PROC_FS) += fscache_proc.o
+fscache-$(CONFIG_FSCACHE_STATS) += fscache_stats.o
+
+obj-$(CONFIG_FSCACHE) := fscache.o
+
 netfs-y := \
 	buffered_read.o \
 	io.o \
@@ -9,4 +21,4 @@ netfs-y := \
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
 
-obj-$(CONFIG_NETFS_SUPPORT) := netfs.o
+obj-$(CONFIG_NETFS_SUPPORT) += netfs.o
diff --git a/fs/fscache/cache.c b/fs/netfs/fscache_cache.c
similarity index 100%
rename from fs/fscache/cache.c
rename to fs/netfs/fscache_cache.c
diff --git a/fs/fscache/cookie.c b/fs/netfs/fscache_cookie.c
similarity index 100%
rename from fs/fscache/cookie.c
rename to fs/netfs/fscache_cookie.c
diff --git a/fs/fscache/internal.h b/fs/netfs/fscache_internal.h
similarity index 100%
rename from fs/fscache/internal.h
rename to fs/netfs/fscache_internal.h
diff --git a/fs/fscache/io.c b/fs/netfs/fscache_io.c
similarity index 100%
rename from fs/fscache/io.c
rename to fs/netfs/fscache_io.c
diff --git a/fs/fscache/main.c b/fs/netfs/fscache_main.c
similarity index 100%
rename from fs/fscache/main.c
rename to fs/netfs/fscache_main.c
diff --git a/fs/fscache/proc.c b/fs/netfs/fscache_proc.c
similarity index 100%
rename from fs/fscache/proc.c
rename to fs/netfs/fscache_proc.c
diff --git a/fs/fscache/stats.c b/fs/netfs/fscache_stats.c
similarity index 100%
rename from fs/fscache/stats.c
rename to fs/netfs/fscache_stats.c
diff --git a/fs/fscache/volume.c b/fs/netfs/fscache_volume.c
similarity index 100%
rename from fs/fscache/volume.c
rename to fs/netfs/fscache_volume.c
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 43fac1b14e40..e96432499eb2 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -5,9 +5,12 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <linux/slab.h>
+#include <linux/seq_file.h>
 #include <linux/netfs.h>
 #include <linux/fscache.h>
 #include <trace/events/netfs.h>
+#include "fscache_internal.h"
 
 #ifdef pr_fmt
 #undef pr_fmt
@@ -107,6 +110,7 @@ static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
 /*
  * debug tracing
  */
+#if 0
 #define dbgprintk(FMT, ...) \
 	printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
 
@@ -143,3 +147,4 @@ do {						\
 #define _leave(FMT, ...) no_printk("<== %s()"FMT"", __func__, ##__VA_ARGS__)
 #define _debug(FMT, ...) no_printk(FMT, ##__VA_ARGS__)
 #endif
+#endif
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 068568702957..237c54a01d97 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -8,8 +8,8 @@
 #include <linux/module.h>
 #include <linux/export.h>
 #include "internal.h"
-#define CREATE_TRACE_POINTS
-#include <trace/events/netfs.h>
+//#define CREATE_TRACE_POINTS
+//#include <trace/events/netfs.h>
 
 MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
@@ -18,3 +18,4 @@ MODULE_LICENSE("GPL");
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
+

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

