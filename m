Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D17B3AECA7
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 17:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624290031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K+Lr843pc3zHtvxRoX43BZCbpH7QgtFT8cTh4YZ9o4g=;
	b=K3BeWJUVOU8sOOFeELrKrNPZacRTZMuLzxT3CEr6kSSncPd1lmf2JpDk0vsRF8rh1P9P4e
	QRZlmPy3T8fhCSHa+C7Zd93eS0LKdSaInwY4X8wsX7+SMTIl9HN44z1G8ZLjv69vXZDbfE
	e8u67d+YBgPjGobtrxBsXOhrOUZZpDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-Dgf2AEThNcCt3qJ1m22qlA-1; Mon, 21 Jun 2021 11:40:30 -0400
X-MC-Unique: Dgf2AEThNcCt3qJ1m22qlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D422804143;
	Mon, 21 Jun 2021 15:40:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D8860C9F;
	Mon, 21 Jun 2021 15:40:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD9111809C99;
	Mon, 21 Jun 2021 15:40:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LFePXE030141 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 11:40:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAFCF12C82; Mon, 21 Jun 2021 15:40:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 706ED5D9CA;
	Mon, 21 Jun 2021 15:40:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Mon, 21 Jun 2021 16:40:17 +0100
Message-ID: <162429001766.2770648.1072619730387446884.stgit@warthog.procyon.org.uk>
In-Reply-To: <162429000639.2770648.6368710175435880749.stgit@warthog.procyon.org.uk>
References: <162429000639.2770648.6368710175435880749.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v3 1/2] afs: Fix afs_write_end() to handle
	short writes
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

Fix afs_write_end() to correctly handle a short copy into the intended
write region of the page.  Two things are necessary:

 (1) If the page is not up to date, then we should just return 0
     (ie. indicating a zero-length copy).  The loop in
     generic_perform_write() will go around again, possibly breaking up the
     iterator into discrete chunks[1].

     This is analogous to commit b9de313cf05fe08fa59efaf19756ec5283af672a
     for ceph.

 (2) The page should not have been set uptodate if it wasn't completely set
     up by netfs_write_begin() (this will be fixed in the next patch), so
     we need to set uptodate here in such a case.

Also remove the assertion that was checking that the page was set uptodate
since it's now set uptodate if it wasn't already a few lines above.  The
assertion was from when uptodate was set elsewhere.

Changes:
v3: Remove the handling of len exceeding the end of the page.

Fixes: 3003bbd0697b ("afs: Use the netfs_write_begin() helper")
Reported-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
cc: Al Viro <viro@zeniv.linux.org.uk>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-afs@lists.infradead.org
Link: https://lore.kernel.org/r/YMwVp268KTzTf8cN@zeniv-ca.linux.org.uk/ [1]
Link: https://lore.kernel.org/r/162367682522.460125.5652091227576721609.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/162391825688.1173366.3437507255136307904.stgit@warthog.procyon.org.uk/ # v2
---

 fs/afs/write.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index a523bb86915d..641c54679399 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -118,6 +118,15 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 	_enter("{%llx:%llu},{%lx}",
 	       vnode->fid.vid, vnode->fid.vnode, page->index);
 
+	if (!PageUptodate(page)) {
+		if (copied < len) {
+			copied = 0;
+			goto out;
+		}
+
+		SetPageUptodate(page);
+	}
+
 	if (copied == 0)
 		goto out;
 
@@ -132,8 +141,6 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 		write_sequnlock(&vnode->cb_lock);
 	}
 
-	ASSERT(PageUptodate(page));
-
 	if (PagePrivate(page)) {
 		priv = page_private(page);
 		f = afs_page_dirty_from(page, priv);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

