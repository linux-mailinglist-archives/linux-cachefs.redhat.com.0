Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E7E4D4EE4
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Mar 2022 17:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646929271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VfdiBZYcoGp5zlzZjneH/pz7NvJ2vMQ5I+qSOLFIs2g=;
	b=emOgQrGconQGTYqOYYiNp2ATd0cL+QlKvMdzhblpZEhk5YvciCe1mWuMiwfZSyFXCd/tY7
	jj12Kks4R0B8wtZacHrTCeDKVtx7ST4XAmCPjtVEtLEEnVp3wz4SJVTf9vaZbVd64o/moX
	GwwYchs+IZIEDxqexNuGsoHvQEwuctc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-yWxJXc3sPQq_BWVzJt1nMg-1; Thu, 10 Mar 2022 11:21:07 -0500
X-MC-Unique: yWxJXc3sPQq_BWVzJt1nMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A93C899ED2;
	Thu, 10 Mar 2022 16:21:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42F8AC50951;
	Thu, 10 Mar 2022 16:21:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EEC20194E016;
	Thu, 10 Mar 2022 16:21:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7513F19451EC for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Mar 2022 16:21:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 250E07C04A; Thu, 10 Mar 2022 16:21:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 089AB7C04D;
 Thu, 10 Mar 2022 16:20:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 10 Mar 2022 16:20:35 +0000
Message-ID: <164692923592.2099075.5466132542956550401.stgit@warthog.procyon.org.uk>
In-Reply-To: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
References: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Linux-cachefs] [PATCH v3 20/20] afs: Maintain
 netfs_i_context::remote_i_size
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
Link: https://lore.kernel.org/r/164623014626.3564931.8375344024648265358.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/164678220204.1200972.17408022517463940584.stgit@warthog.procyon.org.uk/ # v2
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

