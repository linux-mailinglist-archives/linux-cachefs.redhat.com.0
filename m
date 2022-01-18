Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C84927A7
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/fodNy55QxwbFAfxBHZ8l6tuPJN3reqckOpSzflVaNc=;
	b=UwDMPaXuoHRyhDFaT8n9Gmiu3FCgCTEnnkpLL3Lq0ykjIFcRqE7zvfj0jwaSud7Y+dF39p
	nSbtJ9lOfZqRP0bgsFkBHVzP9twV2tLDwrrhMeofVc/awVLJZbwZv0lyM/XWJvmfVLOwPh
	g9gExJk4X5JZglHl15VqjpEPxFF/8/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-OtgKSRyPPJquSC9yK4xgrQ-1; Tue, 18 Jan 2022 08:55:03 -0500
X-MC-Unique: OtgKSRyPPJquSC9yK4xgrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39863839A4F;
	Tue, 18 Jan 2022 13:54:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3DE956F93;
	Tue, 18 Jan 2022 13:54:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD3384BB7C;
	Tue, 18 Jan 2022 13:54:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDsn9u014157 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:54:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 38CCD2B6F9; Tue, 18 Jan 2022 13:54:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAE842DE92;
	Tue, 18 Jan 2022 13:54:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:54:44 +0000
Message-ID: <164251408479.3435901.9540165422908194636.stgit@warthog.procyon.org.uk>
In-Reply-To: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 08/11] fscache: Add a comment explaining how
 page-release optimisation works
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a comment into fscache_note_page_release() to explain how the
page-release optimisation logic works[1].  It's not entirely obvious as it
has nothing to do with whether or not the netfs file contains data.

FSCACHE_COOKIE_NO_DATA_TO_READ is set if we have no data in the cache yet
(ie. the backing file lookup was negative, the file is 0 length or the
cookie got invalidated).  It means that we have no data in the cache, not
that the file is necessarily empty on the server.

FSCACHE_COOKIE_HAVE_DATA is set once we've stored data in the backing file.
>From that point on, we have data we *could* read - however, it's covered by
pages in the netfs pagecache until at such time one of those covering pages
is released.

So if we've written data to the cache (HAVE_DATA) and there wasn't any data
in the cache when we started (NO_DATA_TO_READ), it may no longer be true
that we can skip reading from the cache.

Read skipping is done by cachefiles_prepare_read().

Note that tracking is not done on a per-page basis, but only on a per-file
basis.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/043a206f03929c2667a465314144e518070a9b2d.camel@kernel.org/ [1]
---

 include/linux/fscache.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index ede50406bcb0..296c5f1d9f35 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -665,6 +665,11 @@ static inline void fscache_clear_inode_writeback(struct fscache_cookie *cookie,
 static inline
 void fscache_note_page_release(struct fscache_cookie *cookie)
 {
+	/* If we've written data to the cache (HAVE_DATA) and there wasn't any
+	 * data in the cache when we started (NO_DATA_TO_READ), it may no
+	 * longer be true that we can skip reading from the cache - so clear
+	 * the flag that causes reads to be skipped.
+	 */
 	if (cookie &&
 	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
 	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

