Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD50437CE9
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 20:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0g0r7vyKVzsovCFbRiJzhkPyL9TDx9q40MzXiXO4Yfc=;
	b=I+sVRF9AeU/k3YiSZZT9OLAzj0enZuuv0suju2RKmzYd4m0yeHd+FOgWi6Caf7WV/Ozd+y
	RimsRNthnDy9iQuxz9odBrA5FGWYKF/plrmhL9I/6OuoD1d0Uon7ypEfsg6sZui+uwxMJr
	bDRUcoTJw66DU+fEWx1HnhX9Oj/0HA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-BDCL1pFZPf-qkqNNkJkLUA-1; Fri, 22 Oct 2021 14:59:47 -0400
X-MC-Unique: BDCL1pFZPf-qkqNNkJkLUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEE50801FCE;
	Fri, 22 Oct 2021 18:59:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2BA19D9B;
	Fri, 22 Oct 2021 18:59:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D9F61800B9E;
	Fri, 22 Oct 2021 18:59:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MIxhTX011785 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 14:59:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8C3C5DEFA; Fri, 22 Oct 2021 18:59:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 700D85DD68;
	Fri, 22 Oct 2021 18:59:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 19:59:34 +0100
Message-ID: <163492917458.1038219.13229909230658169654.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Jeff Layton <jlayton@kernel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v2 04/53] cachefiles_old: Rename
 CONFIG_CACHEFILES* to CONFIG_CACHEFILES_OLD*
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename the CONFIG_CACHEFILES* config symbols to CONFIG_CACHEFILES_OLD*.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/Makefile                  |    2 +-
 fs/cachefiles_old/Kconfig    |    8 ++++----
 fs/cachefiles_old/Makefile   |    2 +-
 fs/cachefiles_old/internal.h |    2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/Makefile b/fs/Makefile
index 6e6dbcd04cae..e5cb91ecb29f 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -125,7 +125,7 @@ obj-$(CONFIG_AFS_FS)		+= afs/
 obj-$(CONFIG_NILFS2_FS)		+= nilfs2/
 obj-$(CONFIG_BEFS_FS)		+= befs/
 obj-$(CONFIG_HOSTFS)		+= hostfs/
-obj-$(CONFIG_CACHEFILES)	+= cachefiles_old/
+obj-$(CONFIG_CACHEFILES_OLD)	+= cachefiles_old/
 obj-$(CONFIG_DEBUG_FS)		+= debugfs/
 obj-$(CONFIG_TRACING)		+= tracefs/
 obj-$(CONFIG_OCFS2_FS)		+= ocfs2/
diff --git a/fs/cachefiles_old/Kconfig b/fs/cachefiles_old/Kconfig
index 7f3e1881fb21..48977018c64e 100644
--- a/fs/cachefiles_old/Kconfig
+++ b/fs/cachefiles_old/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config CACHEFILES
-	tristate "Filesystem caching on files"
+config CACHEFILES_OLD
+	tristate "Filesystem caching on files (old driver)"
 	depends on FSCACHE_OLD && BLOCK
 	help
 	  This permits use of a mounted filesystem as a cache for other
@@ -11,9 +11,9 @@ config CACHEFILES
 	  See Documentation/filesystems/caching/cachefiles.rst for more
 	  information.
 
-config CACHEFILES_DEBUG
+config CACHEFILES_OLD_DEBUG
 	bool "Debug CacheFiles"
-	depends on CACHEFILES
+	depends on CACHEFILES_OLD
 	help
 	  This permits debugging to be dynamically enabled in the filesystem
 	  caching on files module.  If this is set, the debugging output may be
diff --git a/fs/cachefiles_old/Makefile b/fs/cachefiles_old/Makefile
index 714e84b3ca24..e0c2e69ddf50 100644
--- a/fs/cachefiles_old/Makefile
+++ b/fs/cachefiles_old/Makefile
@@ -14,4 +14,4 @@ cachefiles-y := \
 	security.o \
 	xattr.o
 
-obj-$(CONFIG_CACHEFILES) := cachefiles.o
+obj-$(CONFIG_CACHEFILES_OLD) := cachefiles.o
diff --git a/fs/cachefiles_old/internal.h b/fs/cachefiles_old/internal.h
index 28351d62d8d2..9e3a8d6894db 100644
--- a/fs/cachefiles_old/internal.h
+++ b/fs/cachefiles_old/internal.h
@@ -235,7 +235,7 @@ do {									\
 #define _leave(FMT, ...) kleave(FMT, ##__VA_ARGS__)
 #define _debug(FMT, ...) kdebug(FMT, ##__VA_ARGS__)
 
-#elif defined(CONFIG_CACHEFILES_DEBUG)
+#elif defined(CONFIG_CACHEFILES_OLD_DEBUG)
 #define _enter(FMT, ...)				\
 do {							\
 	if (cachefiles_debug & CACHEFILES_DEBUG_KENTER)	\


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

