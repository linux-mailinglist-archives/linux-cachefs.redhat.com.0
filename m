Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3057336BB12
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 23:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619471543;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QpIYYOy+ftpHlcyI6/UC1IVEiP9IdSdQmA4lDjEgRVY=;
	b=VKeSepBPo8Z6yNX5Xo7ooTuoeaKPuIU74/DtNnxcA+q6vRbwBOXHRFn92FFKLhkKBI/GnM
	QiHSuE02N1l/QTEw+w8+t5kQLyQydXBq1+d/W2EJLbJ03HOmAvMAQbLbd6YLc1C/nLLfBp
	RB3gHz3a3kInduYVcDGmOjJBuMrNrxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-UQNRc3RINZahxc1J0_mL-w-1; Mon, 26 Apr 2021 17:12:20 -0400
X-MC-Unique: UQNRc3RINZahxc1J0_mL-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A83508189CD;
	Mon, 26 Apr 2021 21:12:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B242687DA;
	Mon, 26 Apr 2021 21:12:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EFFD1806D1A;
	Mon, 26 Apr 2021 21:12:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QL6TBq028779 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 17:06:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A28535D9CD; Mon, 26 Apr 2021 21:06:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-20.rdu2.redhat.com
	[10.10.112.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD605D9DE;
	Mon, 26 Apr 2021 21:06:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
Date: Mon, 26 Apr 2021 22:06:24 +0100
Message-ID: <3726642.1619471184@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13QL6TBq028779
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 17:12:14 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Steve French <sfrench@samba.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mike Marshall <hubcap@omnibond.com>
Subject: [Linux-cachefs] [PATCH] netfs: Miscellaneous fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3726523.1619471123.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    
Fix some miscellaneous things in the new netfs lib[1]:

 (1) The kerneldoc for netfs_readpage() shouldn't say netfs_page().

 (2) netfs_readpage() can get an integer overflow on 32-bit when it
     multiplies page_index(page) by PAGE_SIZE.  It should use
     page_offset() instead.

 (3) netfs_write_begin() should also use page_offset() to avoid the same
     overflow.

 (4) Use page_mapping() in netfs_write_begin() rather than page->mapping.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk/ [1]
---
 fs/netfs/read_helper.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 1d3b50c5db6d..568e26352309 100644
--- a/fs/netfs/read_helper.c
+++ b/fs/netfs/read_helper.c
@@ -933,7 +933,7 @@ void netfs_readahead(struct readahead_control *ractl,
 EXPORT_SYMBOL(netfs_readahead);
 
 /**
- * netfs_page - Helper to manage a readpage request
+ * netfs_readpage - Helper to manage a readpage request
  * @file: The file to read from
  * @page: The page to read
  * @ops: The network filesystem's operations for the helper to use
@@ -968,7 +968,7 @@ int netfs_readpage(struct file *file,
 		return -ENOMEM;
 	}
 	rreq->mapping	= page_file_mapping(page);
-	rreq->start	= page_index(page) * PAGE_SIZE;
+	rreq->start	= page_offset(page);
 	rreq->len	= thp_size(page);
 
 	if (ops->begin_cache_operation) {
@@ -1105,8 +1105,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
 	if (!rreq)
 		goto error;
-	rreq->mapping		= page->mapping;
-	rreq->start		= page->index * PAGE_SIZE;
+	rreq->mapping		= page_file_mapping(page);
+	rreq->start		= page_offset(page);
 	rreq->len		= thp_size(page);
 	rreq->no_unlock_page	= page->index;
 	__set_bit(NETFS_RREQ_NO_UNLOCK_PAGE, &rreq->flags);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

