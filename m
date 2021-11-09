Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39C44B50D
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Nov 2021 22:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636495073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XZrzBbFYIEJBtZgO2GogGJiMpxfB7dgSvehkBhPLots=;
	b=GEyY9pNY9TdwkDZjScJHIpakaN3EUdTmJTK+UVmgS4YixldW5THq+VL6h+i3jSiDnIJgXE
	t6hok6B/AtbuPYuC90zlpUmRrH3uFKQMifd6VpxT8iKJnibqyJ9xeCoxvTfrplNXfH4siS
	M7PfozpBlNZJ379aj8Uk6V3k4+jvzG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-S6Xgo1s-MviEMYook4EKSg-1; Tue, 09 Nov 2021 16:57:49 -0500
X-MC-Unique: S6Xgo1s-MviEMYook4EKSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED0BE8042E5;
	Tue,  9 Nov 2021 21:57:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9AD67842;
	Tue,  9 Nov 2021 21:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 748504E58F;
	Tue,  9 Nov 2021 21:57:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9LRtil007132 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 16:27:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0710319733; Tue,  9 Nov 2021 21:27:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1812319729;
	Tue,  9 Nov 2021 21:27:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 09 Nov 2021 21:27:44 +0000
Message-ID: <163649326420.309189.6029879848780568728.stgit@warthog.procyon.org.uk>
In-Reply-To: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
References: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v4 3/5] folio: Add replacements for
	page_endio()
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

Add three functions to replace page_endio():

 (1) folio_end_read().  End a read to a folio.

 (2) folio_end_write().  End a write from a folio.

 (3) folio_endio().  A switcher that does one or the other of the above.

Change page_endio() to just call folio_endio().  Note that the parameter
order is switched so that the folio_endio() stub doesn't have to shuffle
the params around, but can rather just test and jump.

Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Jeff Layton <jlayton@kernel.org>
Tested-by: Dominique Martinet <asmadeus@codewreck.org>
Tested-by: kafs-testing@auristor.com
Link: https://lore.kernel.org/r/1088663.1635955216@warthog.procyon.org.uk/
---

 include/linux/pagemap.h |    9 ++++++-
 mm/filemap.c            |   64 ++++++++++++++++++++++++++++++++---------------
 2 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 1a0c646eb6ff..fd90544bb3e4 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -895,7 +895,14 @@ static inline int __must_check write_one_page(struct page *page)
 int __set_page_dirty_nobuffers(struct page *page);
 int __set_page_dirty_no_writeback(struct page *page);
 
-void page_endio(struct page *page, bool is_write, int err);
+void folio_end_read(struct folio *folio, int err);
+void folio_end_write(struct folio *folio, int err);
+void folio_endio(struct folio *folio, int err, bool is_write);
+
+static inline void page_endio(struct page *page, bool is_write, int err)
+{
+	folio_endio(page_folio(page), err, is_write);
+}
 
 void folio_end_private_2(struct folio *folio);
 void folio_wait_private_2(struct folio *folio);
diff --git a/mm/filemap.c b/mm/filemap.c
index daa0e23a6ee6..841e87b2d6ab 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1612,33 +1612,55 @@ void folio_end_writeback(struct folio *folio)
 }
 EXPORT_SYMBOL(folio_end_writeback);
 
-/*
- * After completing I/O on a page, call this routine to update the page
- * flags appropriately
+/**
+ * folio_end_read - Update the state of a folio after a read
+ * @folio: The folio to update
+ * @err: The error code (or 0) to apply
  */
-void page_endio(struct page *page, bool is_write, int err)
+void folio_end_read(struct folio *folio, int err)
 {
-	if (!is_write) {
-		if (!err) {
-			SetPageUptodate(page);
-		} else {
-			ClearPageUptodate(page);
-			SetPageError(page);
-		}
-		unlock_page(page);
+	if (!err) {
+		folio_mark_uptodate(folio);
 	} else {
-		if (err) {
-			struct address_space *mapping;
+		folio_clear_uptodate(folio);
+		folio_set_error(folio);
+	}
+	folio_unlock(folio);
+}
+EXPORT_SYMBOL_GPL(folio_end_read);
 
-			SetPageError(page);
-			mapping = page_mapping(page);
-			if (mapping)
-				mapping_set_error(mapping, err);
-		}
-		end_page_writeback(page);
+/**
+ * folio_end_write - Update the state of a folio after a write
+ * @folio: The folio to update
+ * @err: The error code (or 0) to apply
+ */
+void folio_end_write(struct folio *folio, int err)
+{
+	if (err) {
+		struct address_space *mapping = folio_mapping(folio);
+
+		folio_set_error(folio);
+		if (mapping)
+			mapping_set_error(mapping, err);
 	}
+	folio_end_writeback(folio);
+}
+EXPORT_SYMBOL_GPL(folio_end_write);
+
+/**
+ * folio_endio - Update the state of a folio after a read or write
+ * @folio: The folio to update
+ * @err: The error code (or 0) to apply
+ * @is_write: True if this was a write
+ */
+void folio_endio(struct folio *folio, int err, bool is_write)
+{
+	if (is_write)
+		folio_end_write(folio, err);
+	else
+		folio_end_read(folio, err);
 }
-EXPORT_SYMBOL_GPL(page_endio);
+EXPORT_SYMBOL_GPL(folio_endio);
 
 /**
  * __folio_lock - Get a lock on the folio, assuming we need to sleep to get it.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

