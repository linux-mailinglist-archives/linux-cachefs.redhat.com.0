Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AE09D21DD49
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DMBqOC9BJRDQj5hi5SJn5jLfy2XbwElkuiEbK99D6WI=;
	b=L9ZojZW72cAlqLaDn5XOjrAqLMWEAiCBme9KOccTFbXOjn0gJIDjrBQv1p0Sv7oyejj1HV
	WDGolnNNPXpE/xGNzd3l51JSS3XWkX9JcOBtPW35W4ST1c9fOM42rHPk5WjhHh452wKCck
	Cr+LNCR4TbJMKKmfMF5Knpj1C6PTFWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-kHLOshuSN9OY3Cc7FpTTsg-1; Mon, 13 Jul 2020 12:38:44 -0400
X-MC-Unique: kHLOshuSN9OY3Cc7FpTTsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8E54800400;
	Mon, 13 Jul 2020 16:38:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98AE07621B;
	Mon, 13 Jul 2020 16:38:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F1B294EEF;
	Mon, 13 Jul 2020 16:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGccvj028915 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:38:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC2AD10021B3; Mon, 13 Jul 2020 16:38:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0D5110013C0;
	Mon, 13 Jul 2020 16:38:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:38:32 +0100
Message-ID: <159465831290.1377938.10075677476527399814.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
References: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 08/13] afs: Note the amount transferred in
	fetch-data delivery
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Note the amount of data transferred in the fscache request op structure in
the delivery/decode routines for the various FetchData operations.

Also, we need to exclude the excess from this value and then we need to use
this in directory read rather than actual_len.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/dir.c       |    9 ++++-----
 fs/afs/fsclient.c  |    5 +++++
 fs/afs/yfsclient.c |    5 +++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 9d47df15c790..03ef09330d10 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -209,9 +209,8 @@ static void afs_dir_dump(struct afs_vnode *dvnode, struct afs_read *req)
 	pr_warn("DIR %llx:%llx f=%llx l=%llx al=%llx\n",
 		dvnode->fid.vid, dvnode->fid.vnode,
 		req->file_size, req->cache.len, req->actual_len);
-	pr_warn("DIR %llx %x %zx %zx\n",
-		req->cache.pos, req->cache.nr_pages,
-		req->iter->iov_offset,  iov_iter_count(req->iter));
+	pr_warn("DIR %llx %x %llx\n",
+		req->cache.pos, req->cache.nr_pages, req->cache.transferred);
 
 	xas_for_each(&xas, page, last) {
 		if (xas_retry(&xas, page))
@@ -321,7 +320,7 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 
 	nr_pages = (i_size + PAGE_SIZE - 1) / PAGE_SIZE;
 
-	req->actual_len = i_size; /* May change */
+	req->cache.transferred = i_size; /* May change */
 	req->cache.len = nr_pages * PAGE_SIZE; /* We can ask for more than there is */
 	req->data_version = dvnode->status.data_version; /* May change */
 	iov_iter_mapping(&req->def_iter, READ, dvnode->vfs_inode.i_mapping,
@@ -546,7 +545,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 
 	/* walk through the blocks in sequence */
 	ret = 0;
-	while (ctx->pos < req->actual_len) {
+	while (ctx->pos < req->cache.transferred) {
 		blkoff = ctx->pos & ~(sizeof(union afs_xdr_dir_block) - 1);
 
 		/* Fetch the appropriate page from the directory and re-add it
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index d6a8066e666d..e729a19f28c5 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -393,6 +393,11 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		break;
 	}
 
+	/* Pass the call's ref on the read request descriptor to the completion
+	 * handler.
+	 */
+	req->cache.transferred = min(req->actual_len, req->cache.len);
+	set_bit(FSCACHE_IO_DATA_FROM_SERVER, &req->cache.flags);
 	if (req->cache.io_done)
 		req->cache.io_done(&req->cache);
 
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 30621f4fffc0..4ead0c1f9014 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -450,6 +450,11 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		break;
 	}
 
+	/* Pass the call's ref on the read request descriptor to the completion
+	 * handler.
+	 */
+	req->cache.transferred = min(req->actual_len, req->cache.len);
+	set_bit(FSCACHE_IO_DATA_FROM_SERVER, &req->cache.flags);
 	if (req->cache.io_done)
 		req->cache.io_done(&req->cache);
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

