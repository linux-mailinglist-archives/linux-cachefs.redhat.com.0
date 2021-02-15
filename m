Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 19336322840
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614074381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sBx8wY46OJijVwA5KcJa8BTEXk8fSsN8wwLagtAuoyg=;
	b=RlJL4E5BE8LNE70yw6f0EIbMSNsbAREkhuVFomJNAnysqTUme7e4vx85N+y/dEwbRGV+4P
	y385kVPQPfZR1ubroFeJcNQqUl4oMCXN+k1bUx9Z1ixIgzgp2Z5n71hd4gS5cqClB+gQmt
	nrIhHJQTgkCwo+CF6jqbmW4ZdKkHGJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-7ZQ5H8I3Owaqr8G2PdIpjw-1; Tue, 23 Feb 2021 04:59:39 -0500
X-MC-Unique: 7ZQ5H8I3Owaqr8G2PdIpjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3651814329;
	Tue, 23 Feb 2021 09:59:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C11A119725;
	Tue, 23 Feb 2021 09:59:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA0D518089C9;
	Tue, 23 Feb 2021 09:59:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11FFjh3c022988 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 15 Feb 2021 10:45:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B0CF39A4E; Mon, 15 Feb 2021 15:45:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com
	[10.10.119.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB4A519C99;
	Mon, 15 Feb 2021 15:45:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 15 Feb 2021 15:45:35 +0000
Message-ID: <161340393568.1303470.4997526899111310530.stgit@warthog.procyon.org.uk>
In-Reply-To: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:25 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 07/33] netfs,
 mm: Add unlock_page_fscache() and wait_on_page_fscache()
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

Add unlock_page_fscache() as an alias of unlock_page_private_2().  This
allows a page 'locked' with PG_fscache to be unlocked.

Add wait_on_page_fscache() to wait for PG_fscache to be unlocked.

[Linus suggested putting the fscache-themed functions into the
 caching-specific headers rather than pagemap.h]

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-mm@kvack.org
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: ceph-devel@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/linux-fsdevel/1330473.1612974547@warthog.procyon.org.uk/
Link: https://lore.kernel.org/linux-fsdevel/CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com/
---

 include/linux/netfs.h |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index b3d869ec7d2a..f69703543788 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -22,4 +22,33 @@
 #define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
 #define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
 
+/**
+ * unlock_page_fscache - Unlock a page that's locked with PG_fscache
+ * @page: The page
+ *
+ * Unlocks a page that's locked with PG_fscache and wakes up sleepers in
+ * wait_on_page_fscache().  This page bit is used by the netfs helpers when a
+ * netfs page is being written to a local disk cache, thereby allowing writes
+ * to the cache for the same page to be serialised.
+ */
+static inline void unlock_page_fscache(struct page *page)
+{
+	unlock_page_private_2(page);
+}
+
+/**
+ * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
+ * @page: The page
+ *
+ * Wait for the PG_fscache (PG_private_2) page bit to be removed from a page.
+ * This is, for example, used to handle a netfs page being written to a local
+ * disk cache, thereby allowing writes to the cache for the same page to be
+ * serialised.
+ */
+static inline void wait_on_page_fscache(struct page *page)
+{
+	if (PageFsCache(page))
+		wait_on_page_bit(compound_head(page), PG_fscache);
+}
+
 #endif /* _LINUX_NETFS_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

