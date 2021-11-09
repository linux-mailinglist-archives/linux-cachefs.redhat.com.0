Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCDF44B4DD
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Nov 2021 22:39:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636493995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=06jv/ak9n8Lw/9lMzVcxBIfZJTNXoA1Hu63Rx/h+jzM=;
	b=UJSlUiBdJdWti7suhRKJlVVyrfpQheJS/XlfYgtywOgI0X+KToQTr7Lus3cH/5Xwvov7W7
	gzU3Y0ZNep2wszloNu2RUtwmrZh6BLviQDXsuFGzGuuXPhPGcYASkPSEcsmHPYVePsEdNG
	TKNzdShlC1UQ/GjKZr4GeKCAxP1gLJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Mc6zwGQTOnOVyslt6by8lw-1; Tue, 09 Nov 2021 16:39:51 -0500
X-MC-Unique: Mc6zwGQTOnOVyslt6by8lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1BD9804144;
	Tue,  9 Nov 2021 21:39:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46BF15C1D5;
	Tue,  9 Nov 2021 21:39:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5512B181A1D0;
	Tue,  9 Nov 2021 21:39:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9LRcPm006942 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 16:27:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EBF0C1017CE3; Tue,  9 Nov 2021 21:27:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23BB710016F4;
	Tue,  9 Nov 2021 21:27:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 09 Nov 2021 21:27:35 +0000
Message-ID: <163649325519.309189.15072332908703129455.stgit@warthog.procyon.org.uk>
In-Reply-To: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
References: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v4 2/5] folio: Add a function to get the
 host inode for a folio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a convenience function, folio_inode() that will get the host inode from
a folio's mapping.

Changes:
 ver #3:
  - Fix mistake in function description[2].
 ver #2:
  - Fix contradiction between doc and implementation by disallowing use
    with swap caches[1].

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Tested-by: Jeff Layton <jlayton@kernel.org>
Tested-by: Dominique Martinet <asmadeus@codewreck.org>
Tested-by: kafs-testing@auristor.com
Link: https://lore.kernel.org/r/YST8OcVNy02Rivbm@casper.infradead.org/ [1]
Link: https://lore.kernel.org/r/YYKLkBwQdtn4ja+i@casper.infradead.org/ [2]
Link: https://lore.kernel.org/r/162880453171.3369675.3704943108660112470.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/162981151155.1901565.7010079316994382707.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/163005744370.2472992.18324470937328925723.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163584184628.4023316.9386282630968981869.stgit@warthog.procyon.org.uk/ # v3
---

 include/linux/pagemap.h |   14 ++++++++++++++
 mm/page-writeback.c     |    2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 1f560aecd9b5..1a0c646eb6ff 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -253,6 +253,20 @@ static inline struct address_space *page_mapping_file(struct page *page)
 	return folio_mapping(folio);
 }
 
+/**
+ * folio_inode - Get the host inode for this folio.
+ * @folio: The folio.
+ *
+ * For folios which are in the page cache, return the inode that this folio
+ * belongs to.
+ *
+ * Do not call this for folios which aren't in the page cache.
+ */
+static inline struct inode *folio_inode(struct folio *folio)
+{
+	return folio->mapping->host;
+}
+
 static inline bool page_cache_add_speculative(struct page *page, int count)
 {
 	VM_BUG_ON_PAGE(PageTail(page), page);
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 2d498bb62248..a613f8ef6a02 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2967,7 +2967,7 @@ EXPORT_SYMBOL_GPL(folio_wait_writeback_killable);
  */
 void folio_wait_stable(struct folio *folio)
 {
-	if (folio->mapping->host->i_sb->s_iflags & SB_I_STABLE_WRITES)
+	if (folio_inode(folio)->i_sb->s_iflags & SB_I_STABLE_WRITES)
 		folio_wait_writeback(folio);
 }
 EXPORT_SYMBOL_GPL(folio_wait_stable);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

