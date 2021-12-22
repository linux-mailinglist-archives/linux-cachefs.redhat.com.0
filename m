Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7B47DA7D
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CKlAMLorulNDAse5gLWcwWViSUTrIPFxjTrR6ARoqow=;
	b=e3iaW931rxPeLBNifn2r3XWThZ0guMlFTSnvshQOrV/umatI5CkE9Ez0HrwtrtP7jG1Q50
	6p/rxZcLLu1+Xy6SXW+/VFI84gMWuciZDsx7Vkg5BwBeu0TxMLQJ/A+tpmxJCaIsAHoueD
	y89z9NcYI28E7OOFmNObbFfto0c9+Yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-NNYwtljwN0mU7DEajpiYUQ-1; Wed, 22 Dec 2021 18:22:49 -0500
X-MC-Unique: NNYwtljwN0mU7DEajpiYUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A7F88042E0;
	Wed, 22 Dec 2021 23:22:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CDE57EFC3;
	Wed, 22 Dec 2021 23:22:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDBCD4BB7C;
	Wed, 22 Dec 2021 23:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNMiJ1000954 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:22:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD7E37EFE1; Wed, 22 Dec 2021 23:22:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8215D7EFC3;
	Wed, 22 Dec 2021 23:22:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:22:40 +0000
Message-ID: <164021536053.640689.5306822604644352548.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Subject: [Linux-cachefs] [PATCH v4 34/68] cachefiles: Add cache error
	reporting macro
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a macro to report a cache I/O error and to tell fscache that the cache
is in trouble.

Also add a pointer to the fscache cache cookie from the cachefiles_cache
struct as we need that to pass to fscache_io_error().

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819626562.215744.1503690975344731661.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906927235.143852.13694625647880837563.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967137158.1823006.2065038830569321335.stgit@warthog.procyon.org.uk/ # v3
---

 fs/cachefiles/internal.h |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index b51146a29aca..b2adcb59b4ce 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -30,6 +30,7 @@ struct cachefiles_object {
  * Cache files cache definition
  */
 struct cachefiles_cache {
+	struct fscache_cache		*cache;		/* Cache cookie */
 	struct vfsmount			*mnt;		/* mountpoint holding the cache */
 	struct file			*cachefilesd;	/* manager daemon handle */
 	const struct cred		*cache_cred;	/* security override for accessing cache */
@@ -103,6 +104,16 @@ static inline int cachefiles_inject_remove_error(void)
 	return cachefiles_error_injection_state & 2 ? -EIO : 0;
 }
 
+/*
+ * Error handling
+ */
+#define cachefiles_io_error(___cache, FMT, ...)		\
+do {							\
+	pr_err("I/O Error: " FMT"\n", ##__VA_ARGS__);	\
+	fscache_io_error((___cache)->cache);		\
+	set_bit(CACHEFILES_DEAD, &(___cache)->flags);	\
+} while (0)
+
 
 /*
  * Debug tracing


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

