Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C4B3F3D0FFB
	for <lists+linux-cachefs@lfdr.de>; Wed, 21 Jul 2021 15:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626875198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UIiuVk4IIjJV0Y90y7YIGWY0+c43MDzTQiNS5Pmq0Mw=;
	b=iY2IO4d2twUO2Ufr5/il5dj7LLE0EhbCdHRSkTHYUSZoPMbZrwq1G8qEVLtRkGHYmnxEeG
	pPke3mGMLMiMi1B8UhC4JxhxRUNX/dSt9NSd2IQuYN0k4M99mb+4kkuuunY+tAQ1PTDy2J
	wPeViXdkpB1MvoGxqPlmnuXPoiQQn3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-uUSMEZN4OxOcDR0TFci7Kg-1; Wed, 21 Jul 2021 09:46:36 -0400
X-MC-Unique: uUSMEZN4OxOcDR0TFci7Kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A72318C8C15;
	Wed, 21 Jul 2021 13:46:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7025DD86;
	Wed, 21 Jul 2021 13:46:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 487654BB7C;
	Wed, 21 Jul 2021 13:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LDkXll031744 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 09:46:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17A7A5C230; Wed, 21 Jul 2021 13:46:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-62.rdu2.redhat.com
	[10.10.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75AF75C225;
	Wed, 21 Jul 2021 13:46:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 21 Jul 2021 14:46:28 +0100
Message-ID: <162687518862.276387.262991356873597293.stgit@warthog.procyon.org.uk>
In-Reply-To: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
References: <162687506932.276387.14456718890524355509.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Shyam Prasad N <nspmangalore@gmail.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: [Linux-cachefs] [RFC PATCH 08/12] netfs: Keep dirty mark for pages
 with more than one dirty region
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a page has more than one dirty region overlapping it, then we mustn't
clear the dirty mark when we want to flush one of them.

Make netfs_set_page_writeback() check the adjacent dirty regions to see if
they overlap the page(s) the region we're interested in, and if they do,
leave the page marked dirty.

NOTES:

 (1) Might want to discount the overlapping regions if they're being
     flushed (in which case they wouldn't normally want to hold the dirty
     bit).

 (2) Similarly, the writeback mark should not be cleared if the page is
     still being written back by another, overlapping region.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/netfs/write_back.c |   41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/write_back.c b/fs/netfs/write_back.c
index 9fcb2ac50ebb..5c779cb12345 100644
--- a/fs/netfs/write_back.c
+++ b/fs/netfs/write_back.c
@@ -135,12 +135,47 @@ static int netfs_lock_pages(struct address_space *mapping,
 	return ret;
 }
 
-static int netfs_set_page_writeback(struct page *page)
+static int netfs_set_page_writeback(struct page *page,
+				    struct netfs_i_context *ctx,
+				    struct netfs_write_request *wreq)
 {
+	struct netfs_dirty_region *region = wreq->region, *r;
+	loff_t pos = page_offset(page);
+	bool clear_dirty = true;
+
 	/* Now we need to clear the dirty flags on any page that's not shared
 	 * with any other dirty region.
 	 */
-	if (!clear_page_dirty_for_io(page))
+	spin_lock(&ctx->lock);
+	if (pos < region->dirty.start) {
+		r = region;
+		list_for_each_entry_continue_reverse(r, &ctx->dirty_regions, dirty_link) {
+			if (r->dirty.end <= pos)
+				break;
+			if (r->state < NETFS_REGION_IS_DIRTY)
+				continue;
+			kdebug("keep-dirty-b %lx reg=%x r=%x",
+			       page->index, region->debug_id, r->debug_id);
+			clear_dirty = false;
+		}
+	}
+
+	pos += thp_size(page);
+	if (pos > region->dirty.end) {
+		r = region;
+		list_for_each_entry_continue(r, &ctx->dirty_regions, dirty_link) {
+			if (r->dirty.start >= pos)
+				break;
+			if (r->state < NETFS_REGION_IS_DIRTY)
+				continue;
+			kdebug("keep-dirty-f %lx reg=%x r=%x",
+			       page->index, region->debug_id, r->debug_id);
+			clear_dirty = false;
+		}
+	}
+	spin_unlock(&ctx->lock);
+
+	if (clear_dirty && !clear_page_dirty_for_io(page))
 		BUG();
 
 	/* We set writeback unconditionally because a page may participate in
@@ -225,7 +260,7 @@ static int netfs_begin_write(struct address_space *mapping,
 	trace_netfs_wreq(wreq);
 
 	netfs_iterate_pages(mapping, wreq->first, wreq->last,
-			    netfs_set_page_writeback);
+			    netfs_set_page_writeback, ctx, wreq);
 	netfs_unlock_pages(mapping, wreq->first, wreq->last);
 	iov_iter_xarray(&wreq->source, WRITE, &wreq->mapping->i_pages,
 			wreq->start, wreq->len);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

