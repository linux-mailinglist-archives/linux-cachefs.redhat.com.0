Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E64CA787
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 15:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646230156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q+YU2k/FSTQJykqvCdbWUICKhMBVvYbcQvsS2m97rsQ=;
	b=Ctt04qKcOMy5/PvZdr/MUzapRLbRAXD+efiulRg5Aa2sfem6Za2/Au/iQQgIM6WColnF79
	IVLNRiDVVpFRdf8Z7NllHQntRgvFB9k9ltHSLkwNsv/6dWCQRwqJctO8bGfjjSx5PyOCv1
	44sX5nDsW56FHzRZ85h7bDWUWGyQ0Bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-uVq9r5gCMYiQpgdvG4GpPw-1; Wed, 02 Mar 2022 09:09:13 -0500
X-MC-Unique: uVq9r5gCMYiQpgdvG4GpPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2D0824FA8;
	Wed,  2 Mar 2022 14:09:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E4E84968;
	Wed,  2 Mar 2022 14:09:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D52891809CB2;
	Wed,  2 Mar 2022 14:09:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222E99FI021220 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 09:09:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0476784965; Wed,  2 Mar 2022 14:09:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C7368496F;
	Wed,  2 Mar 2022 14:09:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Wed, 02 Mar 2022 14:09:06 +0000
Message-ID: <164623014626.3564931.8375344024648265358.stgit@warthog.procyon.org.uk>
In-Reply-To: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
References: <164622970143.3564931.3656393397237724303.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 19/19] afs: Maintain
	netfs_i_context::remote_i_size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make afs use netfslib's tracking for the server's idea of what the current
inode size is independently of inode->i_size.  We really want to use this
value when calculating the new vnode size when initiating a StoreData RPC
op rather than the size stat() presents to the user (ie. inode->i_size) as
the latter is affected by as-yet uncommitted writes.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
---

 fs/afs/inode.c |    1 +
 fs/afs/write.c |    7 +++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 5b5e40197655..2fe402483ad5 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -246,6 +246,7 @@ static void afs_apply_status(struct afs_operation *op,
 		 * idea of what the size should be that's not the same as
 		 * what's on the server.
 		 */
+		vnode->netfs_ctx.remote_i_size = status->size;
 		if (change_size) {
 			afs_set_i_size(vnode, status->size);
 			inode->i_ctime = t;
diff --git a/fs/afs/write.c b/fs/afs/write.c
index e4b47f67a408..85c9056ba9fb 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -353,9 +353,10 @@ static const struct afs_operation_ops afs_store_data_operation = {
 static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos,
 			  bool laundering)
 {
+	struct netfs_i_context *ictx = &vnode->netfs_ctx;
 	struct afs_operation *op;
 	struct afs_wb_key *wbk = NULL;
-	loff_t size = iov_iter_count(iter), i_size;
+	loff_t size = iov_iter_count(iter);
 	int ret = -ENOKEY;
 
 	_enter("%s{%llx:%llu.%u},%llx,%llx",
@@ -377,15 +378,13 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t
 		return -ENOMEM;
 	}
 
-	i_size = i_size_read(&vnode->vfs_inode);
-
 	afs_op_set_vnode(op, 0, vnode);
 	op->file[0].dv_delta = 1;
 	op->file[0].modification = true;
 	op->store.write_iter = iter;
 	op->store.pos = pos;
 	op->store.size = size;
-	op->store.i_size = max(pos + size, i_size);
+	op->store.i_size = max(pos + size, ictx->remote_i_size);
 	op->store.laundering = laundering;
 	op->mtime = vnode->vfs_inode.i_mtime;
 	op->flags |= AFS_OPERATION_UNINTR;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

