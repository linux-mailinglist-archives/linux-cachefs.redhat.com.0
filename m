Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8DA13A5800
	for <lists+linux-cachefs@lfdr.de>; Sun, 13 Jun 2021 13:39:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-50nrc2AjN9Gkjnwe8DdBxA-1; Sun, 13 Jun 2021 07:39:32 -0400
X-MC-Unique: 50nrc2AjN9Gkjnwe8DdBxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF38100B3AC;
	Sun, 13 Jun 2021 11:39:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCFDD34B4B;
	Sun, 13 Jun 2021 11:39:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 473B21809CAC;
	Sun, 13 Jun 2021 11:39:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15DBax2G019331 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 07:36:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EC0B20236E9; Sun, 13 Jun 2021 11:36:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A90120236E8
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 11:36:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40E6C185A79C
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 11:36:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-2-1tSuOk7VNvWlcGLOuGsnAg-1;
	Sun, 13 Jun 2021 07:36:53 -0400
X-MC-Unique: 1tSuOk7VNvWlcGLOuGsnAg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ACF36109F;
	Sun, 13 Jun 2021 11:36:51 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Sun, 13 Jun 2021 07:36:50 -0400
Message-Id: <20210613113650.8672-1-jlayton@kernel.org>
In-Reply-To: <YMXmRo17oy8fDn2b@casper.infradead.org>
References: <YMXmRo17oy8fDn2b@casper.infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15DBax2G019331
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, stable@vger.kernel.org,
	linux-cachefs@redhat.com, willy@infradead.org, pfmeec@rit.edu,
	idryomov@gmail.com
Subject: [Linux-cachefs] [PATCH v4] ceph: fix write_begin optimization when
	write is beyond EOF
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

It's not sufficient to skip reading when the pos is beyond the EOF.
There may be data at the head of the page that we need to fill in
before the write.

Add a new helper function that corrects and clarifies the logic.

Cc: <stable@vger.kernel.org> # v5.10+
Cc: Matthew Wilcox <willy@infradead.org>
Fixes: 1cc1699070bd ("ceph: fold ceph_update_writeable_page into ceph_write_begin")
Reported-by: Andrew W Elble <aweits@rit.edu>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 63 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 13 deletions(-)

This version just has a couple of future-proofing tweaks that Willy
suggested.

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 26e66436f005..b20a17cfec42 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1302,6 +1302,54 @@ ceph_find_incompatible(struct page *page)
 	return NULL;
 }
 
+/**
+ * prep_noread_page - prep a page for writing without reading first
+ * @page: page being prepared
+ * @pos: starting position for the write
+ * @len: length of write
+ *
+ * In some cases we don't need to read at all:
+ * - full page write
+ * - file is currently zero-length
+ * - write that lies in a page that is completely beyond EOF
+ * - write that covers the the page from start to EOF or beyond it
+ *
+ * If any of these criteria are met, then zero out the unwritten parts
+ * of the page and return true. Otherwise, return false.
+ */
+static bool prep_noread_page(struct page *page, loff_t pos, size_t len)
+{
+	struct inode *inode = page->mapping->host;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t index = pos / PAGE_SIZE;
+	size_t offset = offset_in_page(pos);
+
+	/* clamp length to end of the current page */
+	if (len > PAGE_SIZE)
+		len = PAGE_SIZE - offset;
+
+	/* full page write */
+	if (offset == 0 && len == PAGE_SIZE)
+		goto zero_out;
+
+	/* zero-length file */
+	if (i_size == 0)
+		goto zero_out;
+
+	/* position beyond last page in the file */
+	if (index > ((i_size - 1) / PAGE_SIZE))
+		goto zero_out;
+
+	/* write that covers the the page from start to EOF or beyond it */
+	if (offset == 0 && (pos + len) >= i_size)
+		goto zero_out;
+
+	return false;
+zero_out:
+	zero_user_segments(page, 0, offset, offset + len, PAGE_SIZE);
+	return true;
+}
+
 /*
  * We are only allowed to write into/dirty the page if the page is
  * clean, or already dirty within the same snap context.
@@ -1315,7 +1363,6 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 	struct ceph_snap_context *snapc;
 	struct page *page = NULL;
 	pgoff_t index = pos >> PAGE_SHIFT;
-	int pos_in_page = pos & ~PAGE_MASK;
 	int r = 0;
 
 	dout("write_begin file %p inode %p page %p %d~%d\n", file, inode, page, (int)pos, (int)len);
@@ -1350,19 +1397,9 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 			break;
 		}
 
-		/*
-		 * In some cases we don't need to read at all:
-		 * - full page write
-		 * - write that lies completely beyond EOF
-		 * - write that covers the the page from start to EOF or beyond it
-		 */
-		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
-		    (pos >= i_size_read(inode)) ||
-		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {
-			zero_user_segments(page, 0, pos_in_page,
-					   pos_in_page + len, PAGE_SIZE);
+		/* No need to read in some cases */
+		if (prep_noread_page(page, pos, len))
 			break;
-		}
 
 		/*
 		 * We need to read it. If we get back -EINPROGRESS, then the page was
-- 
2.31.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

