Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83B23302DE9
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jan 2021 22:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611610537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WXSDlGVL+3k7/oaIh2oNtsz1aKBhugB2UBKmi4BbD9U=;
	b=Bksu184LmeMTIZ4tFt+MEEr1BmtxpL7M7UAo/WycGiqtxC7giqdonXtZyQjj3bM/wWDclu
	ejXFx8cCn/XcD4xvzzLOeL3K+LfgWwVa8XhKYjK/oaw/Tmm7Xgu7xrnWUdczhPdpWJLNsd
	6bdzVvdLS3iJg6mUGH6hJYBAKv2MoIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-XXxs355CNISPr4LgTymCmQ-1; Mon, 25 Jan 2021 16:35:34 -0500
X-MC-Unique: XXxs355CNISPr4LgTymCmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEC57802B40;
	Mon, 25 Jan 2021 21:35:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFAF15D6AB;
	Mon, 25 Jan 2021 21:35:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7D8D4BB7B;
	Mon, 25 Jan 2021 21:35:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PLZUAC028158 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 16:35:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D99719727; Mon, 25 Jan 2021 21:35:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41F4C19C47;
	Mon, 25 Jan 2021 21:35:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Mon, 25 Jan 2021 21:35:26 +0000
Message-ID: <161161052647.2537118.12922380836599003659.stgit@warthog.procyon.org.uk>
In-Reply-To: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH 23/32] afs: Use the fs operation ops to
 handle FetchData completion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the 'success' and 'aborted' afs_operations_ops methods and add a
'failed' method to handle the completion of an AFS.FetchData,
AFS.FetchData64 or YFS.FetchData64 RPC operation rather than directly
calling the done func pointed to by the afs_read struct from the call
delivery handler.

This means the done function will be called back on error also, not just on
successful completion.

This allows motion towards asynchronous data reception on data fetch calls
and allows any error to be handed off to the fscache read helper in the
same place as a successful completion.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/file.c         |   15 +++++++++++++++
 fs/afs/fs_operation.c |    4 +++-
 fs/afs/fsclient.c     |    3 ---
 fs/afs/internal.h     |    1 +
 fs/afs/yfsclient.c    |    3 ---
 5 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index f6282ac0d222..231e9fd7882b 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -255,6 +255,19 @@ void afs_put_read(struct afs_read *req)
 	}
 }
 
+static void afs_fetch_data_notify(struct afs_operation *op)
+{
+	struct afs_read *req = op->fetch.req;
+	int error = op->error;
+
+	if (error == -ECONNABORTED)
+		error = afs_abort_to_error(op->ac.abort_code);
+	req->error = error;
+
+	if (req->done)
+		req->done(req);
+}
+
 static void afs_fetch_data_success(struct afs_operation *op)
 {
 	struct afs_vnode *vnode = op->file[0].vnode;
@@ -263,6 +276,7 @@ static void afs_fetch_data_success(struct afs_operation *op)
 	afs_vnode_commit_status(op, &op->file[0]);
 	afs_stat_v(vnode, n_fetches);
 	atomic_long_add(op->fetch.req->actual_len, &op->net->n_fetch_bytes);
+	afs_fetch_data_notify(op);
 }
 
 static void afs_fetch_data_put(struct afs_operation *op)
@@ -276,6 +290,7 @@ static const struct afs_operation_ops afs_fetch_data_operation = {
 	.issue_yfs_rpc	= yfs_fs_fetch_data,
 	.success	= afs_fetch_data_success,
 	.aborted	= afs_check_for_remote_deletion,
+	.failed		= afs_fetch_data_notify,
 	.put		= afs_fetch_data_put,
 };
 
diff --git a/fs/afs/fs_operation.c b/fs/afs/fs_operation.c
index 97cab12b0a6c..938e28a00101 100644
--- a/fs/afs/fs_operation.c
+++ b/fs/afs/fs_operation.c
@@ -195,8 +195,10 @@ void afs_wait_for_operation(struct afs_operation *op)
 	case -ECONNABORTED:
 		if (op->ops->aborted)
 			op->ops->aborted(op);
-		break;
+		fallthrough;
 	default:
+		if (op->ops->failed)
+			op->ops->failed(op);
 		break;
 	}
 
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 31e6b3635541..5e34f4dbd385 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -392,9 +392,6 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		break;
 	}
 
-	if (req->done)
-		req->done(req);
-
 	_leave(" = 0 [done]");
 	return 0;
 }
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index daf5339ae316..d46389406021 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -742,6 +742,7 @@ struct afs_operation_ops {
 	void (*issue_yfs_rpc)(struct afs_operation *op);
 	void (*success)(struct afs_operation *op);
 	void (*aborted)(struct afs_operation *op);
+	void (*failed)(struct afs_operation *op);
 	void (*edit_dir)(struct afs_operation *op);
 	void (*put)(struct afs_operation *op);
 };
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 363d6dd276c0..2b35cba8ad62 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -449,9 +449,6 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		break;
 	}
 
-	if (req->done)
-		req->done(req);
-
 	_leave(" = 0 [done]");
 	return 0;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

