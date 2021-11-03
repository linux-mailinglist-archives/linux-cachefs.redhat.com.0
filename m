Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C4C44451A
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Nov 2021 17:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635955233;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=legnBF+k0bfQIPELfw+JtnzhKvYHaT/LW/f2QmHXRKc=;
	b=e57F1uuGGeG2iU+N1RjPvlIzKnm3XGTAsmGMn2xeqla84N6GsSCE2qIwUCVfKCJgsNfAmq
	10zPGdul581VmbLqm11SU0kWZK7j/BwXvym1WaIGNAN/Rq4qZFi9jxzCYL9Tze1pG0aWZi
	TqPVs7xcprEfUq4jX/1JgVas2DMc1Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-LwnyG4_tNwSUAHqzfUk7iQ-1; Wed, 03 Nov 2021 12:00:29 -0400
X-MC-Unique: LwnyG4_tNwSUAHqzfUk7iQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D825074C;
	Wed,  3 Nov 2021 16:00:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AA2718EF7;
	Wed,  3 Nov 2021 16:00:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D79AB4A703;
	Wed,  3 Nov 2021 16:00:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3G0Lnc008331 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 12:00:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1645C1815D; Wed,  3 Nov 2021 16:00:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC8C05DEFA;
	Wed,  3 Nov 2021 16:00:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YYKa3bfQZxK5/wDN@casper.infradead.org>
References: <YYKa3bfQZxK5/wDN@casper.infradead.org>
	<163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
	<163584187452.4023316.500389675405550116.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Wed, 03 Nov 2021 16:00:16 +0000
Message-ID: <1088663.1635955216@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1A3G0Lnc008331
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH] folio: Add replacements for page_endio()
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
Content-ID: <1088662.1635955216.1@warthog.procyon.org.uk>
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
---
 include/linux/pagemap.h |    9 ++++++
 mm/filemap.c            |   64 ++++++++++++++++++++++++++++++++----------------
 2 files changed, 51 insertions(+), 22 deletions(-)


diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index e4b98714f763..29b4ee189cb8 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -845,7 +845,14 @@ static inline int __must_check write_one_page(struct page *page)
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
index bfcef6ff7a27..e4e90f96bf1c 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1596,33 +1596,55 @@ void folio_end_writeback(struct folio *folio)
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

