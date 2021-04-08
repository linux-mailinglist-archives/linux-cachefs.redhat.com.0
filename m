Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9898C3585B1
	for <lists+linux-cachefs@lfdr.de>; Thu,  8 Apr 2021 16:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617890699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PDCYUqmAFIcjXbGS3Ck98G3Kl6rDtWkqfxVjNXw+XBQ=;
	b=YE1qE8T9F23ZuBqAPzHdXpEj0UieyBray6zgDYT5n6Pugvxu7x5vdifHPE1EmG/SBi1x+t
	MLzWc+9G4vQtYzUVOaJ1fKSfh0buMHQ12Np9py/6MuuOBBksCb8Rc8h4o7ooHnM0S+iU8N
	/jpDizoVz42d8bfTy4i6LI1DY3LZLaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-8Y3VflfvMMWDeh50rjq9DQ-1; Thu, 08 Apr 2021 10:04:57 -0400
X-MC-Unique: 8Y3VflfvMMWDeh50rjq9DQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 429DC801FD8;
	Thu,  8 Apr 2021 14:04:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB8410016F4;
	Thu,  8 Apr 2021 14:04:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 084A71806D0F;
	Thu,  8 Apr 2021 14:04:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 138E4rw3027192 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 8 Apr 2021 10:04:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1090E5D765; Thu,  8 Apr 2021 14:04:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F36525D747;
	Thu,  8 Apr 2021 14:04:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 08 Apr 2021 15:04:46 +0100
Message-ID: <161789068619.6155.1397999970593531574.stgit@warthog.procyon.org.uk>
In-Reply-To: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
References: <161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH v6 04/30] fs: Document file_ra_state
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

From: Matthew Wilcox (Oracle) <willy@infradead.org>

Turn the comments into kernel-doc and improve the wording slightly.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/20210407201857.3582797-3-willy@infradead.org/
---

 include/linux/fs.h |   24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index ec8f3ddf4a6a..33831a8bda52 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -891,18 +891,22 @@ struct fown_struct {
 	int signum;		/* posix.1b rt signal to be delivered on IO */
 };
 
-/*
- * Track a single file's readahead state
+/**
+ * struct file_ra_state - Track a file's readahead state.
+ * @start: Where the most recent readahead started.
+ * @size: Number of pages read in the most recent readahead.
+ * @async_size: Start next readahead when this many pages are left.
+ * @ra_pages: Maximum size of a readahead request.
+ * @mmap_miss: How many mmap accesses missed in the page cache.
+ * @prev_pos: The last byte in the most recent read request.
  */
 struct file_ra_state {
-	pgoff_t start;			/* where readahead started */
-	unsigned int size;		/* # of readahead pages */
-	unsigned int async_size;	/* do asynchronous readahead when
-					   there are only # of pages ahead */
-
-	unsigned int ra_pages;		/* Maximum readahead window */
-	unsigned int mmap_miss;		/* Cache miss stat for mmap accesses */
-	loff_t prev_pos;		/* Cache last read() position */
+	pgoff_t start;
+	unsigned int size;
+	unsigned int async_size;
+	unsigned int ra_pages;
+	unsigned int mmap_miss;
+	loff_t prev_pos;
 };
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

