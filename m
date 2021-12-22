Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E9747DA67
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NsVhEW5SuXlptvz/+ybJfjCWWrNSkwZKQLIJgwRwGZM=;
	b=Co9HgXB103mP0VA7quvpyg+vuBsdrQAAtzi6ParG1NwmMvdyuyk87KUMhvkGolpAppNkSb
	iGYETl44TX6J3QIiiix/nRgPxfT9bqvsUnRjgpGudWBsGMdze5UOfvlvg4+goKkYxwsHdw
	ocxEpjtT00qb1wXSgLQRczuUfN2fXhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-_13-eH8wMMmGOA6mm0UKtA-1; Wed, 22 Dec 2021 18:22:02 -0500
X-MC-Unique: _13-eH8wMMmGOA6mm0UKtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DE651006AA5;
	Wed, 22 Dec 2021 23:22:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B4A2BE7D;
	Wed, 22 Dec 2021 23:22:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E80111809CB9;
	Wed, 22 Dec 2021 23:21:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNLwEe000691 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:21:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29FB88AC0D; Wed, 22 Dec 2021 23:21:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2FED88865;
	Wed, 22 Dec 2021 23:21:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:21:46 +0000
Message-ID: <164021530610.640689.846094074334176928.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH v4 31/68] cachefiles: Define structs
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

Define the cachefiles_cache struct that's going to carry the cache-level
parameters and state of a cache.

Define the beginning of the cachefiles_object struct that's going to carry
the state for a data storage object.  For the moment this is just a
debugging ID for logging purposes.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819623690.215744.2824739137193655547.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906924292.143852.15881439716653984905.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967131405.1823006.4480555941533935597.stgit@warthog.procyon.org.uk/ # v3
---

 fs/cachefiles/internal.h |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 26e0e23d7702..cff4b2a5f928 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -16,6 +16,52 @@
 #include <linux/cred.h>
 #include <linux/security.h>
 
+struct cachefiles_cache;
+struct cachefiles_object;
+
+/*
+ * Data file records.
+ */
+struct cachefiles_object {
+	int				debug_id;	/* debugging ID */
+};
+
+/*
+ * Cache files cache definition
+ */
+struct cachefiles_cache {
+	struct vfsmount			*mnt;		/* mountpoint holding the cache */
+	struct file			*cachefilesd;	/* manager daemon handle */
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
  * Debug tracing.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

