Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 39864346D07
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 23:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616538609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PdTcqIbjpjH7MosC8vOznUd/0M/L4+e/8qjkU49C/jA=;
	b=IGxQfv7OwlN+w+BzOaDUoVOOYaghsfxnlsbYh5AlU+7IR9jvhqB0c81GbQDAohs7ay9NhU
	Rk3VmM2tIB84qEmqf1GFtWZ/RSmj1DIomgPEN1QZ226qzVeHjNASvtr5A7O/yRJW/3wTTJ
	fl2HdhOUCIVnEivnk6CKzGsL/ZTMfn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-4jWpQIgWPlCcnbFPzVx_iw-1; Tue, 23 Mar 2021 18:30:07 -0400
X-MC-Unique: 4jWpQIgWPlCcnbFPzVx_iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B25D839A46;
	Tue, 23 Mar 2021 22:30:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D791610AF;
	Tue, 23 Mar 2021 22:30:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53B0D180B450;
	Tue, 23 Mar 2021 22:30:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NMMEvc025428 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 18:22:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C6B26087C; Tue, 23 Mar 2021 22:22:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1815F60877;
	Tue, 23 Mar 2021 22:22:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 23 Mar 2021 22:22:07 +0000
Message-ID: <161653812726.2770958.18167145829938766503.stgit@warthog.procyon.org.uk>
In-Reply-To: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
References: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Mar 2021 18:29:55 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v5 23/28] afs: Wait on PG_fscache before
 modifying/releasing a page
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

PG_fscache is going to be used to indicate that a page is being written to
the cache, and that the page should not be modified or released until it's
finished.

Make afs_invalidatepage() and afs_releasepage() wait for it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/158861253957.340223.7465334678444521655.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/159465832417.1377938.3571599385208729791.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/160588536286.3465195.13231895135369807920.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118153708.1232039.3535103645871176749.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161049369.2537118.11591934943429117060.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340412903.1303470.6424701655031380012.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539556890.286939.5873470593519458598.stgit@warthog.procyon.org.uk/ # v4
---

 fs/afs/file.c  |    9 +++++++++
 fs/afs/write.c |   10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index f1bab69e99d4..acbc21a8c80e 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -594,6 +594,7 @@ static void afs_invalidatepage(struct page *page, unsigned int offset,
 	if (PagePrivate(page))
 		afs_invalidate_dirty(page, offset, length);
 
+	wait_on_page_fscache(page);
 	_leave("");
 }
 
@@ -611,6 +612,14 @@ static int afs_releasepage(struct page *page, gfp_t gfp_flags)
 
 	/* deny if page is being written to the cache and the caller hasn't
 	 * elected to wait */
+#ifdef CONFIG_AFS_FSCACHE
+	if (PageFsCache(page)) {
+		if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
+			return false;
+		wait_on_page_fscache(page);
+	}
+#endif
+
 	if (PagePrivate(page)) {
 		detach_page_private(page);
 		trace_afs_page_dirty(vnode, tracepoint_string("rel"), page);
diff --git a/fs/afs/write.c b/fs/afs/write.c
index dd4dc1c868b5..e1791de90478 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -117,6 +117,10 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 		SetPageUptodate(page);
 	}
 
+#ifdef CONFIG_AFS_FSCACHE
+	wait_on_page_fscache(page);
+#endif
+
 try_again:
 	/* See if this page is already partially written in a way that we can
 	 * merge the new write with.
@@ -857,6 +861,11 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	/* Wait for the page to be written to the cache before we allow it to
 	 * be modified.  We then assume the entire page will need writing back.
 	 */
+#ifdef CONFIG_AFS_FSCACHE
+	if (PageFsCache(vmf->page) &&
+	    wait_on_page_bit_killable(vmf->page, PG_fscache) < 0)
+		return VM_FAULT_RETRY;
+#endif
 
 	if (PageWriteback(vmf->page) &&
 	    wait_on_page_bit_killable(vmf->page, PG_writeback) < 0)
@@ -948,5 +957,6 @@ int afs_launder_page(struct page *page)
 
 	detach_page_private(page);
 	trace_afs_page_dirty(vnode, tracepoint_string("laundered"), page);
+	wait_on_page_fscache(page);
 	return ret;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

