Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AF09421DD2B
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Jul 2020 18:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594658240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nQ9sZz//oHEDY256fnupdjngqZfTirQOlURzfYWRBLA=;
	b=cBwnAL9dT7oqqhXPRHU6mL32uamkNaATt0GkD3yvq3AgWbpKE75C7R5TTCRqap21YAjrQg
	R74PRTktNbjbC61lTdXIcL5THVJsvqbB1EUAMcYaE8T0eWDhZxmZ37NRobDBcY6/pXwP88
	PGBR7G3AdTP+dnwEkMbKTtJZn5hJKBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-BaiuascVPrGivVMBQ0Kq1w-1; Mon, 13 Jul 2020 12:37:19 -0400
X-MC-Unique: BaiuascVPrGivVMBQ0Kq1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3560D102C7E9;
	Mon, 13 Jul 2020 16:37:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2458560BF3;
	Mon, 13 Jul 2020 16:37:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DAE81809554;
	Mon, 13 Jul 2020 16:37:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGbDv1028456 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:37:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C284A60CD0; Mon, 13 Jul 2020 16:37:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-113.rdu2.redhat.com
	[10.10.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B20760C87;
	Mon, 13 Jul 2020 16:37:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>
Date: Mon, 13 Jul 2020 17:37:07 +0100
Message-ID: <159465822787.1377938.10874079234418111929.stgit@warthog.procyon.org.uk>
In-Reply-To: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
References: <159465821598.1377938.2046362270225008168.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 01/13] afs: Fix interruption of operations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The afs filesystem driver allows unstarted operations to be cancelled by
signal, but most of these can easily be restarted (mkdir for example).  The
primary culprits for reproducing this are those applications that use
SIGALRM to display a progress counter.

File lock-extension operation is marked uninterruptible as we have a
limited time in which to do it, and the release op is marked
uninterruptible also as if we fail to unlock a file, we'll have to wait 20
mins before anyone can lock it again.

The store operation logs a warning if it gets interruption, e.g.:

	kAFS: Unexpected error from FS.StoreData -4

because it's run from the background - but it can also be run from
fdatasync()-type things.  However, store options aren't marked
interruptible at the moment.

Fix this in the following ways:

 (1) Mark store operations as uninterruptible.  It might make sense to
     relax this for certain situations, but I'm not sure how to make sure
     that background store ops aren't affected by signals to foreground
     processes that happen to trigger them.

 (2) In afs_get_io_locks(), where we're getting the serialisation lock for
     talking to the fileserver, return ERESTARTSYS rather than EINTR
     because a lot of the operations (e.g. mkdir) are restartable if we
     haven't yet started sending the op to the server.

Fixes: e49c7b2f6de7 ("afs: Build an abstraction around an "operation" concept")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fs_operation.c |    4 ++--
 fs/afs/write.c        |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/afs/fs_operation.c b/fs/afs/fs_operation.c
index c264839b2fd0..24fd163c6323 100644
--- a/fs/afs/fs_operation.c
+++ b/fs/afs/fs_operation.c
@@ -71,7 +71,7 @@ static bool afs_get_io_locks(struct afs_operation *op)
 		swap(vnode, vnode2);
 
 	if (mutex_lock_interruptible(&vnode->io_lock) < 0) {
-		op->error = -EINTR;
+		op->error = -ERESTARTSYS;
 		op->flags |= AFS_OPERATION_STOP;
 		_leave(" = f [I 0]");
 		return false;
@@ -80,7 +80,7 @@ static bool afs_get_io_locks(struct afs_operation *op)
 
 	if (vnode2) {
 		if (mutex_lock_interruptible_nested(&vnode2->io_lock, 1) < 0) {
-			op->error = -EINTR;
+			op->error = -ERESTARTSYS;
 			op->flags |= AFS_OPERATION_STOP;
 			mutex_unlock(&vnode->io_lock);
 			op->flags &= ~AFS_OPERATION_LOCK_0;
diff --git a/fs/afs/write.c b/fs/afs/write.c
index abfc8d3dc20c..60918b80b729 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -449,6 +449,7 @@ static int afs_store_data(struct address_space *mapping,
 	op->store.first_offset = offset;
 	op->store.last_to = to;
 	op->mtime = vnode->vfs_inode.i_mtime;
+	op->flags |= AFS_OPERATION_UNINTR;
 	op->ops = &afs_store_data_operation;
 
 try_next_key:


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

