Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C13936BCA3
	for <lists+linux-cachefs@lfdr.de>; Tue, 27 Apr 2021 02:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619483213;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=54J/j3w8fDV2lsjIe4oPlj+CQbfaA4wDiX352oBnDe4=;
	b=XiV1w0F1e/h3vlOQ7JFlrRPEApgBzX/ZeSXKEn4ZZRosJOJpliVtRPa45uX1o3e6mA/Te+
	9zb206elOPu7wIru44e2BRmIQuFFv+bK3ZXdQRbbDYoAAAJ6UGSGFNDfr6ufzxZ6lGZxWu
	D8LWimVPV5CtAWCEyNS9p4Phb1k432c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-CsDAUgRJOKO8G5aZaoyOog-1; Mon, 26 Apr 2021 20:26:51 -0400
X-MC-Unique: CsDAUgRJOKO8G5aZaoyOog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A5E8189C7;
	Tue, 27 Apr 2021 00:26:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E65015D9CD;
	Tue, 27 Apr 2021 00:26:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A7B41806D1A;
	Tue, 27 Apr 2021 00:26:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QLK8RN030566 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 17:20:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A11EF2C01E; Mon, 26 Apr 2021 21:20:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-20.rdu2.redhat.com
	[10.10.112.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C26460BD9;
	Mon, 26 Apr 2021 21:20:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210426210939.GS235567@casper.infradead.org>
References: <20210426210939.GS235567@casper.infradead.org>
	<161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<3726642.1619471184@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 26 Apr 2021 22:20:03 +0100
Message-ID: <3737237.1619472003@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13QLK8RN030566
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:26:43 -0400
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
Subject: [Linux-cachefs] [PATCH v2] netfs: Miscellaneous fixes
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
Content-ID: <3737236.1619472003.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Okay, how about the attached, then?

David
---
netfs: Miscellaneous fixes
    
Fix some miscellaneous things in the new netfs lib[1]:

 (1) The kerneldoc for netfs_readpage() shouldn't say netfs_page().

 (2) netfs_readpage() can get an integer overflow on 32-bit when it
     multiplies page_index(page) by PAGE_SIZE.  It should use
     page_file_offset() instead.

 (3) netfs_write_begin() should use page_offset() to avoid the same
     overflow.

Note that netfs_readpage() needs to use page_file_offset() rather than
page_offset() as it may see swap-over-NFS.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk/ [1]
---
 fs/netfs/read_helper.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
index 1d3b50c5db6d..193841d03de0 100644
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
+	rreq->start	= page_file_offset(page);
 	rreq->len	= thp_size(page);
 
 	if (ops->begin_cache_operation) {
@@ -1106,7 +1106,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
 	if (!rreq)
 		goto error;
 	rreq->mapping		= page->mapping;
-	rreq->start		= page->index * PAGE_SIZE;
+	rreq->start		= page_offset(page);
 	rreq->len		= thp_size(page);
 	rreq->no_unlock_page	= page->index;
 	__set_bit(NETFS_RREQ_NO_UNLOCK_PAGE, &rreq->flags);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

