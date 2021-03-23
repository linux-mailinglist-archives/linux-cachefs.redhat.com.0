Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA75346D10
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 23:30:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616538613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=twcLdeDjYD0pAzrCVNfdYSRWF4bcaOV5Lqb4DxRURp0=;
	b=PS1RM7c6K+8o1yaUaYgHynVh4MYG1bpU1N23FbxzfP2Yt8YJ7OET64gw4oImiuuWZeMbWW
	7vKv6JvusoWuGWrPnkitcQrp3xed0CfsTIrVrEJfv3CudvT7zRFRijujKJiavTJnv8WohE
	T1YlwfzRIqm5xgBCVujvg0urjOOOR3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-iv7rSu72OD6lqGkpSLaDkg-1; Tue, 23 Mar 2021 18:30:11 -0400
X-MC-Unique: iv7rSu72OD6lqGkpSLaDkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F0E7101372E;
	Tue, 23 Mar 2021 22:30:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A7F11048117;
	Tue, 23 Mar 2021 22:30:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0FC34BB7B;
	Tue, 23 Mar 2021 22:30:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NMJ9mb025131 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 18:19:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15E95610A8; Tue, 23 Mar 2021 22:19:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D27D60BE5;
	Tue, 23 Mar 2021 22:18:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 23 Mar 2021 22:18:58 +0000
Message-ID: <161653793873.2770958.12157243390965814502.stgit@warthog.procyon.org.uk>
In-Reply-To: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
References: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Mar 2021 18:29:55 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v5 08/28] netfs,
 mm: Add set/end/wait_on_page_fscache() aliases
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add set/end/wait_on_page_fscache() as aliases of
set/end/wait_page_private_2().  These allow a page to marked with
PG_fscache, the flag to be removed and waiters woken and waiting for the
flag to be cleared.  A ref on the page is also taken and dropped.

[Linus suggested putting the fscache-themed functions into the
 caching-specific headers rather than pagemap.h[1]]

Changes:
v5:
- Mirror the changes to the core routines[2].

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
Link: https://lore.kernel.org/r/1330473.1612974547@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com/ [1]
Link: https://lore.kernel.org/r/161340393568.1303470.4997526899111310530.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539536093.286939.5076448803512118764.stgit@warthog.procyon.org.uk/ # v4
Link: https://lore.kernel.org/r/2499407.1616505440@warthog.procyon.org.uk/ [2]
---

 include/linux/netfs.h |   57 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index cc1102040488..8479d63406f7 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -26,4 +26,61 @@
 #define TestSetPageFsCache(page)	TestSetPagePrivate2((page))
 #define TestClearPageFsCache(page)	TestClearPagePrivate2((page))
 
+/**
+ * set_page_fscache - Set PG_fscache on a page and take a ref
+ * @page: The page.
+ *
+ * Set the PG_fscache (PG_private_2) flag on a page and take the reference
+ * needed for the VM to handle its lifetime correctly.  This sets the flag and
+ * takes the reference unconditionally, so care must be taken not to set the
+ * flag again if it's already set.
+ */
+static inline void set_page_fscache(struct page *page)
+{
+	set_page_private_2(page);
+}
+
+/**
+ * end_page_fscache - Clear PG_fscache and release any waiters
+ * @page: The page
+ *
+ * Clear the PG_fscache (PG_private_2) bit on a page and wake up any sleepers
+ * waiting for this.  The page ref held for PG_private_2 being set is released.
+ *
+ * This is, for example, used when a netfs page is being written to a local
+ * disk cache, thereby allowing writes to the cache for the same page to be
+ * serialised.
+ */
+static inline void end_page_fscache(struct page *page)
+{
+	end_page_private_2(page);
+}
+
+/**
+ * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
+ * @page: The page to wait on
+ *
+ * Wait for PG_fscache (aka PG_private_2) to be cleared on a page.
+ */
+static inline void wait_on_page_fscache(struct page *page)
+{
+	wait_on_page_private_2(page);
+}
+
+/**
+ * wait_on_page_fscache_killable - Wait for PG_fscache to be cleared on a page
+ * @page: The page to wait on
+ *
+ * Wait for PG_fscache (aka PG_private_2) to be cleared on a page or until a
+ * fatal signal is received by the calling task.
+ *
+ * Return:
+ * - 0 if successful.
+ * - -EINTR if a fatal signal was encountered.
+ */
+static inline int wait_on_page_fscache_killable(struct page *page)
+{
+	return wait_on_page_private_2_killable(page);
+}
+
 #endif /* _LINUX_NETFS_H */


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

