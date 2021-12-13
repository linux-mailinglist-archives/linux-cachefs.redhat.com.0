Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0170473590
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Dec 2021 21:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639425813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=32FJJhBy3KXzSrtgMbHqtWJZD9ffGhlkUXNkdVqZK1g=;
	b=Z9321u+1hxLnOunsaKb34m1N8TfbqIoqMc/FSwhPWk1kTtshZgVBJh6KJ3DPNRETSzhTh4
	w7oVGctXKfv4+lACkns8WFz0M5b6/gpHeyQE2w4fEW90SP1l16HK+SSHaPpdyAQljdR4gb
	Hb5QUll6y43GJgH2FH3u9LbAujyTflc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-luDUYplYM4C9Ts-IfAyYHw-1; Mon, 13 Dec 2021 15:03:30 -0500
X-MC-Unique: luDUYplYM4C9Ts-IfAyYHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A1681CCB6;
	Mon, 13 Dec 2021 20:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA1545D87;
	Mon, 13 Dec 2021 20:03:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AFE04BB7C;
	Mon, 13 Dec 2021 20:03:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BDK3L51013039 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Dec 2021 15:03:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 14C3B45D7E; Mon, 13 Dec 2021 20:03:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41C9F45D61;
	Mon, 13 Dec 2021 20:03:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <599331.1639410068@warthog.procyon.org.uk>
References: <599331.1639410068@warthog.procyon.org.uk>
	<CALF+zOnmJ0=j8pEMikpxYgLrS10gVZiXfCjBhDz9Je0Qip7wnw@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<CALF+zOnA2U6LjDTE8m2REDTMmFVnWkcBkn0ZJQRGULPUjeQW4Q@mail.gmail.com>
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 20:03:19 +0000
Message-ID: <629803.1639425799@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH] fscache: Need to go round again after
	processing LRU_DISCARDING state
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <629802.1639425799.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I forgot to commit part of the patch.  Attached is the patch in full.

David
---
commit a3d01f1a21bcf2c39aa6db49edbc08540378a593
Author: David Howells <dhowells@redhat.com>
Date:   Mon Dec 13 16:26:44 2021 +0000

    afs: Fix mmap
    
    Fix afs_add_open_map() to check that the vnode isn't already on the list
    when it adds it.  It's possible that afs_drop_open_mmap() decremented the
    cb_nr_mmap counter, but hadn't yet got into the locked section to remove
    it.
    
    Also vnode->cb_mmap_link should be initialised, so fix that too.
    
    Fixes: 6e0e99d58a65 ("afs: Fix mmap coherency vs 3rd-party changes")
    Reported-by: Marc Dionne <marc.dionne@auristor.com>
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: linux-afs@lists.infradead.org

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 572063dad0b3..bcda99dcfdec 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -539,8 +539,9 @@ static void afs_add_open_mmap(struct afs_vnode *vnode)
 	if (atomic_inc_return(&vnode->cb_nr_mmap) == 1) {
 		down_write(&vnode->volume->cell->fs_open_mmaps_lock);
 
-		list_add_tail(&vnode->cb_mmap_link,
-			      &vnode->volume->cell->fs_open_mmaps);
+		if (list_empty(&vnode->cb_mmap_link))
+			list_add_tail(&vnode->cb_mmap_link,
+				      &vnode->volume->cell->fs_open_mmaps);
 
 		up_write(&vnode->volume->cell->fs_open_mmaps_lock);
 	}
diff --git a/fs/afs/super.c b/fs/afs/super.c
index af7cbd9949c5..5ec9fd97eccc 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -668,6 +668,7 @@ static void afs_i_init_once(void *_vnode)
 	INIT_LIST_HEAD(&vnode->pending_locks);
 	INIT_LIST_HEAD(&vnode->granted_locks);
 	INIT_DELAYED_WORK(&vnode->lock_work, afs_lock_work);
+	INIT_LIST_HEAD(&vnode->cb_mmap_link);
 	seqlock_init(&vnode->cb_lock);
 }
 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

