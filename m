Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D488D437DBC
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Qh6hcr+aXMPfNu1LEqRIlvu/EtLGHaXZLEz6HHXIno=;
	b=WyrYuGdYkujAG6K9VtwbzbOmTYBoni+BcYWIIUmKCN4Uc3MP8ESive0gHY5XQaJTK81oyT
	yR6EZOxA1/Crvmyqv5qEsbc1B0Vl37Qta7et9+cL3HxZQQ4GCfdiOLlJM3KsUoDaP1OHSn
	L+hJI8E9f3C19I5yRJMeL2bIKizbZVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-utPp6nncO868HXEsHdjQlA-1; Fri, 22 Oct 2021 15:06:44 -0400
X-MC-Unique: utPp6nncO868HXEsHdjQlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3B25801FCE;
	Fri, 22 Oct 2021 19:06:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 975655BAE5;
	Fri, 22 Oct 2021 19:06:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 846751800B9E;
	Fri, 22 Oct 2021 19:06:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJ6PGm012701 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:06:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3ED5E5C1D5; Fri, 22 Oct 2021 19:06:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC1AE5C1A3;
	Fri, 22 Oct 2021 19:06:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Fri, 22 Oct 2021 20:06:18 +0100
Message-ID: <163492957882.1038219.5079747779493876581.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Subject: [Linux-cachefs] [PATCH v2 31/53] cachefiles: Define structs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define structures to represent the state inside cachefiles.  There are
three structures:

 (1) struct cachefiles_cache.

     This represents the cache as a whole and is used to keep track of the
     cache parameters and security, the communication channel to the
     controlling daemon and various directories in the cache filesystem.

 (2) struct cachefiles_volume.

     This represents a volume in the cache.  It keeps track of the
     directory for the volume and the fanout subdirs that form a hash
     table.

 (3) struct cachefiles_object.

     This represents a data file in the cache.  It keeps track of the
     filename and the open file handle for the relevant file.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/internal.h |   86 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 2f8e2835a785..11dcf9dbcf05 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -19,11 +19,97 @@
 #include <linux/workqueue.h>
 #include <linux/security.h>
 
+struct cachefiles_cache;
+struct cachefiles_object;
+
 extern unsigned cachefiles_debug;
 #define CACHEFILES_DEBUG_KENTER	1
 #define CACHEFILES_DEBUG_KLEAVE	2
 #define CACHEFILES_DEBUG_KDEBUG	4
 
+enum cachefiles_content {
+	/* These values are saved on disk */
+	CACHEFILES_CONTENT_NO_DATA	= 0, /* No content stored */
+	CACHEFILES_CONTENT_SINGLE	= 1, /* Content is monolithic, all is present */
+	CACHEFILES_CONTENT_ALL		= 2, /* Content is all present, no map */
+	CACHEFILES_CONTENT_BACKFS_MAP	= 3, /* Content is piecemeal, mapped through backing fs */
+	CACHEFILES_CONTENT_DIRTY	= 4, /* Content is dirty (only seen on disk) */
+	nr__cachefiles_content
+};
+
+/*
+ * Cached volume representation.
+ */
+struct cachefiles_volume {
+	struct cachefiles_cache		*cache;
+	struct list_head		cache_link;	/* Link in cache->volumes */
+	struct fscache_volume		*vcookie;	/* The netfs's representation */
+	struct dentry			*dentry;	/* The volume dentry */
+	struct dentry			*fanout[256];	/* Fanout subdirs */
+};
+
+/*
+ * node records
+ */
+struct cachefiles_object {
+	int				debug_id;	/* debugging ID */
+	spinlock_t			lock;		/* state and operations lock */
+
+	struct list_head		cache_link;	/* Link in cache->*_list */
+	struct cachefiles_volume	*volume;	/* Cache volume that holds this object */
+	struct fscache_cookie		*cookie;	/* netfs's file/index object */
+	struct file			*file;		/* The file representing this object */
+	char				*d_name;	/* Filename */
+	atomic_t			usage;		/* object usage count */
+	u8				d_name_len;	/* Length of filename */
+	u8				key_hash;	/* Hash of object key */
+	unsigned long			flags;
+#define CACHEFILES_OBJECT_USING_TMPFILE	0		/* Have an unlinked tmpfile */
+	enum cachefiles_content		content_info:8;	/* Info about content presence */
+};
+
+/*
+ * Cache files cache definition
+ */
+struct cachefiles_cache {
+	struct fscache_cache		*cache;		/* Cache cookie */
+	struct vfsmount			*mnt;		/* mountpoint holding the cache */
+	struct dentry			*store;		/* Directory into which live objects go */
+	struct dentry			*graveyard;	/* directory into which dead objects go */
+	struct file			*cachefilesd;	/* manager daemon handle */
+	struct list_head		volumes;	/* List of volume objects */
+	struct list_head		object_list;	/* List of active objects */
+	spinlock_t			object_list_lock;
+	const struct cred		*cache_cred;	/* security override for accessing cache */
+	struct mutex			daemon_mutex;	/* command serialisation mutex */
+	wait_queue_head_t		daemon_pollwq;	/* poll waitqueue for daemon */
+	atomic_t			gravecounter;	/* graveyard uniquifier */
+	atomic_t			f_released;	/* number of objects released lately */
+	atomic_long_t			b_released;	/* number of blocks released lately */
+	unsigned			frun_percent;	/* when to stop culling (% files) */
+	unsigned			fcull_percent;	/* when to start culling (% files) */
+	unsigned			fstop_percent;	/* when to stop allocating (% files) */
+	unsigned			brun_percent;	/* when to stop culling (% blocks) */
+	unsigned			bcull_percent;	/* when to start culling (% blocks) */
+	unsigned			bstop_percent;	/* when to stop allocating (% blocks) */
+	unsigned			bsize;		/* cache's block size */
+	unsigned			bshift;		/* min(ilog2(PAGE_SIZE / bsize), 0) */
+	uint64_t			frun;		/* when to stop culling */
+	uint64_t			fcull;		/* when to start culling */
+	uint64_t			fstop;		/* when to stop allocating */
+	sector_t			brun;		/* when to stop culling */
+	sector_t			bcull;		/* when to start culling */
+	sector_t			bstop;		/* when to stop allocating */
+	unsigned long			flags;
+#define CACHEFILES_READY		0	/* T if cache prepared */
+#define CACHEFILES_DEAD			1	/* T if cache dead */
+#define CACHEFILES_CULLING		2	/* T if cull engaged */
+#define CACHEFILES_STATE_CHANGED	3	/* T if state changed (poll trigger) */
+	char				*rootdirname;	/* name of cache root directory */
+	char				*secctx;	/* LSM security context */
+	char				*tag;		/* cache binding tag */
+};
+
 /*
  * error_inject.c
  */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

