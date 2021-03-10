Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 786F83344B2
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Mar 2021 18:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615395915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3noJDaxt+MFCUlGdNQMbFQkkJZLXSZ9Oe4gOUTYzJC8=;
	b=Z7OeP1wF1H6xL5RYzTPWf4U6bHFKXS/nyRvB90YG0cVHrza0BZkdoqeOffuvtbQPr2Mzw4
	99EhzPJsoztomZ5DRmbANansc9aSLHNXlfOKVWdhwuFaCaoXmwYjA3FcLgfV04YpY7U0XH
	fhJ0Spr17dDk2Vwi7HrxnI+VcdFYcbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-mabzqSlEMQCkSSfbQ5p1cQ-1; Wed, 10 Mar 2021 12:05:13 -0500
X-MC-Unique: mabzqSlEMQCkSSfbQ5p1cQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E935C1966336;
	Wed, 10 Mar 2021 17:05:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D70A160240;
	Wed, 10 Mar 2021 17:05:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEAB21800B6C;
	Wed, 10 Mar 2021 17:05:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AGvXFu024264 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 11:57:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E40882AA19; Wed, 10 Mar 2021 16:57:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3C460C13;
	Wed, 10 Mar 2021 16:57:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Wed, 10 Mar 2021 16:57:24 +0000
Message-ID: <161539544426.286939.4484560053278261236.stgit@warthog.procyon.org.uk>
In-Reply-To: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
References: <161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 10 Mar 2021 12:05:02 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v4 13/28] netfs: Hold a ref on a page when
	PG_private_2 is set
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

Take a reference on a page when PG_private_2 is set and drop it once the
bit is unlocked[1].

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>
cc: linux-mm@kvack.org
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: ceph-devel@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/CAHk-=wh+2gbF7XEjYc=HV9w_2uVzVf7vs60BPz0gFA=+pUm3ww@mail.gmail.com/ [1]
Link: https://lore.kernel.org/r/1331025.1612974993@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/161340400833.1303470.8070750156044982282.stgit@warthog.procyon.org.uk/ # v3
---

 fs/netfs/read_helper.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 0a7b76c11c98..ce11ca4c32e4 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/pagemap.h>
+#include <linux/pagevec.h>
 #include <linux/slab.h>
 #include <linux/uio.h>
 #include <linux/sched/mm.h>
@@ -238,10 +239,13 @@ static void netfs_rreq_unmark_after_write(struct netfs_read_request *rreq,
 					  bool was_async)
 {
 	struct netfs_read_subrequest *subreq;
+	struct pagevec pvec;
 	struct page *page;
 	pgoff_t unlocked = 0;
 	bool have_unlocked = false;
 
+	pagevec_init(&pvec);
+
 	rcu_read_lock();
 
 	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
@@ -255,6 +259,8 @@ static void netfs_rreq_unmark_after_write(struct netfs_read_request *rreq,
 				continue;
 			unlocked = page->index;
 			unlock_page_fscache(page);
+			if (pagevec_add(&pvec, page) == 0)
+				pagevec_release(&pvec);
 			have_unlocked = true;
 		}
 	}
@@ -413,8 +419,10 @@ static void netfs_rreq_unlock(struct netfs_read_request *rreq)
 				pg_failed = true;
 				break;
 			}
-			if (test_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags))
+			if (test_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags)) {
+				get_page(page);
 				SetPageFsCache(page);
+			}
 			pg_failed |= subreq_failed;
 			if (pgend < iopos + subreq->len)
 				break;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

