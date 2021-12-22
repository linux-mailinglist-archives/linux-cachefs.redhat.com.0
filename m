Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CAE47DA54
	for <lists+linux-cachefs@lfdr.de>; Thu, 23 Dec 2021 00:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640215280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5wQ7An9J8ERKXxGcPePl9g3nCQAtqHpmQRtbWma/i0s=;
	b=cQUy/UaZBx4GOhKRXZVkoWAlRO3Q8bFDE3yEeBUCWuHXMrAd7bnW8e5DXpiOGid/lzIgGk
	fMrHbzt9QFC/6+C2oj7/2XilJeR7ofkg1NFVUj9Vi+GcUU73XsvjvY2UOAM2J3JEzxFB4x
	nwd2Qqb6IuwBtDNcBUI6qFvvYloB16Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-yB_bCvHJPgKDC44VnkOWjg-1; Wed, 22 Dec 2021 18:21:17 -0500
X-MC-Unique: yB_bCvHJPgKDC44VnkOWjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07F4B1808320;
	Wed, 22 Dec 2021 23:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C746D79A28;
	Wed, 22 Dec 2021 23:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98FF84BB7C;
	Wed, 22 Dec 2021 23:21:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BMNLDKX000583 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 18:21:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5DDF92E196; Wed, 22 Dec 2021 23:21:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 791762BE7D;
	Wed, 22 Dec 2021 23:21:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 22 Dec 2021 23:20:59 +0000
Message-ID: <164021525963.640689.9264556596205140044.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Subject: [Linux-cachefs] [PATCH v4 28/68] fscache: Provide a function to
 note the release of a page
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a function to be called from a network filesystem's releasepage
method to indicate that a page has been released that might have been a
reflection of data upon the server - and now that data must be reloaded
from the server or the cache.

This is used to end an optimisation for empty files, in particular files
that have just been created locally, whereby we know there cannot yet be
any data that we would need to read from the server or the cache.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/163819617128.215744.4725572296135656508.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/163906920354.143852.7511819614661372008.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163967128061.1823006.611781655060034988.stgit@warthog.procyon.org.uk/ # v3
---

 include/linux/fscache.h |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 18e725671594..28ce258c1f87 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -607,4 +607,20 @@ static inline void fscache_clear_inode_writeback(struct fscache_cookie *cookie,
 	}
 }
 
+/**
+ * fscache_note_page_release - Note that a netfs page got released
+ * @cookie: The cookie corresponding to the file
+ *
+ * Note that a page that has been copied to the cache has been released.  This
+ * means that future reads will need to look in the cache to see if it's there.
+ */
+static inline
+void fscache_note_page_release(struct fscache_cookie *cookie)
+{
+	if (cookie &&
+	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
+	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
+		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
+}
+
 #endif /* _LINUX_FSCACHE_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

