Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6E1636D86
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 23:49:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669243746;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vustv/gxBcFd6Xt1KLlh7nVsKsnN2Y8XuPFg8CjJrC4=;
	b=ZSo3AUctKSa3vDEZ6kKqZOTGk2PGx/rgKUjbn8PtSA7DkB+KIScElNttX6Kli4FclLDGWv
	QPv+l9keHXOnbWCTEFO4AmUyOZ+MD2dTTWfrOV3UeD4SpwkCIaH5FpfmUck92VYCC3qu8z
	R+MjCO7GvPPeW/Br7bXbEAwGKr4rmPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-1dSqVhLiNLeChFk074UKYQ-1; Wed, 23 Nov 2022 17:49:03 -0500
X-MC-Unique: 1dSqVhLiNLeChFk074UKYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1FB6805AC7;
	Wed, 23 Nov 2022 22:49:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 986A640C83BB;
	Wed, 23 Nov 2022 22:49:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78840194658D;
	Wed, 23 Nov 2022 22:49:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EE2C1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 22:49:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 73687111E41C; Wed, 23 Nov 2022 22:49:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B620111E413;
 Wed, 23 Nov 2022 22:48:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Nov 2022 22:48:56 +0000
Message-ID: <166924373637.1772793.2622483388224911574.stgit@warthog.procyon.org.uk>
In-Reply-To: <166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk>
References: <166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Linux-cachefs] [RFC PATCH v4 3/3] mm: Make filemap_release_folio()
 better inform shrink_folio_list()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-erofs@lists.ozlabs.org, Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make filemap_release_folio() return one of three values:

 (0) FILEMAP_CANT_RELEASE_FOLIO

     Couldn't release the folio's private data, so the folio can't itself
     be released.

 (1) FILEMAP_RELEASED_FOLIO

     The private data on the folio was released and the folio can be
     released.

 (2) FILEMAP_FOLIO_HAD_NO_PRIVATE

     There was no private data on the folio and the folio can be released.

The first must be zero so that existing tests of !filemap_release_folio()
continue to work as expected; similarly the other two must both be non-zero
so that existing tests of filemap_release_folio() continue to work as
expected.

Using this, make shrink_folio_list() choose which of three cases to follow
based on the return from filemap_release_folio() rather than testing the
folio's private bit itself.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Dave Wysochanski <dwysocha@redhat.com>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Ilya Dryomov <idryomov@gmail.com>
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-afs@lists.infradead.org
cc: v9fs-developer@lists.sourceforge.net
cc: ceph-devel@vger.kernel.org
cc: linux-nfs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/1459152.1669208550@warthog.procyon.org.uk/ # v3
---

 include/linux/pagemap.h |    7 ++++++-
 mm/filemap.c            |   20 ++++++++++++++------
 mm/vmscan.c             |   29 +++++++++++++++--------------
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 9a824b43c6af..b763182b6d3f 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1124,7 +1124,12 @@ void replace_page_cache_page(struct page *old, struct page *new);
 void delete_from_page_cache_batch(struct address_space *mapping,
 				  struct folio_batch *fbatch);
 int try_to_release_page(struct page *page, gfp_t gfp);
-bool filemap_release_folio(struct folio *folio, gfp_t gfp);
+enum filemap_released_folio {
+	FILEMAP_CANT_RELEASE_FOLIO	= 0, /* (This must be 0) Release failed */
+	FILEMAP_RELEASED_FOLIO		= 1, /* Folio's private data released */
+	FILEMAP_FOLIO_HAD_NO_PRIVATE	= 2, /* Folio had no private data */
+};
+enum filemap_released_folio filemap_release_folio(struct folio *folio, gfp_t gfp);
 loff_t mapping_seek_hole_data(struct address_space *, loff_t start, loff_t end,
 		int whence);
 
diff --git a/mm/filemap.c b/mm/filemap.c
index 93757247cd11..859831c70439 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3934,20 +3934,28 @@ EXPORT_SYMBOL(generic_file_write_iter);
  * this page (__GFP_IO), and whether the call may block
  * (__GFP_RECLAIM & __GFP_FS).
  *
- * Return: %true if the release was successful, otherwise %false.
+ * Return: %FILEMAP_RELEASED_FOLIO if the release was successful,
+ * %FILEMAP_CANT_RELEASE_FOLIO if the private data couldn't be released and
+ * %FILEMAP_FOLIO_HAD_NO_PRIVATE if there was no private data.
  */
-bool filemap_release_folio(struct folio *folio, gfp_t gfp)
+enum filemap_released_folio filemap_release_folio(struct folio *folio,
+						  gfp_t gfp)
 {
 	struct address_space * const mapping = folio->mapping;
+	bool released;
 
 	BUG_ON(!folio_test_locked(folio));
 	if (!folio_needs_release(folio))
-		return true;
+		return FILEMAP_FOLIO_HAD_NO_PRIVATE;
 	if (folio_test_writeback(folio))
-		return false;
+		return FILEMAP_CANT_RELEASE_FOLIO;
 
 	if (mapping && mapping->a_ops->release_folio)
-		return mapping->a_ops->release_folio(folio, gfp);
-	return try_to_free_buffers(folio);
+		released = mapping->a_ops->release_folio(folio, gfp);
+	else
+		released = try_to_free_buffers(folio);
+
+	return released ?
+		FILEMAP_RELEASED_FOLIO : FILEMAP_CANT_RELEASE_FOLIO;
 }
 EXPORT_SYMBOL(filemap_release_folio);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b9316f447238..d5c7b3be9947 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1978,25 +1978,26 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		 * (refcount == 1) it can be freed.  Otherwise, leave
 		 * the folio on the LRU so it is swappable.
 		 */
-		if (folio_needs_release(folio)) {
-			if (!filemap_release_folio(folio, sc->gfp_mask))
-				goto activate_locked;
+		switch (filemap_release_folio(folio, sc->gfp_mask)) {
+		case FILEMAP_CANT_RELEASE_FOLIO:
+			goto activate_locked;
+		case FILEMAP_RELEASED_FOLIO:
 			if (!mapping && folio_ref_count(folio) == 1) {
 				folio_unlock(folio);
 				if (folio_put_testzero(folio))
 					goto free_it;
-				else {
-					/*
-					 * rare race with speculative reference.
-					 * the speculative reference will free
-					 * this folio shortly, so we may
-					 * increment nr_reclaimed here (and
-					 * leave it off the LRU).
-					 */
-					nr_reclaimed += nr_pages;
-					continue;
-				}
+				/*
+				 * rare race with speculative reference.  the
+				 * speculative reference will free this folio
+				 * shortly, so we may increment nr_reclaimed
+				 * here (and leave it off the LRU).
+				 */
+				nr_reclaimed += nr_pages;
+				continue;
 			}
+			break;
+		case FILEMAP_FOLIO_HAD_NO_PRIVATE:
+			break;
 		}
 
 		if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

